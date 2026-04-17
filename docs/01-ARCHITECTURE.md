---
doc: 01-architecture
title: "Architecture — Clean Architecture, BLoC, and the PDF-phase-to-code map"
role: "Authoritative layout of the codebase. Answers: where does X live and why."
audience: "Any engineer working in the repo; the reference for code review."
reads_like: "A reference doc — skim the headings, dive into the section you need."
pdf_sections_covered:
  - "Initial Step"
  - "Getting Editions"
  - "Asking for information (email+password, tenant name, first/last name)"
  - "Register a tenant with user"
  - "Login the user In"
  - "Login Information"
prerequisites:
  - README.md
leads_to:
  - docs/02-API-REFERENCE.md
  - docs/03-ROADMAP.md
  - docs/04-BEST-PRACTICES.md
  - docs/06-UI-SYSTEM.md
related:
  - CLAUDE.md
  - docs/05-SUBMISSION-CHECKLIST.md
last_reviewed: 2026-04-17
---

# 01 — Architecture

**Clean Architecture** (Reso Coder style) with event-driven BLoC state management, split into a shared `core/` layer and feature modules. This document is the authoritative reference for how code is organised and why.

## PDF phase → code map

The test PDF lays the work out in six named sections. Every one maps to a specific place in the codebase — this table is the authoritative mapping, kept in sync with [`02-API-REFERENCE.md`](02-API-REFERENCE.md) and [`03-ROADMAP.md`](03-ROADMAP.md).

| PDF section | What it says | Where it lives in code |
| --- | --- | --- |
| **Initial Step** | Call `GetCurrentLoginInformations` at boot. `user==null` → sign up. `tenant==null` → pick a tenant. | `presentation/splash/splash_page.dart` invokes the `GetCurrentSession` use case; `go_router` redirect logic branches. |
| **Getting Editions** | Call `GetEditionsForSelect`. PDF permits auto-picking the first edition. | `SignUpBloc._onStarted` invokes the `GetEditions` use case and auto-picks `editionsWithFeatures[0].edition.id`. No edition-picker screen. |
| **Asking for information — email + password** | Email valid; password validated by `GetPasswordComplexitySetting`. | `signup/signup_email_password_page.dart`; value objects `EmailAddress`, `Password`; `GetPasswordPolicy` use case invoked in `_onStarted`. |
| **Asking for information — tenant name** | Letters + numbers + dashes, starts with letter. `IsTenantAvailable` on change. | `signup/signup_tenant_name_page.dart`; `TenantName` value object; debounced `CheckTenantAvailable` use case. |
| **Asking for information — first/last name** | Letters only. | `personal_info/personal_info_page.dart`; `PersonName` value object. |
| **Register a tenant with user** | `POST RegisterTenant?timeZone=Europe/Istanbul` with admin* + editionId + name + tenancyName + `captchaResponse: null`. | `RegisterTenant` use case; orchestrated end-to-end by `RegisterAndAuthenticate`. |
| **Login the user In** | `POST /api/TokenAuth/Authenticate` with `ianaTimeZone, password, rememberClient: false, returnUrl: null, singleSignIn: false, tenantName, userNameOrEmailAddress`. | `Authenticate` use case; token persisted via `SecureStorage` inside the repository impl. |
| **Login Information** | `GET GetCurrentLoginInformations` with Bearer token → user + tenant payload. | `GetCurrentSession` use case (second call, now authenticated); drives `signup/signup_success_page.dart`. |

Four screens in the Figma prototype — splash, welcome, login, and the sign-up success screen — are design-driven wrappers around the PDF flow. Splash runs the Initial Step; welcome is the prototype's starting point (`node-id=1281:541`); login is stubbed out of scope; success renders the Login Information payload.

## Constraints

- **Architecture pattern:** Clean Architecture — three layers per feature (`domain`, `infrastructure`, `presentation`). No separate `application/` layer.
- **State management:** `flutter_bloc` with the **BLoC** pattern (events + states). No Cubits. BLoCs live in `presentation/`.
- **Structure:** Top-level split into `core/` and `features/`.
- **Dependency injection:** `get_it` only, with a single manual composition root. No `injectable`, no codegen for DI.
- **Theming:** light + dark `ThemeData` from a single token source.
- **Localization:** `flutter_localizations` + `intl` with ARB files, minimum English + Arabic (RTL support).
- **Assets:** vector icons exported from Figma as SVG, rendered with `flutter_svg`.

## The three layers

