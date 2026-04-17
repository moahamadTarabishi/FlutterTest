---
doc: readme
title: "Workiom Flutter Sign-Up — Overview"
role: "Entry point: what the app does, tech stack, how to run it, where to read next."
audience: "Reviewer (first file they open) and any contributor new to the repo."
reads_like: "A tour; the links inside take you to depth."
sources_of_truth:
  - "Test PDF — Workiom Flutter Technical Test"
  - "Figma file https://www.figma.com/file/KVVFSCqrG1Auh3OLSSuhh0/"
  - "Figma prototype https://www.figma.com/proto/KVVFSCqrG1Auh3OLSSuhh0/Flutter-Test (starting-point-node-id=1281:541)"
  - "Base URL https://api.workiom.club"
prerequisites: []
leads_to:
  - docs/01-ARCHITECTURE.md
  - docs/02-API-REFERENCE.md
  - docs/03-ROADMAP.md
  - docs/04-BEST-PRACTICES.md
  - docs/05-SUBMISSION-CHECKLIST.md
  - docs/06-UI-SYSTEM.md
  - CLAUDE.md
last_reviewed: 2026-04-17
---

# Workiom — Flutter Sign-Up (Technical Test)

A fully functioning sign-up flow for the Workiom multi-tenant SaaS platform, built in Flutter and matching the provided Figma design. Works on both iOS and Android.

> This repository is my submission for the Workiom Flutter Technical Test.

## What this app does

The app implements the multi-step registration flow described in the test PDF, against the Workiom API. The steps below mirror the PDF's six named sections:

1. **Initial Step** — `GetCurrentLoginInformations`. If the user is null, the flow proceeds to sign-up.
2. **Getting Editions** — `GetEditionsForSelect`. The PDF permits auto-selecting the first edition rather than rendering a plan picker; this submission does exactly that.
3. **Asking for information — email + password** — the password rules come from `GetPasswordComplexitySetting` and drive a live validation checklist.
4. **Asking for information — tenant name** — checked with `IsTenantAvailable` on change (debounced). Names start with a letter and contain only letters, digits, or dashes.
5. **Asking for information — first + last name** — letters only, per the PDF.
6. **Register a tenant with user** — `RegisterTenant?timeZone=Europe/Istanbul` with the admin info + edition id.
7. **Login the user In** — `Authenticate` returns the access token; stored via `flutter_secure_storage`.
8. **Login Information** — authenticated `GetCurrentLoginInformations` populates the success screen.

## Tech stack

| Concern            | Choice                                                         |
| ------------------ | -------------------------------------------------------------- |
| Language           | Dart (stable Flutter 3.x)                                      |
| Architecture       | Clean Architecture — three layers (domain / infrastructure / presentation) |
| State management   | `flutter_bloc` — event-driven BLoC (not Cubit)                 |
| Structure          | Top-level split: `core/` + `features/`                         |
| Networking         | `dio` with logging, auth, and error interceptors               |
| Models             | `freezed` + `json_serializable` (DTOs in `infrastructure/`)    |
| Dependency inject. | `get_it` only — manual registration in a single composition root |
| Routing            | `go_router` with auth-aware redirects                          |
| Secure storage     | `flutter_secure_storage` (auth token)                          |
| Form validation    | Domain value objects (`EmailAddress`, `Password`, `TenantName`) |
| Theming            | `ThemeData.light()` + `.dark()` driven by system `ThemeMode`   |
| Localization       | `flutter_localizations` + `intl` with ARB files (EN + AR/RTL)  |
| Icons              | SVG exports from Figma, rendered via `flutter_svg`             |
| Linting            | `very_good_analysis`                                           |
| Testing            | `flutter_test`, `mocktail`, `bloc_test`                        |

See [`docs/01-ARCHITECTURE.md`](docs/01-ARCHITECTURE.md) for architecture and [`docs/06-UI-SYSTEM.md`](docs/06-UI-SYSTEM.md) for theming, localization, and icons.

## Getting started

