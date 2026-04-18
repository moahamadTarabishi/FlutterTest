---
doc: 07-implementation-plan
title: "Implementation Plan — Phased build with input/output gates at every step"
role: "Execution-time companion to the roadmap. Each phase has explicit inputs, outputs, verification, and a go/no-go gate before the next phase begins. Self-contained: all code snippets, regexes, signatures, and DI wiring are inlined."
audience: "The person building the submission, working through it in order. Also the reviewer wanting to see how quality was enforced phase by phase."
reads_like: "A sequential phase guide — do Phase N, verify the outputs, pass the gate, only then start Phase N+1."
pdf_sections_covered:
  - "Initial Step"
  - "Getting Editions"
  - "Asking for information (email+password, tenant name, first/last name)"
  - "Register a tenant with user"
  - "Login the user In"
  - "Login Information"
prerequisites:
  - README.md
  - docs/01-ARCHITECTURE.md
  - docs/02-API-REFERENCE.md
  - docs/03-ROADMAP.md
leads_to:
  - docs/05-SUBMISSION-CHECKLIST.md
related:
  - docs/04-BEST-PRACTICES.md
  - docs/06-UI-SYSTEM.md
  - CLAUDE.md
last_reviewed: 2026-04-18
conflicts_resolved:
  - "A: /home route dropped — authed cold-start lands on /signup/success"
  - "B: TenantAvailability definition moved to domain layer (not presentation/signup/bloc/); presentation imports it"
  - "C: AuthRepository gets Stream<AuthStatus> get authStatus for go_router redirect"
  - "D: Authenticate use-case param is tenancyName (matches API body field, not tenantName)"
  - "E: ServerFailure.validationErrors is Map<String, List<String>>?; AuthFailure.validation is Map<String, String> — deliberately different shapes at two layers"
  - "F: SubmissionStatus is a plain enum (no payload); UserSession? is a separate SignUpState field"
  - "G: iOS build is recommended but skippable on non-Mac machines"
  - "H: 7 named pages + ShellRoute parent + widgets/ folder (not 8 pages)"
  - "I: _debounce transformer is custom rxdart; droppable() is from bloc_concurrency — two different sources"
  - "J: Compressed-time guide uses roadmap's 5 never-skip items"
---

# 07 — Implementation Plan

A phased build where every phase is **Inputs → Tasks → Outputs → Verification → Gate**. [`03-ROADMAP.md`](03-ROADMAP.md) gives the same work in calendar form; this doc gives it in quality-gate form. Work through the phases in order — do not start Phase N+1 until Phase N's gate is cleared.

This doc is **self-contained**: every regex, code snippet, DTO field name, DI wiring call, and API gotcha is inlined. You should be able to execute the full build reading only this file.

## Phase map

| # | Phase | Roadmap day | Exit gate |
|---|---|---|---|
| 0 | Reconnaissance | Day 0 | Repo exists; PDF, Figma, and all four endpoints curl'd; fixtures saved. |
| 1 | Scaffold & core infrastructure | Day 1 | App launches blank; theme, locale, SVG, DI, Dio, storage all wired; `flutter analyze` clean. |
| 2 | Domain layer | Day 2a | `features/auth/domain/` complete; value-object tests green; zero Flutter/Dio imports in domain. |
| 3 | Infrastructure layer + CLI smoke | Day 2b | CLI driver creates a real tenant on `api.workiom.club` end-to-end. |
| 4 | Presentation shell | Day 3 | Every screen matches Figma in light + dark + EN + AR; reviewer can click through without crashes. |
| 5 | BLoC & state | Day 4a | `SignUpBloc` compiles and `bloc_test`s for initial state + each event are green. |
| 6 | PDF flow integration | Day 4b | Full sign-up against live API creates a real tenant and shows authed user on success screen. |
| 7 | Polish & QA | Day 5 | Theme/locale/a11y walks pass; tests green; Figma pixel diff ≤ small. |
| 8 | Ship | Day 6 | Release APK + public repo + email to `irfan.ozdemir@workiom.com`. |

Phase 6 is the one that maps directly onto the PDF's six named sections and is itself broken into sub-phases (6.1 through 6.6). Every other phase is architectural scaffolding around it.

---

## Global invariants

These rules are enforced in **every phase**. Each Gate section below calls them out by number. Run the grep commands listed after any commit to catch violations early.

| # | Rule |
|---|---|
| 1 | Domain has zero imports of `package:flutter`, `package:dio`, `package:json_annotation`, `package:equatable`. |
| 2 | Presentation reads colors only from `Theme.of(context).colorScheme` — never `AppColors` directly. |
| 3 | Every user-facing string goes through `AppLocalizations.of(context)!`. |
| 4 | Horizontal insets use `EdgeInsetsDirectional`, `AlignmentDirectional`, `PositionedDirectional` only. |
| 5 | SVG source files use `fill="currentColor"`; tinted in code via `ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn)`. |
| 6 | Theme uses `surfaceContainerHighest` + `onSurfaceVariant` — NOT the deprecated `surfaceVariant`. |
| 7 | ABP `{result, success, error}` envelope is unwrapped inside the datasource; domain never sees the envelope. |
| 8 | Repositories return `Either<Failure, T>`; BLoCs receive use cases, never repositories. |
| 9 | Value objects extend `ValueObject<T>`; BLoC state holds value objects, never raw `String`s. |
| 10 | Sign-up uses BLoC + events (not Cubit); `_debounce` is a custom rxdart one-liner; `droppable()` is from `bloc_concurrency`. |
| 11 | Tokens live in `flutter_secure_storage` only — never in-memory, never `SharedPreferences`. |
| 12 | Run `dart run build_runner build --delete-conflicting-outputs` after any `@freezed` or `@JsonSerializable` file change. |
| 13 | **No** `equatable`, **no** `flutter_timezone`, **no** `injectable` anywhere in the project. |
| 14 | Pin exact versions (`no ^`) in `pubspec.yaml` on the final submission commit; commit `pubspec.lock`. |

**Grep commands for CI-style enforcement:**

```bash
# Invariant #1 — domain purity
grep -R "package:flutter\|package:dio\|package:json_annotation\|package:equatable" \
  lib/core/domain lib/core/error lib/core/common lib/features/auth/domain

# Invariant #2 — no direct AppColors in widgets
grep -R "AppColors\." lib/features/auth/presentation

# Invariant #4 — no non-directional horizontal insets
grep -R "EdgeInsets\.only(left\|EdgeInsets\.only(right\|EdgeInsets\.symmetric(horizontal" \
  lib/features/auth/presentation

# Invariant #13 — forbidden dependencies
grep -E "equatable|flutter_timezone|injectable" pubspec.yaml
```

---

## Phase 0 — Reconnaissance

**Goal.** Understand the PDF, the Figma, and the API before writing any code.

**Inputs.**

| Input | Source |
|---|---|
| Test PDF | Provided email attachment |
| Figma design + prototype | Node `1281:541` is the prototype starting point |
| Live Workiom app | Play Store / App Store — the PDF says *"Feel free to cheat by signing-up to the current workiom app"* |
| API base URL | `https://api.workiom.club` |

**Tasks.**

- [ ] Read the test PDF end to end. Memorize the six named sections verbatim: **Initial Step**, **Getting Editions**, **Asking for information**, **Register a tenant with user**, **Login the user In**, **Login Information**.
- [ ] Install the live Workiom app and complete a real sign-up. Screenshot every screen, note every error path and keyboard transition.
- [ ] Walk the Figma prototype from node `1281:541` in order. Screenshot every frame in light + dark mode. Target: **8 screens × {light, dark} × {en, ar} = 32 images** archived to `NOTES/screenshots/`.
- [ ] Reconcile PDF vs Figma: list frames the PDF doesn't describe (splash, welcome, login stub) and mark them "UX-only, no backend logic."
- [ ] Extract design tokens for both themes: colors (paired light + dark), text styles, spacing, border radii, button heights.
- [ ] Export every icon from Figma as SVG (format: `SVG`, include "Outline stroke" if needed) into `assets/icons/` with `snake_case` filenames. Verify each opens in a preview — they must use `fill="currentColor"` or be patchable.
- [ ] Hit each endpoint with `curl` and save the **raw JSON response** both to `NOTES.md` and as a fixture file under `test/fixtures/` (used by Phase 3 DTO tests):

```bash
# Initial Step / Login Information
curl -s https://api.workiom.club/api/services/app/Session/GetCurrentLoginInformations \
  > test/fixtures/get_current_login_informations.json

# Getting Editions
curl -s https://api.workiom.club/api/services/app/TenantRegistration/GetEditionsForSelect \
  > test/fixtures/get_editions_for_select.json

# Password Policy
curl -s https://api.workiom.club/api/services/app/Profile/GetPasswordComplexitySetting \
  > test/fixtures/get_password_complexity_setting.json

# Tenant Availability (POST)
curl -s -X POST https://api.workiom.club/api/services/app/Account/IsTenantAvailable \
  -H "Content-Type: application/json" \
  -d '{"tenancyName":"test-name"}' \
  > test/fixtures/is_tenant_available.json
```