For every feature, code lives in exactly one of three layers. Dependencies flow inward only.

```
┌──────────────────────────────────────────────────────────┐
│  Presentation       Pages · Widgets · BLoCs · Routing    │   Flutter-aware
│                     (dispatches events, renders states,  │
│                      orchestrates multi-step workflows)  │
├──────────────────────────────────────────────────────────┤
│  Domain             Entities · Value Objects · Failures  │   Pure Dart
│                     · Repository interfaces · Use Cases  │   (stable core)
├──────────────────────────────────────────────────────────┤
│  Infrastructure     DTOs · Remote data sources ·         │   Network-aware
│                     Repository implementations           │
└──────────────────────────────────────────────────────────┘

              Presentation → Domain ← Infrastructure
```

Rules, enforced by code review and analyzer:

- **Domain** depends on nothing. Pure Dart. No Flutter, no Dio, no freezed-serialization. Holds entities, value objects, failures, repository *interfaces*, and use cases. This is your stable core.
- **Infrastructure** depends on Domain (to implement its contracts). Handles JSON, HTTP, storage. Never imported by presentation — the BLoC only ever sees the domain's abstract repository interface.
- **Presentation** depends on Domain only. Imports `flutter_bloc`, Flutter widgets, `go_router`. Holds pages, shared widgets, and the BLoCs that drive them.

### Why no separate `application/` layer?

In a Flutter project, BLoC already imports `flutter_bloc` — it's presentation-adjacent by definition. Putting it in an "application" folder is DDD-textbook but doesn't match how the code actually links. Three layers is simpler, lighter on folder navigation, and is the shape most Flutter reviewers (especially in ABP shops) recognize immediately.

### Use cases — one file per action

This project follows the **traditional Clean Architecture convention**: every application action the BLoC triggers has its own use case class, one per file, under `features/auth/domain/usecases/`. The BLoC never calls `AuthRepository` directly — it goes through a use case.

Pros of this convention (why we picked it):

- **Action inventory is visible.** Opening `domain/usecases/` lists every thing the app can do. Reviewers, future contributors, and test authors see the full surface in one folder.
- **Stable BLoC signature.** The BLoC declares its dependencies as a set of use cases. When the repository gains a new method, only the affected use case changes — the BLoC constructor is untouched.
- **Symmetric testing.** Every action has a test file. No "some are tested at the repo layer, some at the bloc layer" ambiguity.
- **Future-proofs orchestration.** If a currently-simple action gains logic later (caching, retry, feature gating), it already has a home — no refactor to introduce a wrapper class.

The trade-off is a small amount of ceremony: each single-call use case is a thin forwarder around one repository method. Accept that cost; the clarity it buys at review time is worth it.

## Top-level folder structure