```bash
# 1. Install dependencies
flutter pub get

# 2. Generate freezed / json_serializable code
dart run build_runner build --delete-conflicting-outputs

# 3. Run on a connected device or simulator
flutter run
```

Base URL is configured in `lib/core/constants/api_constants.dart` and points to `https://api.workiom.club`.

## Project layout

```
lib/
  core/                         Cross-cutting: network, theme, l10n, DI, storage, widgets
  features/
    auth/
      domain/                   Pure Dart — entities, value objects, failures, repo interfaces, usecases
      infrastructure/           DTOs, Dio datasource, repository implementation
      presentation/             Flutter UI + BLoCs — one folder per screen concept
        splash/                 splash_page.dart
        welcome/                welcome_page.dart
        login/                  bloc/ + login_page.dart
        signup/                 bloc/ + signup_email_password_page.dart, signup_tenant_name_page.dart, signup_success_page.dart
        personal_info/          personal_info_page.dart
        widgets/                Shared across login/signup/personal_info flows
  app.dart                      Root widget, theme + l10n wiring, router
  main.dart                     Entry point, DI bootstrap
docs/                           Architecture, API reference, roadmap, checklist, UI system
test/                           Unit & widget tests mirroring the three-layer tree
```

Full breakdown, naming conventions, and layer rules in [`docs/01-ARCHITECTURE.md`](docs/01-ARCHITECTURE.md).

## Documentation index

Each doc carries a YAML front matter block (`doc:`, `role:`, `audience:`, `prerequisites:`, `leads_to:`) so the set reads as a connected suite. The table below is the short version of that graph:

| Doc | What's in it | Read after |
| --- | --- | --- |
| [`README.md`](README.md) | Entry point, tech stack, quick-start, doc map | — |
| [`CLAUDE.md`](CLAUDE.md) | 60-second briefing for AI assistants and new contributors | README |
| [`docs/01-ARCHITECTURE.md`](docs/01-ARCHITECTURE.md) | Clean Architecture layers, core/feature split, BLoC pattern, DI, **PDF phase → code map** | README |
| [`docs/02-API-REFERENCE.md`](docs/02-API-REFERENCE.md) | Every endpoint used, with request/response shapes and PDF-literal wording | 01-Architecture |
| [`docs/03-ROADMAP.md`](docs/03-ROADMAP.md) | Day-by-day implementation plan (Day 0 recon → Day 6 ship) | 01, 02 |
| [`docs/04-BEST-PRACTICES.md`](docs/04-BEST-PRACTICES.md) | Dependency pinning, analyzer config, BLoC rules | 01 |
| [`docs/06-UI-SYSTEM.md`](docs/06-UI-SYSTEM.md) | Theme (light + dark), localization (EN + AR/RTL), SVG icon pipeline | 01 |
| [`docs/05-SUBMISSION-CHECKLIST.md`](docs/05-SUBMISSION-CHECKLIST.md) | Final gate before emailing the APK; mirrors the PDF's own test criteria | 03, 04, 06 |

```
README → 01-ARCHITECTURE → 02-API-REFERENCE → 03-ROADMAP ──┐
      ↘         ↓                   ↓                      ↓
      CLAUDE    04-BEST-PRACTICES   06-UI-SYSTEM           05-SUBMISSION-CHECKLIST
```

## Build & submission

```bash
# Release APK for Android
flutter build apk --release
# → build/app/outputs/flutter-apk/app-release.apk

# iOS release (on macOS)
flutter build ios --release
```

The release APK is submitted to `irfan.ozdemir@workiom.com` per the test instructions.

## Test criteria (from the PDF, verbatim)

- [ ] The sign-up process is working, and a tenant can be created using it.
- [ ] The design matches the Figma file shared.
- [ ] Works on both iOS and Android.
- [ ] The `.apk` package for Android is submitted to `irfan.ozdemir@workiom.com`.
- [ ] The GitHub repository for the project is publicly shared.

## License

MIT — this is a technical test submission; use freely.