> **API gotchas to record in NOTES.md (memorize these before Phase 3):**
> - `Authenticate` endpoint lives under `/api/TokenAuth/Authenticate`, **not** `/api/services/app/`.
> - `RegisterTenant` sends `timeZone=Europe/Istanbul` as a **query param**; `Authenticate` sends `ianaTimeZone: 'Europe/Istanbul'` as a **body field**. Same constant, two spellings, two placements.
> - `captchaResponse: null` must be **sent explicitly** — do not omit the key.
> - `editionId` is an `int`, not a string — the PDF writes it in quotes but the wire type is a number.
> - `tenantId == null` in the `IsTenantAvailable` response means the name is **free** (counterintuitive — read the PDF quote verbatim).
> - `Abp.TenantId` header: not needed for this flow. Add it only if a post-registration call surfaces a 401/403 the Bearer token alone doesn't resolve.

- [ ] Create a public GitHub repo and clone it locally.

**Outputs.**

| Artifact | Location |
|---|---|
| `NOTES.md` — PDF summary, Figma screenshots, raw API responses | repo root |
| Design token inventory (light + dark) | `NOTES.md` |
| SVG icons | `assets/icons/` |
| API fixture files | `test/fixtures/` |
| Empty GitHub repo, cloned | local |

**Verification.**

- Recite the six PDF sections from memory without looking.
- `NOTES.md` has at least one real ABP envelope response per endpoint.
- Every Figma frame has a light and dark screenshot.
- `test/fixtures/` has four `.json` files.

**Gate to Phase 1.**

- [ ] Public GitHub repo exists and is cloned.
- [ ] `NOTES.md` has real curl output for all four endpoints.
- [ ] `test/fixtures/` has four JSON fixtures.
- [ ] SVG icons are on disk, open correctly in a preview, and use `fill="currentColor"`.
- [ ] You can describe the diff between every adjacent Figma frame pair without reopening the prototype.

---

## Phase 1 — Scaffold & core infrastructure

**Goal.** An empty, themed, localized Flutter app that boots to a blank page with every cross-cutting concern wired so features can plug in without re-touching `main.dart`.

**Inputs.**

| Input | From |
|---|---|
| SVG icons, design tokens, API URL | Phase 0 |
| Tech stack versions | Below |
| Folder structure | [`01-ARCHITECTURE.md`](01-ARCHITECTURE.md) |

**Tasks.**

- [ ] `flutter create workiom_signup --org com.yourname --platforms=ios,android`

- [ ] Add to `pubspec.yaml`. Use these exact versions during development — strip `^` on the submission commit:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  flutter_bloc: ^8.1.3
  bloc_concurrency: ^0.2.4
  rxdart: ^0.27.7
  dio: ^5.4.0
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1
  dartz: ^0.10.1
  get_it: ^7.6.4
  go_router: ^13.0.0
  flutter_secure_storage: ^9.0.0
  flutter_svg: ^2.0.9
  intl: ^0.19.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  very_good_analysis: ^5.1.0
  build_runner: ^2.4.7
  freezed: ^2.5.2        # 2.5.x minimum — required for sealed class syntax
  json_serializable: ^6.7.1
  mocktail: ^1.0.1
  bloc_test: ^9.1.5
```

- [ ] `analysis_options.yaml` — apply the full strict config:

```yaml
include: package:very_good_analysis/analysis_options.yaml

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
  language:
    strict-casts: true
    strict-inference: true
    strict-raw-types: true

linter:
  rules:
    prefer_single_quotes: true
    always_declare_return_types: true
    sort_pub_dependencies: true
```

Fix every lint on the generated scaffold before writing anything new.

- [ ] Create the Clean Architecture tree (with placeholder files so git tracks the layout). See `01-ARCHITECTURE.md` for the full tree. Key: **no `application/` folder**; `core/` + `features/auth/{domain,infrastructure,presentation}/`.

- [ ] Build `core/theme/` — typography scale and `AppTheme.light()` / `.dark()`:

```dart
// core/theme/app_typography.dart
static TextTheme textTheme(Color onSurface, Color onSurfaceMuted) => TextTheme(
  displayLarge: TextStyle(fontFamily: 'Inter', fontSize: 32, fontWeight: FontWeight.w700, color: onSurface),
  titleLarge:   TextStyle(fontFamily: 'Inter', fontSize: 22, fontWeight: FontWeight.w600, color: onSurface),
  bodyLarge:    TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w400, color: onSurface),
  bodyMedium:   TextStyle(fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w400, color: onSurfaceMuted),
  labelLarge:   TextStyle(fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w600, color: onSurface),
);
```

  Register the Inter font in `pubspec.yaml` (`assets/fonts/Inter-Regular.ttf`, `Inter-Medium.ttf` w:500, `Inter-SemiBold.ttf` w:600, `Inter-Bold.ttf` w:700).

  `ThemeData` uses `surfaceContainerHighest` — NOT the deprecated `surfaceVariant` (invariant #6). Pattern from `app_theme.dart`:

```dart
colorScheme: const ColorScheme.light(
  primary: AppColors.brandPrimary,
  surface: AppColors.lightSurface,
  onSurface: AppColors.lightTextPrimary,
  onSurfaceVariant: AppColors.lightTextSecondary,  // muted text
  surfaceContainerHighest: AppColors.lightBorder,  // NOT surfaceVariant
  ...
),
```

- [ ] Build `core/l10n/` — `app_en.arb`, `app_ar.arb` with placeholder keys; `l10n.yaml`; run `flutter gen-l10n` and wire delegates + `supportedLocales` in `MaterialApp`.

- [ ] Build `core/network/` — **DI ordering matters** (see Appendix B):
  1. `SecureStorage` registered first.
  2. `AuthInterceptor(getIt<SecureStorage>())` — attaches `Authorization: Bearer <token>` (see interceptor sketch in `02-API-REFERENCE.md`).
  3. `LoggingInterceptor()` — silent in release.
  4. `ErrorInterceptor()` — maps `DioException → Failure` (see exact `switch` in `04-BEST-PRACTICES.md §6`).
  5. `DioClient.create(baseUrl: ApiConstants.baseUrl, interceptors: [auth, logging, error])`.

- [ ] Build `core/storage/secure_storage.dart` — thin wrapper around `flutter_secure_storage`. Expose `readAuthToken()`, `writeAuthToken(String)`, `clearAuthToken()`.

- [ ] Build `core/di/injection.dart` — composition root. Register storage + Dio only in Phase 1; feature registrations come in Phases 2–3. See Appendix B for the full ordering graph.

- [ ] Declare `assets/icons/` and `assets/fonts/` in `pubspec.yaml`. Build `core/widgets/app_icon.dart`:

```dart
class AppIcon extends StatelessWidget {
  const AppIcon(this.assetPath, {
    super.key,
    this.size = 24,
    this.semanticsLabel,    // null → excludeFromSemantics: true (decorative)
  });

  final String assetPath;
  final double size;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    assetPath,
    width: size,
    height: size,
    colorFilter: ColorFilter.mode(
      Theme.of(context).colorScheme.onSurface,
      BlendMode.srcIn,    // invariant #5
    ),
    semanticsLabel: semanticsLabel,
    excludeFromSemantics: semanticsLabel == null,
  );
}
```

  For icon-only interactive widgets (buttons with no visible label) use `AppIcon` with a `semanticsLabel` so VoiceOver / TalkBack can read it.

- [ ] `main.dart` bootstrap:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const WorkiomApp());
}
```

**Outputs.**

| Artifact | Location |
|---|---|
| `pubspec.yaml` with versioned deps | repo root |
| `analysis_options.yaml` strict config | repo root |
| Clean Architecture folder tree with placeholders | `lib/core/` + `lib/features/auth/` |
| `AppTheme.light()` / `.dark()` | `lib/core/theme/app_theme.dart` |
| ARB files, `l10n.yaml` | `lib/core/l10n/` |
| Dio client + three interceptors | `lib/core/network/` |
| `SecureStorage` | `lib/core/storage/secure_storage.dart` |
| `configureDependencies()` (partial) | `lib/core/di/injection.dart` |
| `AppIcon` + SVG assets | `lib/core/widgets/app_icon.dart`, `assets/icons/` |

**Verification.**