```
lib/
├── core/                          Shared across all features
│   ├── constants/
│   │   └── api_constants.dart     Base URL, endpoint paths, timeouts, hardcoded IANA tz
│   ├── di/
│   │   └── injection.dart         Single GetIt composition root (manual)
│   ├── domain/
│   │   └── value_object.dart      ValueObject<T> base class (used by every feature)
│   ├── common/
│   │   └── data_state.dart        DataState<T> sealed union for async data in BLoC state
│   ├── error/
│   │   ├── failures.dart          Sealed `Failure` base + generic NetworkFailure, ServerFailure
│   │   └── exceptions.dart        Lower-level typed exceptions thrown inside infrastructure
│   ├── l10n/
│   │   ├── app_en.arb             English strings
│   │   ├── app_ar.arb             Arabic strings
│   │   └── l10n.dart              Re-export AppLocalizations
│   ├── network/
│   │   ├── dio_client.dart        Configured Dio
│   │   ├── abp_response.dart      Typed ABP envelope
│   │   └── interceptors/
│   │       ├── auth_interceptor.dart
│   │       ├── logging_interceptor.dart
│   │       └── error_interceptor.dart
│   ├── router/
│   │   └── app_router.dart        go_router + auth redirects
│   ├── storage/
│   │   └── secure_storage.dart    flutter_secure_storage wrapper
│   ├── theme/
│   │   ├── app_colors.dart        Brand tokens (light + dark variants)
│   │   ├── app_typography.dart
│   │   ├── app_spacing.dart
│   │   ├── app_radii.dart
│   │   └── app_theme.dart         ThemeData.light() and .dark()
│   ├── widgets/                   Truly shared widgets (PrimaryButton, AppTextField, ...)
│   └── utils/
│       └── value_failures.dart
│
├── features/
│   └── auth/
│       ├── domain/                    — pure Dart, no imports outside domain
│       │   ├── entities/
│       │   │   ├── edition.dart
│       │   │   ├── password_policy.dart
│       │   │   ├── user_session.dart
│       │   │   └── registered_tenant.dart
│       │   ├── value_objects/
│       │   │   ├── email_address.dart
│       │   │   ├── password.dart
│       │   │   ├── tenant_name.dart
│       │   │   └── person_name.dart
│       │   ├── failures/
│       │   │   └── auth_failure.dart
│       │   ├── repositories/
│       │   │   └── auth_repository.dart    (abstract)
│       │   └── usecases/              — one file per action the BLoC can trigger
│       │       ├── get_current_session.dart          PDF: Initial Step + Login Information
│       │       ├── get_editions.dart                 PDF: Getting Editions
│       │       ├── get_password_policy.dart          PDF: Asking for information (password)
│       │       ├── check_tenant_available.dart       PDF: Asking for information (tenant name)
│       │       ├── register_tenant.dart              PDF: Register a tenant with user
│       │       ├── authenticate.dart                 PDF: Login the user In
│       │       └── register_and_authenticate.dart    orchestrator: register → auth → session
│       │
│       ├── infrastructure/            — DTOs, HTTP, persistence
│       │   ├── dtos/
│       │   │   ├── edition_dto.dart
│       │   │   ├── password_policy_dto.dart
│       │   │   ├── tenant_availability_dto.dart
│       │   │   ├── register_tenant_request_dto.dart
│       │   │   ├── authenticate_request_dto.dart
│       │   │   └── authenticate_response_dto.dart
│       │   ├── datasources/
│       │   │   └── auth_remote_datasource.dart
│       │   └── repositories/
│       │       └── auth_repository_impl.dart
│       │
│       └── presentation/              — Flutter widgets + BLoCs, one folder per screen concept
│           ├── splash/
│           │   └── splash_page.dart
│           ├── welcome/
│           │   └── welcome_page.dart
│           ├── login/
│           │   ├── bloc/
│           │   │   ├── login_bloc.dart
│           │   │   ├── login_event.dart
│           │   │   └── login_state.dart
│           │   └── login_page.dart
│           ├── signup/
│           │   ├── bloc/
│           │   │   ├── signup_bloc.dart
│           │   │   ├── signup_event.dart
│           │   │   └── signup_state.dart
│           │   ├── signup_email_password_page.dart
│           │   ├── signup_tenant_name_page.dart
│           │   └── signup_success_page.dart
│           ├── personal_info/
│           │   └── personal_info_page.dart
│           └── widgets/               — shared across login, signup, and all sub-flows
│               ├── password_rules_list.dart
│               ├── tenant_availability_indicator.dart
│               └── step_progress_indicator.dart
│
├── app.dart                       MaterialApp.router, theme + l10n wiring
└── main.dart                      Bootstrap: DI, runApp
```

### Naming conventions for the presentation layer

- **One folder per screen concept.** `splash/`, `welcome/`, `login/`, `signup/`, `personal_info/` are each their own folder under `presentation/`. A folder is a "flow" — even a single-page flow gets its own folder so new pages can be added without churn.
- **Files carry their flow prefix.** Inside `signup/`, pages are named `signup_email_password_page.dart`, `signup_tenant_name_page.dart`, `signup_success_page.dart`. Inside `login/`, it's `login_page.dart`. The prefix makes the flow obvious at a glance in the Dart DevTools stack, in import lines, and in search results — no ambiguity between a "success_page" that belongs to sign-up vs. some future flow.
- **BLoC lives inside the flow it drives.** `presentation/signup/bloc/{signup_bloc,signup_event,signup_state}.dart`, `presentation/login/bloc/…`. The BLoC folder sits next to the pages that subscribe to it — open the flow folder and you see the whole thing in one glance.
- **Shared widgets live in `presentation/widgets/`.** Anything reused across `login/`, `signup/`, `personal_info/`, or any future flow (e.g., `PasswordRulesList`, `TenantAvailabilityIndicator`, `StepProgressIndicator`) lives here. If a widget is only used by one flow, it stays inside that flow's folder.
- **Use cases live in `domain/usecases/`.** One file per action the BLoC can trigger — every repository call has its own use case class. Cross-flow by design, not owned by any single page.
- **Splash, welcome, and personal_info are their own folders too.** Even though they're single-page today, giving them their own folder avoids a future rename when we add, e.g., a tenant-picker alongside welcome, or a profile-photo step inside personal_info.

