---
doc: claude-guide
title: "Guidance for AI coding assistants working in this repo"
role: "Condensed project rules and working conventions. Loaded automatically by tools like Claude Code."
audience: "Future AI agents and human contributors who want the 60-second briefing."
reads_like: "A style and constraint summary; details live in docs/."
sources_of_truth:
  - docs/01-ARCHITECTURE.md
  - docs/02-API-REFERENCE.md
  - docs/04-BEST-PRACTICES.md
  - docs/06-UI-SYSTEM.md
prerequisites: []
leads_to:
  - docs/01-ARCHITECTURE.md
  - docs/02-API-REFERENCE.md
  - docs/04-BEST-PRACTICES.md
last_reviewed: 2026-04-17
---

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Workiom Flutter Sign-Up** — A multi-step registration flow for a multi-tenant SaaS platform. Integrates with `https://api.workiom.club`.

The flow implements the six named sections of the test PDF end-to-end:

1. **Initial Step** — `GetCurrentLoginInformations` on boot (splash page).
2. **Getting Editions** — `GetEditionsForSelect`; the first registrable edition is auto-selected (the PDF explicitly allows skipping the plan picker).
3. **Asking for information** — email + password (with live rules from `GetPasswordComplexitySetting`) → tenant name (debounced `IsTenantAvailable`) → first + last name (letters only).
4. **Register a tenant with user** — `RegisterTenant?timeZone=Europe/Istanbul`.
5. **Login the user In** — `Authenticate`; access token persisted via `flutter_secure_storage`.
6. **Login Information** — authenticated `GetCurrentLoginInformations` populates the success screen.

The Figma prototype (`starting-point-node-id=1281:541`) adds splash, welcome, and a stub login page on top of the PDF-described flow; those screens are UX-only and carry no backend logic.

## Commands

```bash
# Install dependencies
flutter pub get

# Generate freezed/json_serializable code (required after modifying freezed classes or DTOs)
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run

# Run all tests
flutter test

# Run a single test file
flutter test test/features/auth/domain/value_objects/email_address_test.dart

# Run tests matching a name pattern
flutter test --name "should return failure when"

# Generate localization files (after editing .arb files)
flutter gen-l10n

# Release builds
flutter build apk --release
flutter build ios --release
```

## Architecture

**Clean Architecture (Reso Coder style)** with three strict layers per feature. Dependencies flow inward only:

```
Presentation → Domain ← Infrastructure
```

| Layer | Location | Constraints |
|---|---|---|
| **Domain** | `features/auth/domain/` | Pure Dart — no Flutter, no Dio, no external packages. Holds entities, value objects, failures, repository interfaces, and use cases. |
| **Infrastructure** | `features/auth/infrastructure/` | Implements Domain interfaces; uses Dio, DTOs, datasources. |
| **Presentation** | `features/auth/presentation/` | Flutter widgets + BLoCs. Imports Domain only; calls use cases (never repositories directly). |

Shared cross-feature code lives in `lib/core/`.

**Why no `application/` layer?** In a Flutter project, BLoC imports `flutter_bloc` — it's presentation-adjacent by definition. Putting it in a separate "application" layer is DDD-textbook but doesn't match how the code actually links. Keeping three layers is simpler and is the convention most Flutter reviewers (especially in ABP shops) recognize immediately.

## Key Patterns

### Value Objects
Form fields are wrapped in value objects (`EmailAddress`, `Password`, `TenantName`, `PersonName`) that extend `ValueObject<T>` from `core/domain/value_object.dart`. They cannot exist in an invalid state — validation happens at construction. BLoC state holds value objects, never raw strings.