- `flutter run` launches a blank scaffold with brand color.
- Toggling system dark mode repaints the app immediately.
- Switching device language to Arabic mirrors layout to RTL with placeholder copy.
- One SVG renders via `AppIcon` and changes tint when flipping theme.
- `flutter analyze` → 0 warnings.
- `grep -E "equatable|flutter_timezone|injectable" pubspec.yaml` → 0 matches (invariant #13).

**Gate to Phase 2.**

- [ ] `flutter run` works on one Android device or emulator.
- [ ] Theme flip and locale flip both work end-to-end.
- [ ] At least one SVG renders with theme-aware coloring.
- [ ] `flutter analyze` = 0 warnings, 0 errors.
- [ ] Commit pushed: `chore: Clean Architecture scaffold with theme, l10n, SVG pipeline, network, and DI`.

---

## Phase 2 — Domain layer

**Goal.** Pure-Dart contracts for the entire auth feature. No Flutter, no Dio. Zero imports outside the domain.

**Inputs.**

| Input | From |
|---|---|
| Scaffolded `core/` and empty `features/auth/domain/` | Phase 1 |
| PDF wording for each field | Phase 0 NOTES.md |
| Architecture rules | [`01-ARCHITECTURE.md`](01-ARCHITECTURE.md) |

**Tasks.**

### Core domain

- [ ] `core/domain/value_object.dart` — base class (inline verbatim):

```dart
// core/domain/value_object.dart
@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  /// Only call at trust boundaries — throws [UnexpectedValueError] if invalid.
  T getOrCrash() => value.fold((f) => throw UnexpectedValueError(f), id);

  bool get isValid => value.isRight();

  @override
  bool operator ==(Object other) =>
      other is ValueObject<T> && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
```

  Note: `id` is dartz's identity function; `UnexpectedValueError` is a thin `Error` subclass you define locally.

- [ ] `core/error/failures.dart` — sealed generic failures:

```dart
@freezed
sealed class Failure with _$Failure {
  const factory Failure.network() = NetworkFailure;
  const factory Failure.timeout() = TimeoutFailure;
  const factory Failure.server({
    required int code,
    String? message,
    Map<String, List<String>>? validationErrors,   // List<String> per field — different from AuthFailure.validation
  }) = ServerFailure;
  const factory Failure.unauthorized() = UnauthorizedFailure;
  const factory Failure.unknown() = UnknownFailure;
}
```

- [ ] `core/common/data_state.dart` — in-house async state union (do not use Riverpod's `AsyncValue` — invariant #10):

```dart
// core/common/data_state.dart
@freezed
sealed class DataState<T> with _$DataState<T> {
  const factory DataState.idle() = DataIdle<T>;
  const factory DataState.loading() = DataLoading<T>;
  const factory DataState.success(T data) = DataSuccess<T>;
  const factory DataState.failure(Failure failure) = DataFailure<T>;
}
```

### Feature domain — value objects

- [ ] `features/auth/domain/value_objects/email_address.dart`:

```dart
class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) => EmailAddress._(_validate(input));
  const EmailAddress._(this.value);

  /// Const sentinel — safe for [@Default] in freezed state.
  const EmailAddress.pure()
      : value = const Left(ValueFailure<String>.empty());

  @override
  final Either<ValueFailure<String>, String> value;

  static Either<ValueFailure<String>, String> _validate(String input) {
    if (input.isEmpty) return const Left(ValueFailure<String>.empty());
    final regex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
    return regex.hasMatch(input)
        ? Right(input)
        : Left(ValueFailure.invalidEmail(failedValue: input));
  }
}
```

- [ ] `features/auth/domain/value_objects/tenant_name.dart` — PDF: *"Tenant names should start with a letter and can contain numbers and dashes."* Input is **lowercased before validation** because it becomes a DNS subdomain:

```dart
static final _tenantRegex = RegExp(r'^[a-z][a-z0-9-]*$');

factory TenantName(String input) {
  final normalized = input.toLowerCase().trim();
  return TenantName._(_validate(normalized));
}

static Either<ValueFailure<String>, String> _validate(String input) {
  if (input.isEmpty) return const Left(ValueFailure<String>.empty());
  if (input.length < 2 || input.length > 63) return Left(ValueFailure.invalidLength(failedValue: input));
  return _tenantRegex.hasMatch(input)
      ? Right(input)
      : Left(ValueFailure.invalidTenantName(failedValue: input));
}
```

- [ ] `features/auth/domain/value_objects/person_name.dart` — PDF: *"It should be Letters only."* Use Unicode letter matching so non-ASCII names (e.g., `María`) are accepted; reject apostrophes, hyphens, digits, and spaces:

```dart
static final _nameRegex = RegExp(r'^\p{L}+$', unicode: true);

factory PersonName(String input) {
  final trimmed = input.trim();
  return PersonName._(_validate(trimmed));
}
```

  Rejection examples: `O'Brien` (apostrophe), `Jean-Luc` (hyphen), `A1ex` (digit). `María`, `محمد` are accepted.

- [ ] `features/auth/domain/value_objects/password.dart` — injected `PasswordPolicy`; never hardcode rules:

```dart
class Password extends ValueObject<String> {
  factory Password(String input, PasswordPolicy policy) =>
      Password._(_validate(input, policy));
  const Password.pure() : value = const Left(ValueFailure<String>.empty());
  // ...
}
```

### Feature domain — entities, failures, repository, TenantAvailability

- [ ] `features/auth/domain/entities/` — `@freezed` entities: `Edition`, `PasswordPolicy`, `UserSession`, `RegisteredTenant`, `AuthToken`.

- [ ] `features/auth/domain/value_objects/tenant_availability.dart` — **defined in domain** (not in the presentation state file, so the use case can import it without a cross-layer dependency):

```dart
// features/auth/domain/value_objects/tenant_availability.dart
enum TenantAvailabilityStatus { available, taken }

// The richer presentation-layer sealed class is defined in signup_state.dart
// and maps from this domain type + local UI state (unknown, checking).
```

- [ ] `features/auth/domain/failures/auth_failure.dart`:

```dart
@freezed
sealed class AuthFailure with _$AuthFailure {
  const factory AuthFailure.generic(Failure failure) = _Generic;
  const factory AuthFailure.tenantTaken() = _TenantTaken;
  const factory AuthFailure.invalidCredentials() = _InvalidCredentials;
  const factory AuthFailure.validation(Map<String, String> fieldErrors) = _Validation;
  // Map<String, String> — first error per field. Contrast: core Failure.server uses Map<String, List<String>>.
}
```

- [ ] `features/auth/domain/repositories/auth_repository.dart` — abstract interface with **7 members** (6 async methods + 1 auth-status stream for the go_router redirect):

```dart
abstract class AuthRepository {
  // For go_router redirect — emits AuthStatus.authenticated after token persist.
  Stream<AuthStatus> get authStatus;

  Future<Either<AuthFailure, UserSession?>> getCurrentSession();
  Future<Either<AuthFailure, List<Edition>>> getEditions();
  Future<Either<AuthFailure, PasswordPolicy>> getPasswordPolicy();
  Future<Either<AuthFailure, TenantAvailabilityStatus>> checkTenantAvailable(TenantName name);
  Future<Either<AuthFailure, RegisteredTenant>> registerTenant({
    required EmailAddress email,
    required Password password,
    required TenantName tenantName,
    required PersonName firstName,
    required PersonName lastName,
    required int editionId,
  });
  Future<Either<AuthFailure, AuthToken>> authenticate({
    required EmailAddress email,
    required Password password,
    required TenantName tenancyName,   // note: tenancyName, not tenantName
  });
}

enum AuthStatus { authenticated, unauthenticated }
```

### Feature domain — use cases (7 files)

Each use case is one file per action, one class, one `call(...)` method.

- [ ] `get_current_session.dart` → `Future<Either<AuthFailure, UserSession?>>`
- [ ] `get_editions.dart` → `Future<Either<AuthFailure, List<Edition>>>`
- [ ] `get_password_policy.dart` → `Future<Either<AuthFailure, PasswordPolicy>>`
- [ ] `check_tenant_available.dart` → takes `TenantName`, returns `Future<Either<AuthFailure, TenantAvailabilityStatus>>`
- [ ] `register_tenant.dart` → 6 named params, returns `Future<Either<AuthFailure, RegisteredTenant>>`
- [ ] `authenticate.dart` → named params `email`, `password`, `tenancyName`, returns `Future<Either<AuthFailure, AuthToken>>`
- [ ] `register_and_authenticate.dart` — orchestrator, constructor takes **3 use cases** (not the repository):

```dart
class RegisterAndAuthenticate {
  RegisterAndAuthenticate({
    required RegisterTenant registerTenant,
    required Authenticate authenticate,
    required GetCurrentSession getCurrentSession,
  })  : _registerTenant = registerTenant,
        _authenticate = authenticate,
        _getCurrentSession = getCurrentSession;

  Future<Either<AuthFailure, UserSession>> call({
    required EmailAddress email,
    required Password password,
    required TenantName tenantName,
    required PersonName firstName,
    required PersonName lastName,
    required int editionId,
  }) async {
    final registered = await _registerTenant(
      email: email, password: password, tenantName: tenantName,
      firstName: firstName, lastName: lastName, editionId: editionId,
    );
    return registered.fold(left, (_) async {
      final authed = await _authenticate(
        email: email, password: password, tenancyName: tenantName,
      );
      return authed.fold(left, (_) async {
        final session = await _getCurrentSession();
        return session.fold(left, (s) => s == null
          ? left(const AuthFailure.generic(Failure.unknown()))
          : right(s));
      });
    });
  }
}
```

- [ ] Run `dart run build_runner build --delete-conflicting-outputs` after every freezed file.

### Unit tests for value objects

- [ ] `test/features/auth/domain/value_objects/email_address_test.dart` — empty string, valid email, invalid format.
- [ ] `test/features/auth/domain/value_objects/tenant_name_test.dart` — starts with digit, contains space, uppercase (should be normalized), valid, too short, too long.
- [ ] `test/features/auth/domain/value_objects/person_name_test.dart` — digit, apostrophe, hyphen, Unicode letter (valid), trim whitespace.
- [ ] `test/features/auth/domain/value_objects/password_test.dart` — each policy rule pass/fail.

**Outputs.**

| Artifact | Location |
|---|---|
| `ValueObject<T>`, `Failure`, `DataState<T>` | `lib/core/` |
| Value objects, entities, failures, repo interface, 7 use cases, `TenantAvailabilityStatus`, `AuthStatus` | `lib/features/auth/domain/` |
| Value-object unit tests (4 files) | `test/features/auth/domain/value_objects/` |

**Verification.**

```bash
# Invariant #1 — domain purity
grep -R "package:flutter\|package:dio\|package:json_annotation\|package:equatable" \
  lib/core/domain lib/core/error lib/core/common lib/features/auth/domain
# must print nothing

# Correct use-case count
ls lib/features/auth/domain/usecases/
# must print exactly: authenticate.dart check_tenant_available.dart get_current_session.dart
# get_editions.dart get_password_policy.dart register_and_authenticate.dart register_tenant.dart

flutter test test/features/auth/domain/value_objects/
# must be all green
```

**Gate to Phase 3.**

- [ ] Value-object tests green.
- [ ] Domain folder has no Flutter, Dio, or json_annotation imports (invariants #1, #7, #9).
- [ ] `AuthRepository` has exactly 6 async methods + 1 `authStatus` stream getter.
- [ ] `ls lib/features/auth/domain/usecases/` prints exactly the 7 filenames above.
- [ ] Build runner run; `*.freezed.dart` files committed.
- [ ] Commit pushed: `feat(domain): value objects, entities, failures, repository interface, seven use cases`.

---

## Phase 3 — Infrastructure layer + CLI smoke test

**Goal.** Domain contracts are backed by real HTTP calls. A CLI driver creates a real tenant end-to-end, no UI.

**Inputs.**

| Input | From |
|---|---|
| Abstract `AuthRepository` | Phase 2 |
| Dio client + interceptors | Phase 1 |
| Raw endpoint JSON, `test/fixtures/*.json` | Phase 0 |
| Endpoint shapes | [`02-API-REFERENCE.md`](02-API-REFERENCE.md) |

**Tasks.**

### ABP envelope DTO — must use `genericArgumentFactories`

```dart
// features/auth/infrastructure/dtos/abp_response.dart
@Freezed(genericArgumentFactories: true)   // required — build_runner fails without this
sealed class AbpResponse<T> with _$AbpResponse<T> {
  const factory AbpResponse({
    T? result,
    required bool success,
    AbpError? error,
    @JsonKey(name: 'unAuthorizedRequest') @Default(false) bool unauthorizedRequest,
  }) = _AbpResponse<T>;

  factory AbpResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$AbpResponseFromJson(json, fromJsonT);
}
```

### DTOs — exact field names

All DTOs are `@freezed` + `@JsonSerializable`. Key non-obvious fields:

**`RegisterTenantRequestDto`** — every field below is required; `captchaResponse` must be sent as `null`, not omitted:

```dart
const factory RegisterTenantRequestDto({
  required String adminEmailAddress,
  required String adminFirstName,
  required String adminLastName,
  required String adminPassword,
  @JsonKey(includeIfNull: true) String? captchaResponse,   // null, NOT omitted
  required int editionId,           // int, not String
  required String name,             // display name
  required String tenancyName,      // DNS slug (lowercase)
}) = _RegisterTenantRequestDto;
```

**`AuthenticateRequestDto`** — note `ianaTimeZone` in the body (not `timeZone`):

```dart
const factory AuthenticateRequestDto({
  required String ianaTimeZone,       // 'Europe/Istanbul' — body field
  required String password,
  @Default(false) bool rememberClient,
  @JsonKey(includeIfNull: true) String? returnUrl,
  @Default(false) bool singleSignIn,
  required String tenantName,         // note: API uses tenantName here, not tenancyName
  required String userNameOrEmailAddress,
  @JsonKey(includeIfNull: true) String? twoFactorVerificationCode,
  @JsonKey(includeIfNull: true) String? captchaResponse,
}) = _AuthenticateRequestDto;
```

**`TenantAvailabilityDto`** — PDF rule: `tenantId == null` → name is free, **regardless of `state`**:

```dart
const factory TenantAvailabilityDto({
  int? tenantId,     // null = available (PDF's source of truth)
  int? state,        // 1=Available, 2=InActive, 3=NotFound — present on wire but PDF ignores it
}) = _TenantAvailabilityDto;

// Mapping to domain:
TenantAvailabilityStatus toDomain() =>
    tenantId == null ? TenantAvailabilityStatus.available : TenantAvailabilityStatus.taken;
```

### `AuthRemoteDatasource`

One method per endpoint. Each method unwraps the ABP envelope and returns the DTO (or throws `DioException` for the repository to catch):

```dart
Future<List<EditionDto>> getEditions() async {
  final response = await _dio.get('/api/services/app/TenantRegistration/GetEditionsForSelect');
  final envelope = AbpResponse<EditionsResultDto>.fromJson(
    response.data as Map<String, dynamic>,
    (json) => EditionsResultDto.fromJson(json! as Map<String, dynamic>),
  );
  return envelope.result!.editionsWithFeatures;
}

// RegisterTenant — timeZone is a QUERY PARAM
Future<RegisterTenantResponseDto> registerTenant(RegisterTenantRequestDto request) async {
  final response = await _dio.post(
    '/api/services/app/TenantRegistration/RegisterTenant',
    queryParameters: {'timeZone': ApiConstants.ianaTimezone},   // query, not body
    data: request.toJson(),
  );
  // ...
}

// Authenticate — different base path; ianaTimeZone is a BODY FIELD (via DTO)
Future<AuthenticateResponseDto> authenticate(AuthenticateRequestDto request) async {
  final response = await _dio.post(
    '/api/TokenAuth/Authenticate',   // NOT /api/services/app/
    data: request.toJson(),
  );
  // ...
}
```

### `AuthRepositoryImpl` — failure mapping table

| Wire condition | AuthFailure returned |
|---|---|
| `DioExceptionType.connectionError` / `connectionTimeout` | `AuthFailure.generic(Failure.network())` |
| `DioExceptionType.receiveTimeout` / `sendTimeout` | `AuthFailure.generic(Failure.timeout())` |
| HTTP 401 from `Authenticate` | `AuthFailure.invalidCredentials()` |
| HTTP 409 from `RegisterTenant` (or ABP error for tenancy taken) | `AuthFailure.tenantTaken()` |
| HTTP 400 with `error.validationErrors` | `AuthFailure.validation(Map<String, String>)` — flatten server's `Map<String, List<String>>` to first error per field |
| Any other `DioException` | `AuthFailure.generic(Failure.server(code: ..., message: ...))` |

Also: after `authenticate(...)` succeeds, `AuthRepositoryImpl` persists the token to `SecureStorage` **before** returning — not the orchestrator, not the BLoC:

```dart
@override
Future<Either<AuthFailure, AuthToken>> authenticate({...}) async {
  try {
    final dto = await _datasource.authenticate(request);
    await _secureStorage.writeAuthToken(dto.accessToken);  // persist here
    _authStatusController.add(AuthStatus.authenticated);   // emit to authStatus stream
    return right(AuthToken(dto.accessToken));
  } on DioException catch (e) {
    return left(_mapDioError(e));
  }
}
```

### DI registrations

Register in `core/di/injection.dart` in this order (see Appendix B):

```dart
// Infrastructure
getIt.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasource(getIt()));
getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt(), getIt()));

// Use cases — lazy singletons (stateless forwarders)
getIt.registerLazySingleton(() => GetCurrentSession(getIt()));
getIt.registerLazySingleton(() => GetEditions(getIt()));
getIt.registerLazySingleton(() => GetPasswordPolicy(getIt()));
getIt.registerLazySingleton(() => CheckTenantAvailable(getIt()));
getIt.registerLazySingleton(() => RegisterTenant(getIt()));
getIt.registerLazySingleton(() => Authenticate(getIt()));
getIt.registerLazySingleton(() => RegisterAndAuthenticate(
  registerTenant: getIt(),
  authenticate: getIt(),
  getCurrentSession: getIt(),
));
```

### CLI smoke driver

- [ ] Write `bin/smoke.dart` (or a flag-gated `main()`) that resolves `RegisterAndAuthenticate` from `getIt` and runs the full flow with a generated tenant name.
- [ ] Smoke driver prints one line per PDF step with HTTP status: pre-auth session, editions, password policy, availability (available), register, authenticate, post-auth session.
- [ ] Run it. Fix bugs until it succeeds.
- [ ] Delete the driver before the Phase 6 commit.

**Verification.**

```bash
# Invariant #1 in infrastructure (allowed: Dio and json_annotation; NOT Flutter)
grep -R "package:flutter" lib/features/auth/infrastructure
# must print nothing

# Smoke driver — run twice
dart run bin/smoke.dart --tenantName=wkx-test-$(date +%s)
# first run → success; second run (same name) → AuthFailure.tenantTaken()
# airplane mode run → AuthFailure.generic(NetworkFailure), no uncaught exceptions
```

**Gate to Phase 4.**

- [ ] Smoke driver succeeds end-to-end; real tenant resolves at `https://{name}.workiom.com/`.
- [ ] Second run with same name surfaces `AuthFailure.tenantTaken()`.
- [ ] Access token persisted in `SecureStorage` and readable back.
- [ ] `AuthRepositoryImpl` never throws past `Either`; toggling airplane mode produces graceful `left(...)`.
- [ ] Commit pushed: `feat(infrastructure): DTOs, datasource, repository impl, DI; end-to-end smoke green`.

---

## Phase 4 — Presentation shell (screens without logic)

**Goal.** Every screen exists, is styled against Figma, routes to the next, and looks right in light + dark + EN + AR. No API calls yet.

**Inputs.**

| Input | From |
|---|---|
| Figma screenshots (light + dark) | Phase 0 |
| `AppIcon` + SVG icons | Phase 1 |
| ARB files | Phase 1 |
| Route table | Appendix A |

**Tasks.**

### Page count: 7 named pages + ShellRoute parent

See Appendix A for the full route table. The page-to-folder mapping:

| Route path | File | Folder split |
|---|---|---|
| `/splash` | `splash_page.dart` | `presentation/splash/` |
| `/welcome` | `welcome_page.dart` | `presentation/welcome/` |
| `/login` | `login_page.dart` | `presentation/login/` — stub, no real navigation |
| `/signup` (ShellRoute) | — | hosts `BlocProvider<SignUpBloc>` |
| `/signup/email-password` | `signup_email_password_page.dart` | `presentation/signup/` |
| `/signup/tenant-name` | `signup_tenant_name_page.dart` | `presentation/signup/` |
| `/signup/personal-info` | `personal_info_page.dart` | `presentation/personal_info/` — different folder |
| `/signup/success` | `signup_success_page.dart` | `presentation/signup/` |

Welcome page CTA routing:
- "Create workspace" → `context.go('/signup/email-password')`
- "Sign in" → `context.go('/login')` — login page is a stub with no further navigation

Login page: renders in every theme/locale; no backend logic; no navigation out; it is **completely out of scope**.

### `go_router` with ShellRoute

The sign-up flow is **one BLoC across four pages**. Wrap it in a `ShellRoute` so the bloc persists across navigation — breaking the shell loses all typed state:

```dart
// core/router/app_router.dart
ShellRoute(
  builder: (context, state, child) => BlocProvider(
    create: (_) => getIt<SignUpBloc>()..add(const SignUpStarted()),
    child: child,
  ),
  routes: [
    GoRoute(path: '/signup/email-password', builder: (_, __) => const SignUpEmailPasswordPage()),
    GoRoute(path: '/signup/tenant-name',    builder: (_, __) => const SignUpTenantNamePage()),
    GoRoute(path: '/signup/personal-info',  builder: (_, __) => const PersonalInfoPage()),
    GoRoute(path: '/signup/success',        builder: (_, __) => const SignUpSuccessPage()),
  ],
),
```

The `go_router` redirect logic (auth gating — no `/home` route; authenticated users who revisit `/welcome` are sent to `/signup/success`):

```dart
redirect: (context, state) {
  final isAuthed = authStatus.value == AuthStatus.authenticated;
  if (isAuthed && state.matchedLocation == '/welcome') return '/signup/success';
  if (!isAuthed && state.matchedLocation == '/signup/success') return '/welcome';
  return null;
},
```

### Shared widgets

- `presentation/widgets/` — `PasswordRulesList` (pass-through data now; binds to state in Phase 6.3), `TenantAvailabilityIndicator` (pass-through; 3 states in Phase 6.4), `StepProgressIndicator`.
- `core/widgets/` — `PrimaryButton`, `AppTextField`.

### Hardcode navigation for now

`onPressed: () => context.go('/signup/tenant-name')` on every CTA. Replace with BLoC-listener navigation in Phase 6.

### Localization

Every user-facing string goes through `AppLocalizations.of(context)!.someKey`. Add keys to both `app_en.arb` and `app_ar.arb` as you build each screen. Run `flutter gen-l10n` after every ARB change.

**Verification.**

```bash
grep -R "Color(0x" lib/features/auth/presentation                 # invariant #2 — expect 0
grep -R "EdgeInsets\.only(left\|EdgeInsets\.only(right" lib/features/auth/presentation  # invariant #4 — expect 0
```

- Clicking `/splash → /welcome → /signup/email-password → /signup/tenant-name → /signup/personal-info → /signup/success` works without crashes.
- Theme flip repaints every screen.
- Locale flip (to Arabic) mirrors layout; no clipped strings, no misplaced icons.
- Side-by-side each screen with the Figma frame — visual drift is "minor" at most.
- 28-screenshot matrix archived (7 pages × light/dark × en/ar).

**Gate to Phase 5.**

- [ ] Reviewer can click the entire flow without a crash.
- [ ] Every screen passes a light/dark/EN/AR walk.
- [ ] Invariants #2, #3, #4 grep checks all return 0.
- [ ] Commit pushed: `feat(presentation): all sign-up pages with navigation, theme, l10n, and SVG icons`.

---

## Phase 5 — BLoC & state

**Goal.** `SignUpBloc` compiles against the seven use cases, event/state contracts cover the whole flow, and `bloc_test`s for each event are green.

**Inputs.**

| Input | From |
|---|---|
| 7 use cases registered in DI | Phase 2 + Phase 3 |
| `DataState<T>`, `TenantAvailabilityStatus` | Phase 2 |
| Value objects | Phase 2 |

**Tasks.**

### Events — sealed class family

```dart
// features/auth/presentation/signup/bloc/signup_event.dart
sealed class SignUpEvent { const SignUpEvent(); }

class SignUpStarted           extends SignUpEvent { const SignUpStarted(); }
class SignUpEmailChanged      extends SignUpEvent { const SignUpEmailChanged(this.email); final String email; }
class SignUpPasswordChanged   extends SignUpEvent { const SignUpPasswordChanged(this.password); final String password; }
class SignUpEditionSelected   extends SignUpEvent { const SignUpEditionSelected(this.editionId); final int editionId; }
class SignUpTenantNameChanged extends SignUpEvent { const SignUpTenantNameChanged(this.name); final String name; }
class SignUpFirstNameChanged  extends SignUpEvent { const SignUpFirstNameChanged(this.firstName); final String firstName; }
class SignUpLastNameChanged   extends SignUpEvent { const SignUpLastNameChanged(this.lastName); final String lastName; }
class SignUpSubmitted         extends SignUpEvent { const SignUpSubmitted(); }
```

### State — presentation-layer `TenantAvailability` maps from domain's `TenantAvailabilityStatus`

```dart
// features/auth/presentation/signup/bloc/signup_state.dart
enum SubmissionStatus { idle, submitting, success, failure }

@freezed
sealed class TenantAvailability with _$TenantAvailability {
  const factory TenantAvailability.unknown()   = _Unknown;
  const factory TenantAvailability.checking()  = _Checking;
  const factory TenantAvailability.available() = _Available;
  const factory TenantAvailability.taken()     = _Taken;
}

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(DataState<List<Edition>>.idle())    DataState<List<Edition>> editions,
    @Default(DataState<PasswordPolicy>.idle())   DataState<PasswordPolicy> passwordPolicy,
    int? selectedEditionId,
    @Default(EmailAddress.pure())               EmailAddress email,
    @Default(Password.pure())                  Password password,
    @Default(TenantName.pure())                TenantName tenantName,
    @Default(TenantAvailability.unknown())      TenantAvailability tenantAvailability,
    @Default(PersonName.pure())                PersonName firstName,
    @Default(PersonName.pure())                PersonName lastName,
    @Default(SubmissionStatus.idle)            SubmissionStatus submissionStatus,
    UserSession? userSession,    // populated on successful submit; read by success page
    AuthFailure? failure,
  }) = _SignUpState;
}
```

### BLoC constructor and transformer wiring

```dart
// features/auth/presentation/signup/bloc/signup_bloc.dart
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required GetEditions getEditions,
    required GetPasswordPolicy getPasswordPolicy,
    required CheckTenantAvailable checkTenantAvailable,
    required RegisterAndAuthenticate registerAndAuthenticate,
  })  : _getEditions = getEditions,
        _getPasswordPolicy = getPasswordPolicy,
        _checkTenantAvailable = checkTenantAvailable,
        _registerAndAuthenticate = registerAndAuthenticate,
        super(const SignUpState()) {
    on<SignUpStarted>(_onStarted);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpEditionSelected>(_onEditionSelected);
    on<SignUpTenantNameChanged>(
      _onTenantNameChanged,
      transformer: _debounce(const Duration(milliseconds: 500)),  // custom rxdart, NOT bloc_concurrency
    );
    on<SignUpFirstNameChanged>(_onFirstNameChanged);
    on<SignUpLastNameChanged>(_onLastNameChanged);
    on<SignUpSubmitted>(_onSubmitted, transformer: droppable());   // bloc_concurrency
  }
}

/// Custom debounce — NOT from bloc_concurrency (which only ships droppable/restartable/sequential/concurrent).
EventTransformer<T> _debounce<T>(Duration duration) =>
    (events, mapper) => events.debounceTime(duration).switchMap(mapper);
```

### Event-transformer map (reference)

| Event | Transformer | Source |
|---|---|---|
| `SignUpStarted` | default (sequential) | — |
| `SignUpEmailChanged` | default | — |
| `SignUpPasswordChanged` | default | — |
| `SignUpEditionSelected` | default | — |
| `SignUpTenantNameChanged` | `_debounce(500ms)` | custom rxdart |
| `SignUpFirstNameChanged` | default | — |
| `SignUpLastNameChanged` | default | — |
| `SignUpSubmitted` | `droppable()` | `bloc_concurrency` |

### `_onStarted` — parallel fetch

```dart
Future<void> _onStarted(SignUpStarted event, Emitter<SignUpState> emit) async {
  emit(state.copyWith(
    editions: const DataState.loading(),
    passwordPolicy: const DataState.loading(),
  ));
  final results = await Future.wait([_getEditions(), _getPasswordPolicy()]);
  final editionsResult = results[0] as Either<AuthFailure, List<Edition>>;
  final policyResult   = results[1] as Either<AuthFailure, PasswordPolicy>;
  emit(state.copyWith(
    editions:      editionsResult.fold(DataState.failure, DataState.success),
    passwordPolicy: policyResult.fold(DataState.failure, DataState.success),
    selectedEditionId: editionsResult.fold((_) => null,
        (editions) => editions.firstOrNull?.id),  // auto-pick; PDF permits skipping picker
  ));
}
```

Note: `GetPasswordPolicy` must be called on every `SignUpStarted` — **do not cache across sign-up entries** (API gotcha #6 from Phase 0).

### DI registration for the BLoC

```dart
// Factory — fresh state per sign-up mount (NOT a lazy singleton)
getIt.registerFactory(() => SignUpBloc(
  getEditions: getIt(),
  getPasswordPolicy: getIt(),
  checkTenantAvailable: getIt(),
  registerAndAuthenticate: getIt(),
));
```

### `bloc_test` coverage

`test/features/auth/presentation/signup/bloc/signup_bloc_test.dart` — use `mocktail` for all four use cases. Cover:

1. Initial state: all `DataState.idle()`, value objects are `.pure()`, availability is `.unknown()`, status is `.idle`.
2. `SignUpStarted` happy path → both `DataState.loading()` then both `DataState.success(...)`, `selectedEditionId` non-null.
3. `SignUpStarted` editions failure → `DataState.failure(...)` for editions.
4. `SignUpEmailChanged` / `SignUpPasswordChanged` / `SignUpFirstNameChanged` / `SignUpLastNameChanged` → value-object field updated.
5. `SignUpTenantNameChanged` debounce → `TenantAvailability.checking()` then `.available()` or `.taken()`.
6. `SignUpSubmitted` happy path → `SubmissionStatus.submitting` then `.success` with `userSession` populated.
7. `SignUpSubmitted` failure → `SubmissionStatus.failure` with correct `AuthFailure`.
8. **Double-tap guard** — two rapid `SignUpSubmitted` events → only one state sequence emitted (droppable proof).
9. **Debounce proof** — rapid `SignUpTenantNameChanged` events → only one `CheckTenantAvailable` call.

Test setup pattern:

```dart
setUp(() async {
  await getIt.reset();
  getIt.registerLazySingleton<GetEditions>(() => mockGetEditions);
  // ...
});
```

**Verification.**

```bash
grep -R "AuthRepository" lib/features/auth/presentation   # must print nothing — invariant #8
flutter test test/features/auth/presentation/signup/bloc/signup_bloc_test.dart
# must be all green
```

**Gate to Phase 6.**

- [ ] `bloc_test` green for initial state + all 9 test cases above.
- [ ] BLoC has exactly 4 required-named constructor params; does not import `AuthRepository`.
- [ ] Droppable and debounce proofs pass.
- [ ] Commit pushed: `feat(presentation): SignUpBloc with events, states, and transformer tests`.

---

## Phase 6 — PDF flow integration

**Goal.** Plug the pages from Phase 4 into the BLoC from Phase 5 so every one of the PDF's six named sections runs against the live API.

Run all sub-phases against the live API on a real device or emulator — do not mock anything here.

### 6.1 Initial Step — splash calls `GetCurrentLoginInformations`

**PDF:** *"Call `GetCurrentLoginInformations` on boot."*

- [ ] Inject `GetCurrentSession` into the splash widget's controller — **not** into `SignUpBloc`; the splash runs before the shell route mounts.
- [ ] On first frame: call the use case.
- [ ] On `left(failure)` → `context.go('/welcome')`.
- [ ] On `right(null)` or `right(UserSession{user: null})` → `context.go('/welcome')`.
- [ ] On `right(UserSession{user: non-null})` → `context.go('/signup/success')` (**no `/home`** route — resolved conflict A).

Register `SplashController` in DI:

```dart
getIt.registerFactory(() => SplashController(getIt<GetCurrentSession>()));
```

**Gate:** Cold start, no token → lands on `/welcome`. Cold start after prior success (token in `SecureStorage`) → lands on `/signup/success` with the authed user.

### 6.2 Getting Editions — auto-pick first registrable edition

**PDF:** *"By default we can use the first edition as the selected edition."*

- [ ] `_onStarted` invokes `_getEditions()` and `_getPasswordPolicy()` in parallel via `Future.wait` (already wired in Phase 5).
- [ ] On success: `state.selectedEditionId = editions.firstOrNull?.id` (auto-picked).
- [ ] On failure: `DataState.failure(...)` for editions; UI surfaces a localized error banner with a retry CTA.

**Verification:** log output shows `GetEditionsForSelect` and `GetPasswordComplexitySetting` fired **once each, in parallel** (not sequentially).

**Gate:** Both parallel calls succeed; `state.selectedEditionId` is non-null.

### 6.3 Asking for information — email + password

**PDF:** *"Email should be a valid email address. The password should pass the validation of the `GetPasswordComplexitySetting` API call."*

- [ ] Email field dispatches `SignUpEmailChanged`; BLoC wraps in `EmailAddress(input)`; error shown only after blur or first submit attempt.
- [ ] Password field dispatches `SignUpPasswordChanged`; BLoC wraps in `Password(input, policy)`; `PasswordRulesList` is driven by `state.passwordPolicy` + current `Password` — one green check per rule that passes, no debounce (local validation only, live on every keystroke).
- [ ] "Next" is disabled until `email.isValid && password.isValid`.
- [ ] On "Next": `context.go('/signup/tenant-name')`.

**Gate:** Password rule checklist is fully reactive; Next correctly gated.

### 6.4 Asking for information — tenant name with debounced availability

**PDF:** *"Tenant names should start with a letter and can contain numbers and dashes. Check `IsTenantAvailable`."*

- [ ] Input is **lowercased before `TenantName` construction** (DNS normalization — do not skip this).
- [ ] On change: update `state.tenantName` immediately; emit `TenantAvailability.unknown()` while user is still typing. After the 500ms debounce fires and the name is valid: emit `TenantAvailability.checking()` → call `CheckTenantAvailable` → fold to `.available()` or `.taken()`.
- [ ] **`tenantId == null` → available**, regardless of `state` field. Verify this rule with a unit test (invariant from Phase 0 API notes).
- [ ] `TenantAvailabilityIndicator` shows exactly 3 states: checking (spinner), available (green check + URL preview `https://{tenantName}.workiom.com/`), taken (red cross).
- [ ] "Next" disabled unless `tenantName.isValid && tenantAvailability is _Available`.

**Verification:** typing `wkx-test-{timestamp}` fires exactly **one** `IsTenantAvailable` call after 500ms of idle; a known-taken name shows `.taken()` and disables Next.

**Gate:** Debounce works; three-state indicator correct; `tenantId == null` rule enforced; Next correctly gated.

### 6.5 Asking for information — first + last name

**PDF:** *"It should be Letters only."*

- [ ] Both fields use `keyboardType: TextInputType.name`, `textCapitalization: TextCapitalization.words`, appropriate `autofillHints`.
- [ ] `PersonName` rejects: `O'Brien`, `Jean-Luc`, `A1ex`, digits, punctuation, spaces. Accepts: `María`, `محمد`, `Iñiguez`.
- [ ] Strip whitespace before constructing the value object.
- [ ] "Next" disabled until both names are valid.

**Gate:** Invalid names rejected at input; valid Unicode letters accepted; button correctly gated.

### 6.6 Register + Authenticate + Login Information

**PDF sections:** *"Register a tenant with user"* + *"Login the user In"* + *"Login Information"*

- [ ] On `SignUpSubmitted` (with `droppable()` — double-tap prevention already in Phase 5): call `_registerAndAuthenticate(...)` with all six named params including `editionId: state.selectedEditionId!`.
- [ ] The orchestrator: `RegisterTenant → Authenticate → GetCurrentSession`. Runs inside the BLoC handler, not inside a repository method.
- [ ] `AuthRepositoryImpl.authenticate(...)` persists the token and emits `AuthStatus.authenticated` before returning (already done in Phase 3).
- [ ] On success: emit `state.copyWith(submissionStatus: SubmissionStatus.success, userSession: session)`. A `BlocListener` detects `submissionStatus == success` and navigates to `/signup/success`.

```dart
BlocListener<SignUpBloc, SignUpState>(
  listenWhen: (prev, curr) => prev.submissionStatus != curr.submissionStatus,
  listener: (context, state) {
    if (state.submissionStatus == SubmissionStatus.success) {
      context.go('/signup/success');
    } else if (state.submissionStatus == SubmissionStatus.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.failure!.toLocalizedMessage(context))),
      );
    }
  },
  child: ...,
)
```

- [ ] Success page reads `state.userSession` — no second `GetCurrentLoginInformations` call needed; the orchestrator already fetched and stored it.
- [ ] Error handling:
  - `AuthFailure.tenantTaken()` → surface inline error on the tenant-name step (pop or toast).
  - `AuthFailure.validation(fieldErrors)` → surface per-field messages via `AppLocalizations`.
  - Other failures → localized snackbar; keep user on current page; allow retry.
- [ ] Wire the `AuthFailure` → localized string extension:

```dart
extension AuthFailureL10n on AuthFailure {
  String toLocalizedMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      _Generic(failure: final f)    => f.toLocalizedMessage(l10n),
      _TenantTaken()                => l10n.errorTenantTaken,
      _InvalidCredentials()         => l10n.errorInvalidCredentials,
      _Validation(fieldErrors: final e) => e.values.first,
    };
  }
}
```

**Verification:**
- Fresh email + fresh tenant name → tap submit once → spinner → success screen with real user + tenant.
- Double-tap submit → only one spinner (droppable proof).
- Repeat submit with same tenant name → `tenantTaken` error.
- Kill network mid-submit → graceful failure + retry works.
- Token survives restart → cold start lands on `/signup/success` with authed user.
- Log shows exactly **one** call each to `RegisterTenant`, `Authenticate`, `GetCurrentLoginInformations` per successful submit.

**Gate:** A real tenant is created at `https://{tenantName}.workiom.com/` and the authed user name appears on the success screen.

### Phase 6 overall gate

- [ ] All six sub-phase gates above pass.
- [ ] Commit pushed: `feat: end-to-end sign-up against live API wires all six PDF sections`.

---

## Phase 7 — Polish & QA

**Goal.** Move from "it works" to "production-quality."

**Inputs.**

| Input | From |
|---|---|
| Working end-to-end flow | Phase 6 |
| Figma screenshots | Phase 0 |
| a11y guidelines | AA contrast, 48px tap targets |
| 32-cell verification matrix | See below |

**Tasks.**

- [ ] Keyboard UX: `autofillHints`, `textInputAction: TextInputAction.next/done`, dismiss on outside tap, `FocusScope.of(context).nextFocus()` between fields.
- [ ] Show/hide password toggle with SVG eye-open/eye-closed swap.
- [ ] Clear button on text fields where sensible.
- [ ] Page transitions match Figma prototype animations.
- [ ] Accessibility:
  - `Semantics` label on every interactive widget.
  - Icon-only buttons use `AppIcon` **with** `semanticsLabel` (non-null → `excludeFromSemantics: false`).
  - Decorative icons use `AppIcon` **without** `semanticsLabel` (null → `excludeFromSemantics: true`).
  - Minimum 48px tap targets.
  - AA contrast in both themes.
- [ ] Platform: iOS safe areas; Android back-button pops within the shell route without losing typed state; status-bar style per theme.
- [ ] Empty and error states visually designed (not raw error text).
- [ ] Configure `flutter_native_splash` for both light and dark variants.
- [ ] Generate launcher icons via `flutter_launcher_icons`.

**Theme + Locale + SVG QA — 32-cell matrix**

Walk every screen (8) × every combination ({light, dark} × {en, ar}) = 32 cells. For each cell:

| Screen | Light EN | Light AR | Dark EN | Dark AR |
|---|---|---|---|---|
| Splash | ☐ | ☐ | ☐ | ☐ |
| Welcome | ☐ | ☐ | ☐ | ☐ |
| Login stub | ☐ | ☐ | ☐ | ☐ |
| Email/password | ☐ | ☐ | ☐ | ☐ |
| Tenant name | ☐ | ☐ | ☐ | ☐ |
| Personal info | ☐ | ☐ | ☐ | ☐ |
| Success | ☐ | ☐ | ☐ | ☐ |
| (ShellRoute itself) | — | — | — | — |

- [ ] Pixel-diff each screen against Figma; fix drift.
- [ ] `dart format --set-exit-if-changed lib test`
- [ ] `flutter analyze` → 0.
- [ ] `flutter test` → all green.
- [ ] Add `bloc_test` for the happy-path submit sequence if not already green from Phase 5.

**Verification.**

- Full walk in light+dark+EN+AR shows no visual bugs.
- TalkBack (Android) / VoiceOver (iOS) — every interactive widget has a sensible semantic label.
- Every icon recolors correctly when flipping theme.
- Formatter exits 0; analyzer exits 0; tests all green.

**Gate to Phase 8.**

- [ ] `flutter analyze` = 0 warnings.
- [ ] `flutter test` = all green.
- [ ] `dart format --set-exit-if-changed lib test` exits 0.
- [ ] All 32 theme/locale cells checked.
- [ ] Figma pixel diff is "small" on every screen.
- [ ] Commit pushed: `polish: animations, a11y, theme QA, l10n QA, SVG QA, platform integration, tests`.

---

## Phase 8 — Ship

**Goal.** Package and submit per the PDF test criteria.

**Inputs.**

| Input | From |
|---|---|
| Polished app | Phase 7 |
| Public repo | Phase 0 |
| Submission target | `irfan.ozdemir@workiom.com` |

**Tasks.**

- [ ] Finalize `README.md` — quick-start (≤5 steps), tech stack, docs map, PDF's verbatim five test criteria as a checkbox list, screenshots or GIF.
- [ ] Strip `^` from every version in `pubspec.yaml` (pin exact versions — invariant #14).
- [ ] Commit `pubspec.lock`.
- [ ] `.gitignore` covers: `build/`, `.dart_tool/`, `.idea/`, `.vscode/`, `ios/Pods`.
- [ ] Record a 60-second screen capture of the flow (optional but strong signal).

Run final quality checks:

```bash
flutter analyze                              # → 0 issues
flutter test                                 # → all green
dart format --set-exit-if-changed lib test   # → clean
dart run build_runner build --delete-conflicting-outputs   # → no codegen drift
```

Build and verify the APK:

```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter build apk --release

# Rename to predictable location
mv build/app/outputs/flutter-apk/app-release.apk ./workiom_signup_v1.0.apk
```

- [ ] APK size < 30 MB.
- [ ] APK installs on a **clean Android device** (not just the dev machine) and completes a fresh sign-up.

iOS build (**recommended; skippable on non-Mac machines** — resolved conflict G):

```bash
flutter build ios --release
```

If on macOS: run on an iOS device or simulator and complete a fresh sign-up. If on Windows/Linux: ensure all code is cross-platform clean; note the omission in the README.

- [ ] Clean git history: squash trivial fixups; write meaningful commit messages.
- [ ] Tag the release: `git tag v1.0 && git push --tags`.
- [ ] Push all branches; make the repo **public**. Verify from an incognito window.
- [ ] Fill in the GitHub repository description: *"Flutter technical test — Workiom tenant sign-up flow"*.
- [ ] Confirm `README.md` renders correctly on GitHub (images, links, markdown).
- [ ] Walk [`docs/05-SUBMISSION-CHECKLIST.md`](05-SUBMISSION-CHECKLIST.md) top-to-bottom and tick every box.
- [ ] Send the submission email:

```
Subject: Flutter Technical Test Submission — [Your Name]

Hi Irfan,

Thank you for the opportunity to complete the Flutter technical test.
Please find my submission below:

• GitHub repository: https://github.com/<username>/workiom_signup
• Release APK: attached (workiom_signup_v1.0.apk)
• Demo video: <optional Loom link>

The app covers the full sign-up flow from the brief — session check,
edition selection, dynamic password validation from the server-provided
policy, debounced tenant-name availability check, tenant registration,
authentication, and authenticated session retrieval. Architecture,
tech-stack rationale, and API reference are in the docs/ directory.

Happy to walk through the implementation or answer any questions.

Best regards,
[Your Name]
[Phone / LinkedIn / Portfolio]
```

- [ ] **Do not push more commits after sending the email** — the reviewer tests what you sent.

**Outputs.**

| Artifact | Location |
|---|---|
| Release APK | `./workiom_signup_v1.0.apk` |
| Updated `README.md` | repo root |
| Public GitHub URL + `v1.0` tag | shareable link |
| Submission email | sent |

**Final gate — you are done.**

- [ ] APK attached in the submission email.
- [ ] Public GitHub URL in the submission email.
- [ ] All five PDF test criteria (sign-up works, design matches Figma, iOS + Android, APK emailed, public repo) satisfied.
- [ ] Submission email sent; no further pushes.

---

## Appendix A — Route table (authoritative)

| Path | Page file | Folder | Notes |
|---|---|---|---|
| `/splash` | `splash_page.dart` | `presentation/splash/` | Session check; redirects to `/welcome` (unauthed) or `/signup/success` (authed). |
| `/welcome` | `welcome_page.dart` | `presentation/welcome/` | Entry landing: "Sign in" → `/login`, "Create workspace" → `/signup/email-password`. |
| `/login` | `login_page.dart` | `presentation/login/` | Stub — no real navigation; out of scope. |
| `/signup` | *(ShellRoute)* | — | Parent route hosting `BlocProvider<SignUpBloc>`; no page widget of its own. |
| `/signup/email-password` | `signup_email_password_page.dart` | `presentation/signup/` | Step 1. |
| `/signup/tenant-name` | `signup_tenant_name_page.dart` | `presentation/signup/` | Step 2. |
| `/signup/personal-info` | `personal_info_page.dart` | `presentation/personal_info/` | Step 3 — different folder from `/signup/`. |
| `/signup/success` | `signup_success_page.dart` | `presentation/signup/` | Post-registration; reads `state.userSession`. |

---

## Appendix B — DI ordering graph

Registration order within `configureDependencies()`. Each node depends on the nodes above it.

```
FlutterSecureStorage (lazySingleton)
    └─► SecureStorage (lazySingleton)
            └─► AuthInterceptor (inline at Dio creation)
                    │
LoggingInterceptor (inline, stateless)
ErrorInterceptor   (inline, stateless)
                    │
                    ▼
              DioClient.create(baseUrl, [auth, logging, error]) (lazySingleton → Dio)
                    │
                    ▼
              AuthRemoteDatasource(getIt<Dio>()) (lazySingleton)
                    │
                    ▼
              AuthRepositoryImpl(datasource, secureStorage) (lazySingleton → AuthRepository)
                    │
        ┌───────────┼──────────────────────────────────────┐
        ▼           ▼           ▼           ▼              ▼
  GetCurrentSession  GetEditions  GetPasswordPolicy  CheckTenantAvailable  RegisterTenant  Authenticate
  (all lazySingleton)
        │           │                                                       │              │
        └───────────┴───────────────────────────────────────────────────────┘              │
                                            │                                              │
                                            ▼                                              │
                                RegisterAndAuthenticate(registerTenant, authenticate, getCurrentSession)
                                            │
                                            ▼
                            SignUpBloc(getEditions, getPasswordPolicy, checkTenantAvailable, registerAndAuthenticate)
                            (registerFactory — fresh instance per ShellRoute mount)
```

---

## Appendix C — API mapping

| Endpoint | Method | Base | Use case | Phase 6 sub-phase |
|---|---|---|---|---|
| `/api/services/app/Session/GetCurrentLoginInformations` | GET | `/api/services/app/` | `GetCurrentSession` | 6.1 (cold start) and 6.6 (post-auth, via orchestrator) |
| `/api/services/app/TenantRegistration/GetEditionsForSelect` | GET | `/api/services/app/` | `GetEditions` | 6.2 |
| `/api/services/app/Profile/GetPasswordComplexitySetting` | GET | `/api/services/app/` | `GetPasswordPolicy` | 6.3 |
| `/api/services/app/Account/IsTenantAvailable` | POST | `/api/services/app/` | `CheckTenantAvailable` | 6.4 |
| `/api/services/app/TenantRegistration/RegisterTenant?timeZone=Europe/Istanbul` | POST | `/api/services/app/` | `RegisterTenant` | 6.6 |
| `/api/TokenAuth/Authenticate` | POST | `/api/TokenAuth/` ← different | `Authenticate` | 6.6 |

---

## Appendix D — Testing matrix

Priority order from `04-BEST-PRACTICES.md §13`. Do tests in this order — stop adding tests only if you run out of time.

| Priority | Test target | Tool | File location | What it proves |
|---|---|---|---|---|
| 1 | Value objects (4 files) | `test` | `test/features/auth/domain/value_objects/` | Domain invariants — no invalid state can exist. |
| 2 | `AuthRepositoryImpl` error mapping | `mocktail` on datasource | `test/features/auth/infrastructure/repositories/` | Every `DioException` maps to the correct `AuthFailure`; DTO→domain mapping is correct. |
| 3 | `RegisterAndAuthenticate` orchestration | `mocktail` on use cases | `test/features/auth/domain/usecases/` | Three-step chain calls in the right order; bails on first `left`. |
| 4 | `SignUpBloc` happy-path sequence | `bloc_test` | `test/features/auth/presentation/signup/bloc/` | Full `SignUpStarted → SignUpSubmitted` emits the right states; debounce and droppable proofs. |
| 5 | Widget smokes | `flutter_test` | `test/features/auth/presentation/signup/` | Widgets render correct state; dispatch correct event on interaction. |
| 6 | Golden tests | `flutter_test` (goldens) | — | Only if time remains. |

---

## Appendix E — Compressed-time guide

If you have three calendar days instead of six, merge phases as follows. **Never skip the gates — only the polish items within them.**

| Compressed day | Original phases | What to cut |
|---|---|---|
| Day 1 | 0 + 1 | Fewer Figma screenshots; skip the 32-image screenshot gallery. Hit the four endpoints but skip exhaustive curl sweep. |
| Day 2 | 2 + 3 | Skip optional value-object error variants; keep smoke test gate. |
| Day 3 morning | 4 + 5 | Minimal page chrome; focus on the three data-entry screens. |
| Day 3 afternoon | 6 + 7 + 8 | Cut page animations, `flutter_native_splash` polish, video capture. Keep: live-API end-to-end, Figma match, light/dark/EN/AR walks, APK install on a real device. |

**Gates that must never be skipped** (from `03-ROADMAP.md`):

1. Phase 0 — curl each endpoint at least once; save real fixture files.
2. Phase 2 — domain purity grep returns 0.
3. Phase 3 — smoke test creates a real tenant end-to-end.
4. Phase 6 — end-to-end sign-up works on a real device against the live API.
5. **Matching Figma design** — compare every screen side-by-side.
6. **Running on Android** — release APK on real device.
7. **Public GitHub repo** with README.
8. **APK emailed** — submission sent.

---

## Related docs

- [`03-ROADMAP.md`](03-ROADMAP.md) — same plan in day-by-day form.
- [`01-ARCHITECTURE.md`](01-ARCHITECTURE.md) — where the code lives and why.
- [`02-API-REFERENCE.md`](02-API-REFERENCE.md) — endpoint shapes referenced in Phases 3 and 6.
- [`05-SUBMISSION-CHECKLIST.md`](05-SUBMISSION-CHECKLIST.md) — the final gate in Phase 8.
- [`04-BEST-PRACTICES.md`](04-BEST-PRACTICES.md) — code-style rules enforced across every phase.
- [`06-UI-SYSTEM.md`](06-UI-SYSTEM.md) — theming, localization, SVG pipeline (Phases 1, 4, 7).