## Value Objects — the heart of the domain layer

Primitive obsession is the enemy. Instead of passing `String email` around, wrap it in an `EmailAddress` value object that can never exist in an invalid state.

### The `ValueObject<T>` base

Every value object extends a tiny base class defined once in `core/domain/value_object.dart`:

```dart
// core/domain/value_object.dart
@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  /// Returns the stored value if valid; throws [UnexpectedValueError] otherwise.
  /// Only call at trust boundaries where you've already validated.
  T getOrCrash() => value.fold((f) => throw UnexpectedValueError(f), id);

  bool get isValid => value.isRight();

  @override
  bool operator ==(Object other) =>
      other is ValueObject<T> && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
```

### Concrete value object

```dart
// features/auth/domain/value_objects/email_address.dart
class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) => EmailAddress._(_validate(input));
  const EmailAddress._(this.value);

  /// A "blank but not yet validated" instance. Safe to use as a [@Default]
  /// in freezed state because it's const.
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

Note: `const Left(...)` from `dartz` is what makes `@Default(EmailAddress.pure())` compile in freezed state classes. The `.pure()` constructor is the sentinel every field starts in before the user has typed anything.

Value objects to create for this test (each one maps to a literal sentence in the test PDF):

- `EmailAddress` — PDF: *"any valid email address."* Use an RFC-ish regex.
- `Password` — PDF: *"The password should pass the validation"* driven by `GetPasswordComplexitySetting`. Validate against the injected `PasswordPolicy`, never hardcode.
- `TenantName` — PDF: *"Tenant names should start with a letter and can contain numbers and dashes."* Pattern: `^[a-z][a-z0-9-]*$`, 2–63 chars. Input is lowercased before validation because the name becomes a DNS-safe subdomain (`https://{TENANCY_NAME}.workiom.com/`).
- `PersonName` — PDF: *"It should be Letters only."* Use Unicode letter matching only (`^\p{L}+$` or `^[A-Za-z]+$` for a stricter reading). No digits, no punctuation. If the UI allows a space between given names, strip it before constructing the value object — the server side is "Letters only" full stop.

Every form field maps to a value object. The BLoC state holds value objects, not raw strings.

## BLoC with events and states

A single `SignUpBloc` orchestrates the whole flow. State is a freezed immutable class; events are a sealed family with `const` constructors (every event is immutable).

### Events

```dart
// features/auth/presentation/signup/bloc/signup_event.dart
sealed class SignUpEvent {
  const SignUpEvent();
}

class SignUpStarted extends SignUpEvent {
  const SignUpStarted();
}

class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged(this.email);
  final String email;
}

class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.password);
  final String password;
}

class SignUpEditionSelected extends SignUpEvent {
  const SignUpEditionSelected(this.editionId);
  final int editionId;
}

class SignUpTenantNameChanged extends SignUpEvent {
  const SignUpTenantNameChanged(this.name);
  final String name;
}

class SignUpFirstNameChanged extends SignUpEvent {
  const SignUpFirstNameChanged(this.firstName);
  final String firstName;
}

class SignUpLastNameChanged extends SignUpEvent {
  const SignUpLastNameChanged(this.lastName);
  final String lastName;
}

class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}
```

### State

For async data (editions, password policy) the state uses a small in-house `DataState<T>` sealed union — *not* Riverpod's `AsyncValue`. BLoC + Riverpod's types is an anti-pattern; build the tiny sum type yourself.

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

Status of the in-flight tenant-availability check and the final submission each get their own narrow enum — these don't carry data, so a sealed `DataState<T>` would be overkill.

```dart
// features/auth/presentation/signup/bloc/signup_state.dart
enum SubmissionStatus { idle, submitting, success, failure }

@freezed
sealed class TenantAvailability with _$TenantAvailability {
  const factory TenantAvailability.unknown() = _Unknown;
  const factory TenantAvailability.checking() = _Checking;
  const factory TenantAvailability.available() = _Available;
  const factory TenantAvailability.taken() = _Taken;
}

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(DataState<List<Edition>>.idle()) DataState<List<Edition>> editions,
    @Default(DataState<PasswordPolicy>.idle()) DataState<PasswordPolicy> passwordPolicy,
    int? selectedEditionId,
    @Default(EmailAddress.pure()) EmailAddress email,
    @Default(Password.pure()) Password password,
    @Default(TenantName.pure()) TenantName tenantName,
    @Default(TenantAvailability.unknown()) TenantAvailability tenantAvailability,
    @Default(PersonName.pure()) PersonName firstName,
    @Default(PersonName.pure()) PersonName lastName,
    @Default(SubmissionStatus.idle) SubmissionStatus submissionStatus,
    AuthFailure? failure,
  }) = _SignUpState;
}
```