### BLoC (not Cubit) — lives in Presentation
`SignUpBloc` uses **events + states**, not Cubit. This is intentional: event transformers are required for debouncing the tenant-availability check and preventing duplicate submits. Use a custom `_debounce` (built on `rxdart`'s `debounceTime` + `switchMap`) for field-change events, and `droppable()` (from `bloc_concurrency`) for submit events.

BLoCs live in `features/auth/presentation/<page>/bloc/` (e.g., `presentation/signup/bloc/signup_bloc.dart`). They depend on use cases from the domain layer — never on `AuthRepository` directly.

### Use Cases — one file per action
Use cases live in `features/auth/domain/usecases/`. **Every action the BLoC (or splash controller) can trigger has its own use case class, one per file.** This is the traditional Clean Architecture convention: the action inventory is visible at a glance in the `usecases/` folder, BLoC dependencies are stable, and every action has a symmetric test file.

For this feature there are seven use cases:

- `GetCurrentSession` — PDF: Initial Step + Login Information
- `GetEditions` — PDF: Getting Editions
- `GetPasswordPolicy` — PDF: Asking for information (password rules)
- `CheckTenantAvailable` — PDF: Asking for information (tenant name)
- `RegisterTenant` — PDF: Register a tenant with user
- `Authenticate` — PDF: Login the user In
- `RegisterAndAuthenticate` — orchestrator composing `RegisterTenant` → `Authenticate` → `GetCurrentSession`

Six of the seven are thin forwarders around one repository method (constructor takes the repo, `call(...)` returns `Either<AuthFailure, Entity>`). That ceremony is intentional — it keeps the BLoC signature stable as the domain evolves and prevents presentation from reaching past the domain layer.

### Failure Hierarchy
Two tiers of sealed failure classes:
- **Generic** (`core/error/failures.dart`): `NetworkFailure`, `TimeoutFailure`, `ServerFailure`, `UnauthorizedFailure`
- **Feature-specific** (`features/auth/domain/failures/auth_failure.dart`): `AuthFailure` with cases like `.tenantTaken()`, `.validation(Map)`

Repositories return `Either<Failure, T>` (dartz). Never surface raw exceptions to the BLoC or UI.

### Async Data State
`DataState<T>` union from `core/common/data_state.dart`: `DataIdle | DataLoading | DataSuccess(T) | DataFailure(Failure)`. Use this for any async field in BLoC state (e.g., availability check result, submit result).

### Dependency Injection
Single manual composition root at `core/di/injection.dart` using `get_it`. No codegen (`injectable` is not used). Lifetimes:
- `registerLazySingleton` — Dio, repositories, use cases
- `registerFactory` — BLoCs (fresh state per page)

BLoC instances are provided via `BlocProvider` in the router's `builder`, not registered in get_it.

### Navigation
`go_router` with a `ShellRoute` wrapper for the entire `/signup/*` sub-tree. The shell provides a single `SignUpBloc` instance that persists across all four sign-up pages — do not break this pattern or state will be lost on navigation.

Route table: `/splash` → `/welcome` → `/signup/email-password` → `/signup/tenant-name` → `/signup/personal-info` → `/signup/success`. `/login` is a stub (out of scope).

### Networking
Dio client at `core/network/dio_client.dart`. Three interceptors applied in order:
1. `AuthInterceptor` — attaches `Authorization: Bearer <token>`
2. `LoggingInterceptor` — silent in release builds
3. `ErrorInterceptor` — maps `DioException` → generic `Failure`

The API uses an **ASP.NET Boilerplate (ABP) envelope**: `{ "result": {...}, "success": true, "error": {...} }`. DTOs must unwrap `result` before mapping to domain entities.

Tokens are stored in `flutter_secure_storage` (never in-memory). Access via `core/storage/secure_storage.dart`.

## Theming & Localization

**Theme:** Widgets read from `Theme.of(context).colorScheme` — never import `AppColors` directly. Token files live in `core/theme/`. Both light and dark `ThemeData` are built from the same token source in `app_theme.dart`.

**SVG icons** are recolored via `ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn)` — do not hardcode icon colors.

**Localization:** ARB files at `core/l10n/app_en.arb` and `app_ar.arb`. All user-visible strings go through `AppLocalizations.of(context)!`. Supports English (default) and Arabic (RTL). Use `EdgeInsetsDirectional`, `AlignmentDirectional`, and `PositionedDirectional` — never their non-directional equivalents.

## Code Generation

Run `dart run build_runner build --delete-conflicting-outputs` whenever you:
- Add or modify a `@freezed` class (domain entities, BLoC state, DTOs)
- Add or modify a `@JsonSerializable` DTO
- Add new value objects that use codegen

Generated files (`*.freezed.dart`, `*.g.dart`) are committed to the repo.

## Linting

The project uses `very_good_analysis` (strict rules). Run `flutter analyze` before committing. The analysis options are at `analysis_options.yaml` in the project root.