### Bloc

The constructor uses **named required parameters** — positional args break down fast with several dependencies, and named args match the DI registration exactly. Every action the BLoC triggers is a use case injected by name. The BLoC never reaches past the use case into `AuthRepository` directly.

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
      transformer: _debounce(const Duration(milliseconds: 500)),
    );
    on<SignUpFirstNameChanged>(_onFirstNameChanged);
    on<SignUpLastNameChanged>(_onLastNameChanged);
    on<SignUpSubmitted>(_onSubmitted, transformer: droppable());
  }

  final GetEditions _getEditions;
  final GetPasswordPolicy _getPasswordPolicy;
  final CheckTenantAvailable _checkTenantAvailable;
  final RegisterAndAuthenticate _registerAndAuthenticate;

  Future<void> _onStarted(SignUpStarted event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(
      editions: const DataState.loading(),
      passwordPolicy: const DataState.loading(),
    ));
    final results = await Future.wait([
      _getEditions(),
      _getPasswordPolicy(),
    ]);
    emit(state.copyWith(
      editions: (results[0] as Either<AuthFailure, List<Edition>>).fold(
        (f) => DataState.failure(f),
        (data) => DataState.success(data),
      ),
      passwordPolicy: (results[1] as Either<AuthFailure, PasswordPolicy>).fold(
        (f) => DataState.failure(f),
        (data) => DataState.success(data),
      ),
    ));
  }

  // _onTenantNameChanged → await _checkTenantAvailable(state.tenantName);
  // _onSubmitted → await _registerAndAuthenticate(email, password, ...);
}

/// Custom transformer built on rxdart. **Not** from `bloc_concurrency` —
/// that package only ships `droppable`, `restartable`, `sequential`, and
/// `concurrent`. Debounce has to be hand-rolled, and it's a one-liner.
EventTransformer<T> _debounce<T>(Duration duration) =>
    (events, mapper) => events.debounceTime(duration).switchMap(mapper);
```

The splash page's "Initial Step" check uses the `GetCurrentSession` use case in the same way — injected by name into the splash widget's controller, never reaching into the repository directly.

Note the transformers — this is why you use BLoC over Cubit. Events naturally support backpressure (`_debounce` for the typing-driven availability check), one-at-a-time semantics (`droppable()` on submit), and stream transforms.

## Use Cases

Use cases live in `features/auth/domain/usecases/`. Every action the BLoC (or splash controller) can trigger has its own use case class, one per file. The BLoC declares its dependencies as a set of use cases and never touches `AuthRepository` directly — all repo access flows through the domain's use-case layer.

### The simple single-call use cases

Six of the seven use cases are thin forwarders around one repository method. They look the same: a constructor takes the repository, `call(...)` returns `Either<AuthFailure, Entity>`. Each one maps to exactly one PDF phase.

```dart
// features/auth/domain/usecases/get_current_session.dart
// PDF: Initial Step (cold start) + Login Information (after auth)
class GetCurrentSession {
  GetCurrentSession(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, UserSession?>> call() =>
      _repository.getCurrentSession();
}
```

```dart
// features/auth/domain/usecases/get_editions.dart
// PDF: Getting Editions
class GetEditions {
  GetEditions(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, List<Edition>>> call() =>
      _repository.getEditions();
}
```

```dart
// features/auth/domain/usecases/get_password_policy.dart
// PDF: Asking for information — password rules from GetPasswordComplexitySetting
class GetPasswordPolicy {
  GetPasswordPolicy(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, PasswordPolicy>> call() =>
      _repository.getPasswordPolicy();
}
```

```dart
// features/auth/domain/usecases/check_tenant_available.dart
// PDF: Asking for information — tenant name availability
class CheckTenantAvailable {
  CheckTenantAvailable(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, TenantAvailability>> call(TenantName name) =>
      _repository.checkTenantAvailable(name);
}
```

```dart
// features/auth/domain/usecases/register_tenant.dart
// PDF: Register a tenant with user
class RegisterTenant {
  RegisterTenant(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, RegisteredTenant>> call({
    required EmailAddress email,
    required Password password,
    required TenantName tenantName,
    required PersonName firstName,
    required PersonName lastName,
    required int editionId,
  }) =>
      _repository.registerTenant(
        email: email,
        password: password,
        tenantName: tenantName,
        firstName: firstName,
        lastName: lastName,
        editionId: editionId,
      );
}
```

```dart
// features/auth/domain/usecases/authenticate.dart
// PDF: Login the user In
class Authenticate {
  Authenticate(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, AuthToken>> call({
    required EmailAddress email,
    required Password password,
    required TenantName tenancyName,
  }) =>
      _repository.authenticate(
        email: email,
        password: password,
        tenancyName: tenancyName,
      );
}
```

### The one orchestrator

`RegisterAndAuthenticate` chains three steps — register the tenant, authenticate the new admin user, fetch the authenticated session — and short-circuits on the first failure. This is the one place where the domain actually encodes a multi-step workflow instead of forwarding a single call. It composes the single-call use cases rather than reaching past them into the repository, so the domain layer stays coherent.

```dart
// features/auth/domain/usecases/register_and_authenticate.dart
// Orchestrator: RegisterTenant → Authenticate → GetCurrentSession
class RegisterAndAuthenticate {
  RegisterAndAuthenticate({
    required RegisterTenant registerTenant,
    required Authenticate authenticate,
    required GetCurrentSession getCurrentSession,
  })  : _registerTenant = registerTenant,
        _authenticate = authenticate,
        _getCurrentSession = getCurrentSession;

  final RegisterTenant _registerTenant;
  final Authenticate _authenticate;
  final GetCurrentSession _getCurrentSession;

  Future<Either<AuthFailure, UserSession>> call({
    required EmailAddress email,
    required Password password,
    required TenantName tenantName,
    required PersonName firstName,
    required PersonName lastName,
    required int editionId,
  }) async {
    final registered = await _registerTenant(
      email: email,
      password: password,
      tenantName: tenantName,
      firstName: firstName,
      lastName: lastName,
      editionId: editionId,
    );
    return registered.fold(
      left,
      (_) async {
        final authed = await _authenticate(
          email: email,
          password: password,
          tenancyName: tenantName,
        );
        return authed.fold(
          left,
          (_) async {
            final session = await _getCurrentSession();
            return session.fold(
              left,
              (s) => s == null
                  ? left(const AuthFailure.generic(Failure.unknown()))
                  : right(s),
            );
          },
        );
      },
    );
  }
}
```

### Contract

All use cases follow the same contract:

- Take value objects (never raw strings) as parameters.
- Return `Either<AuthFailure, Entity>` — never throw, never return a DTO.
- Are invoked by calling `useCase()` thanks to the `call` method name (`Dart` idiom for callable classes).
- Get injected into the BLoC by name via `get_it`; the BLoC declares them as `required` constructor params.

## Repository pattern

Abstract in domain, concrete in infrastructure. The BLoC only ever sees the abstract interface.

```dart
// domain/repositories/auth_repository.dart
abstract class AuthRepository {
  Future<Either<AuthFailure, UserSession?>> getCurrentSession();
  Future<Either<AuthFailure, List<Edition>>> getEditions();
  Future<Either<AuthFailure, PasswordPolicy>> getPasswordPolicy();
  Future<Either<AuthFailure, TenantAvailability>> checkTenantAvailable(TenantName name);
  Future<Either<AuthFailure, RegisteredTenant>> registerTenant({ ... });
  Future<Either<AuthFailure, AuthToken>> authenticate({ ... });
}
```

```dart
// infrastructure/repositories/auth_repository_impl.dart
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._datasource);
  final AuthRemoteDatasource _datasource;

  @override
  Future<Either<AuthFailure, List<Edition>>> getEditions() async {
    try {
      final dtos = await _datasource.getEditions();
      return right(dtos.map((d) => d.toDomain()).toList());
    } on DioException catch (e) {
      return left(AuthFailure.fromDio(e));
    }
  }
  // ...
}
```

## Failures

Replace exceptions with a sealed `Failure` hierarchy. The whole app uses `Either<Failure, T>` (via `dartz`) for error propagation.

### Two-level hierarchy

`Failure` has two tiers: **generic, transport-level failures** live in `core/error/failures.dart` and are reused by every feature. **Feature-specific semantic failures** (like "tenant taken") live under that feature's `domain/failures/` folder. The interceptor throws generic; the repository catches, sometimes maps to feature-specific.

```dart
// core/error/failures.dart — used across features
@freezed
sealed class Failure with _$Failure {
  const factory Failure.network() = NetworkFailure;
  const factory Failure.timeout() = TimeoutFailure;
  const factory Failure.server({required int code, String? message, Map<String, List<String>>? validationErrors}) = ServerFailure;
  const factory Failure.unauthorized() = UnauthorizedFailure;
  const factory Failure.unknown() = UnknownFailure;
}
```

```dart
// features/auth/domain/failures/auth_failure.dart — feature-specific
@freezed
sealed class AuthFailure with _$AuthFailure {
  // Passthrough for generic issues — wraps a core Failure.
  const factory AuthFailure.generic(Failure failure) = _Generic;

  // Auth-specific semantic failures.
  const factory AuthFailure.tenantTaken() = _TenantTaken;
  const factory AuthFailure.invalidCredentials() = _InvalidCredentials;
  const factory AuthFailure.validation(Map<String, String> fieldErrors) = _Validation;
}
```

The `AuthRepositoryImpl` catches `DioException`, converts it to a generic `Failure` via an extension on `DioException`, then wraps it in `AuthFailure.generic(...)` unless the response body indicates a more specific semantic case (tenant taken, invalid credentials) in which case it returns the narrower variant.

Presentation maps each case to a localized user message. Failures never leak technical details to the UI.

## Dependency injection

Dependency injection is handled **only by `get_it`** — no `injectable`, no codegen. All registrations live in a single file (`core/di/injection.dart`) so the entire object graph is visible at a glance. This is the "composition root" pattern, and for an app of this size it is both clearer and faster to reason about than annotation-driven DI.

Registration lifetimes:

- `registerLazySingleton` — created on first resolution, reused forever. Use for clients and repositories (Dio, SecureStorage, AuthRepository).
- `registerFactory` — new instance every time. Use for BLoCs (fresh state per page) and stateful use cases.
- `registerSingleton` — created eagerly at startup. Use only when eager construction matters.

```dart
// core/di/injection.dart
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/authenticate.dart';
import '../../features/auth/domain/usecases/check_tenant_available.dart';
import '../../features/auth/domain/usecases/get_current_session.dart';
import '../../features/auth/domain/usecases/get_editions.dart';
import '../../features/auth/domain/usecases/get_password_policy.dart';
import '../../features/auth/domain/usecases/register_and_authenticate.dart';
import '../../features/auth/domain/usecases/register_tenant.dart';
import '../../features/auth/infrastructure/datasources/auth_remote_datasource.dart';
import '../../features/auth/infrastructure/repositories/auth_repository_impl.dart';
import '../../features/auth/presentation/signup/bloc/signup_bloc.dart';
import '../constants/api_constants.dart';
import '../network/dio_client.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../network/interceptors/error_interceptor.dart';
import '../network/interceptors/logging_interceptor.dart';
import '../storage/secure_storage.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // ─── Core: storage ─────────────────────────────────────────────
  getIt.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage(getIt()));

  // ─── Core: network ─────────────────────────────────────────────
  getIt.registerLazySingleton<Dio>(() => DioClient.create(
        baseUrl: ApiConstants.baseUrl,
        interceptors: [
          AuthInterceptor(getIt()),
          LoggingInterceptor(),
          ErrorInterceptor(),
        ],
      ));

  // ─── Feature: auth — infrastructure ────────────────────────────
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );

  // ─── Feature: auth — domain (use cases) ────────────────────────
  // One use case per action. Lazy singletons — they're stateless forwarders,
  // cheap to hold onto, no reason to reconstruct them per call.
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

  // ─── Feature: auth — presentation (BLoCs) ──────────────────────
  // Factory, not singleton — fresh bloc per sign-up flow mount.
  getIt.registerFactory(() => SignUpBloc(
        getEditions: getIt(),
        getPasswordPolicy: getIt(),
        checkTenantAvailable: getIt(),
        registerAndAuthenticate: getIt(),
      ));
}
```

Bootstrap from `main.dart`:

```dart
// main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const WorkiomApp());
}
```

Resolve a BLoC in a widget:

```dart
BlocProvider(
  create: (_) => getIt<SignUpBloc>()..add(SignUpStarted()),
  child: const SignUpEmailPasswordPage(),
)
```

### Why no `injectable`

- **One file, zero magic.** Any developer can open `injection.dart` and see the full dependency graph in 60 seconds. No annotations to trace, no generated file to hunt through.
- **Faster cold start of the toolchain.** Removes a `build_runner` pass on every change to an annotated class.
- **Fewer moving parts for a test of this size.** Codegen is worth it once you have dozens of injectable classes. This project has maybe fifteen.
- **Still perfectly testable.** Swap registrations in `setUp()` for tests: `getIt.registerLazySingleton<AuthRepository>(() => MockAuthRepository())`.

### Resetting during tests

```dart
setUp(() async {
  await getIt.reset();
  // register test doubles
});
```

## Routing

`go_router` with redirect-based auth gating. The router listens to an auth-state `Stream<AuthStatus>` exposed by `AuthRepository` to decide where to send the user on boot. No `AuthCubit` — an auth *Bloc* would be overkill for something with two possible states (authenticated / anonymous); a raw stream from the repository is the right size.

### Route table

| Path | Page file | Notes |
| --- | --- | --- |
| `/splash` | `splash/splash_page.dart` | Session check on cold start; redirects to `/welcome` or `/home`. |
| `/welcome` | `welcome/welcome_page.dart` | Entry landing: "Sign in" / "Create workspace" CTAs. |
| `/login` | `login/login_page.dart` | Scaffolded stub — login flow is out of scope for this test. |
| `/signup` | ShellRoute — hosts `BlocProvider<SignUpBloc>` | Parent route; children share one bloc instance. |
| `/signup/email-password` | `signup/signup_email_password_page.dart` | First signup step. |
| `/signup/tenant-name` | `signup/signup_tenant_name_page.dart` | Second step, debounced availability check. |
| `/signup/personal-info` | `personal_info/personal_info_page.dart` | Third step, first + last name. |
| `/signup/success` | `signup/signup_success_page.dart` | Post-registration landing. |

### Why a `ShellRoute` for sign-up

The sign-up flow is **one logical BLoC across four pages**. If you wrap each page in its own `BlocProvider(create: (_) => getIt<SignUpBloc>())`, every navigation destroys the bloc and discards everything the user has typed. The correct pattern is:

```dart
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

Every child page reads the same `SignUpBloc` via `context.read<SignUpBloc>()` or `BlocBuilder<SignUpBloc, SignUpState>`. The bloc is torn down when the user leaves the `ShellRoute` (e.g., lands on `/signup/success` and then taps "Continue to workspace").

`go_router` redirect logic gates access:

```dart
redirect: (context, state) {
  final isAuthed = authStatus.value == AuthStatus.authenticated;
  if (isAuthed && state.matchedLocation.startsWith('/signup')) return '/home';
  if (!isAuthed && state.matchedLocation == '/home') return '/welcome';
  return null;
}
```

## Testing boundaries

The three-layer split lets you test each layer in isolation:

| Layer | Test tool | What you prove |
| --- | --- | --- |
| Domain (value objects) | `test` | Invariants: no invalid state can exist. |
| Domain (use cases) | `mocktail` on repository | Orchestration is correct; repo methods called in the right order with the right args. |
| Infrastructure (repository) | `mocktail` on datasource | DTO → domain mapping, error mapping, ABP envelope unwrapping. |
| Presentation (BLoC) | `bloc_test` | Event → State transitions match expectations. |
| Presentation (widgets) | `flutter_test` | Widget renders correct state, dispatches correct event. |

## What this architecture rejects

- **A separate `application/` layer.** BLoC is presentation-adjacent in Flutter — three layers is simpler and matches how the imports actually flow.
- **BLoCs reaching past the domain.** No `AuthRepository` in a BLoC constructor. Every action goes through a use case; that's the whole point of the `usecases/` folder.
- **Cubit for this flow.** Events + transformers give you debouncing and cleaner history. Cubit is fine for trivial state; the sign-up flow isn't trivial.
- **DTOs leaking into Domain or Presentation.** DTOs exist in `infrastructure/` only.
- **Flutter imports in Domain.** Pure Dart — no `flutter_bloc`, no widgets, no Dio.
- **A single `Models` folder for the whole app.** Models are feature-scoped.
- **Manual DI (passing things through constructors all the way down).** Use `get_it`.
- **Strings hardcoded in widgets.** Everything routes through `AppLocalizations`.

## Related docs

- [`02-API-REFERENCE.md`](02-API-REFERENCE.md) — endpoint shapes that drive DTOs
- [`03-ROADMAP.md`](03-ROADMAP.md) — build order with layer-by-layer tasks
- [`04-BEST-PRACTICES.md`](04-BEST-PRACTICES.md) — code style rules
- [`06-UI-SYSTEM.md`](06-UI-SYSTEM.md) — theming, localization, SVG icon pipeline
