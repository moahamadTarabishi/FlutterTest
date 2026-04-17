---
doc: 04-best-practices
title: "Best Practices — coding conventions, dependencies, analyzer config, and BLoC rules"
role: "The quality bar. Every rule has a reason; follow the reasoning."
audience: "Engineers writing Dart in this repo; reviewers checking whether the code meets the bar."
reads_like: "A house-style guide — short imperative rules with rationale."
prerequisites:
  - docs/01-ARCHITECTURE.md
leads_to:
  - docs/05-SUBMISSION-CHECKLIST.md
related:
  - docs/02-API-REFERENCE.md
  - docs/06-UI-SYSTEM.md
  - CLAUDE.md
last_reviewed: 2026-04-17
---

# 04 — Best Practices

The quality bar the code in this repository must meet. Each rule has a reason — follow the reasoning, not just the rule.

## 1. Dependencies

Add these to `pubspec.yaml` under `dependencies`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:           # core l10n delegates
    sdk: flutter
  flutter_bloc: ^8.1.3             # BLoC pattern (events + states)
  bloc_concurrency: ^0.2.4         # debounce / droppable / restartable transformers
  rxdart: ^0.27.7                  # Stream operators (used by transformers)
  dio: ^5.4.0
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1
  dartz: ^0.10.1                   # Either<Failure, T> across the app
  get_it: ^7.6.4                   # DI — manual composition root, no codegen
  go_router: ^13.0.0
  flutter_secure_storage: ^9.0.0
  flutter_svg: ^2.0.9              # SVG icons exported from Figma
  intl: ^0.19.0                    # date/number formatting + l10n
```

And `dev_dependencies`:

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  very_good_analysis: ^5.1.0
  build_runner: ^2.4.7              # for freezed + json_serializable only
  freezed: ^2.5.2                   # 2.5.x is the minimum for `sealed class` syntax
  json_serializable: ^6.7.1
  mocktail: ^1.0.1
  bloc_test: ^9.1.5
```

Notes on the dependency choices:

- **`build_runner`** is still needed for `freezed` (state classes, sealed unions, DTOs) and `json_serializable` (DTO `fromJson`/`toJson`). It is **not** used for DI — DI is registered manually in `core/di/injection.dart`.
- **`freezed ^2.5.x`**: the architecture uses `sealed class` unions (`Failure`, `AuthFailure`, `DataState<T>`, `TenantAvailability`, `SignUpEvent`) which freezed only began emitting natively in 2.5.0. Earlier versions emit deprecated abstract-class unions that don't play nicely with Dart 3 `switch` exhaustiveness.
- **No `equatable`**: every state, event, failure, and value object in this project is either a `@freezed` class (equality synthesized) or extends `ValueObject<T>` (hand-rolled `==`/`hashCode`). `equatable` adds a dependency and a parallel equality API for zero gain — drop it. If you later find yourself writing a non-freezed, non-value-object class that needs value equality, prefer adding freezed to it over reintroducing `equatable`.
- **No `flutter_timezone`**: the sign-up flow never reads the device timezone. ABP returns UTC timestamps and the success screen formats them with `intl`'s `DateFormat`, which honours the device locale without an explicit timezone lookup. Adding a native-plugin dependency we don't call through is dead weight the reviewer will notice.
- **Generic DTOs need `genericArgumentFactories`**: `AbpResponse<T>` wraps every endpoint's payload, so freezed + json_serializable can't synthesise its `fromJson` without being told how to decode `T`. Annotate it like this:
  ```dart
  @Freezed(genericArgumentFactories: true)
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
  Callers then decode with an explicit factory, e.g.
  ```dart
  final envelope = AbpResponse<LoginInfoDto>.fromJson(
    raw,
    (json) => LoginInfoDto.fromJson(json! as Map<String, dynamic>),
  );
  ```
  Without `genericArgumentFactories: true`, `build_runner` generates a `_$AbpResponseFromJson` that can't see what to do with `T` and fails the build.

Pin exact versions for the submission (no `^`) once it works, so the reviewer gets a reproducible build.

## 2. Analyzer configuration

`analysis_options.yaml`:

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

`flutter analyze` must return zero issues before every commit.

## 3. Naming

| Kind | Convention | Example |
| --- | --- | --- |
| Files | `snake_case.dart` | `auth_repository_impl.dart` |
| Classes | `PascalCase` | `SignUpBloc` |
| Private members | leading `_` | `_emailController` |
| Constants | `lowerCamelCase`, `const` | `const kApiTimeout = Duration(seconds: 30);` |
| Booleans | `is`, `has`, `should`, `can` | `isRegistrable`, `hasTrial` |
| Async methods | verb-first | `fetchEditions`, `registerTenant` |
| Streams | noun + `Stream` | `authStateStream` |

## 4. Widget composition

- **One widget per file.** Exception: tightly-coupled private subwidgets.
- **Prefer `const` constructors.** If a widget's subtree is static, `const` it. Every `const` is a rebuild skipped.
- **Keep `build()` under 50 lines.** Extract subwidgets aggressively.
- **Never perform I/O in `build()`.** Not Dio, not SharedPreferences, nothing. Kick it off in `initState` or by dispatching an event to the bloc.
- **Never call `setState` inside `build()`.**
- **Use `BlocBuilder` with `buildWhen`** to prevent unnecessary rebuilds:

```dart
BlocBuilder<SignUpBloc, SignUpState>(
  buildWhen: (prev, curr) => prev.tenantAvailability != curr.tenantAvailability,
  builder: (context, state) { ... },
)
```

## 5. State management rules (BLoC, not Cubit)

This project uses the event-driven BLoC pattern — Cubits are explicitly rejected. See [`01-ARCHITECTURE.md`](01-ARCHITECTURE.md) for the full rationale.

- Events are a **sealed class** family. State is a single **`@freezed`** class.
- BLoCs hold **no `BuildContext`**. Context belongs to widgets.
- Never emit a state that duplicates the previous one — subscribers rebuild for nothing.
- Side effects (navigation, snackbars) are handled via `BlocListener`, not inside the bloc.
- Use **event transformers** to declare concurrency intent:
  - `droppable()` — from `bloc_concurrency` — for submit events so double-taps don't queue.
  - `restartable()` — from `bloc_concurrency` — for cancel-previous behaviors (e.g., live search).
  - `debounce()` — **not shipped by `bloc_concurrency`**; built as a one-liner on top of `rxdart`'s `debounceTime`. Use for text-field-driven events like tenant availability.

```dart
// A private top-level helper kept next to the bloc.
EventTransformer<T> _debounce<T>(Duration duration) =>
    (events, mapper) => events.debounceTime(duration).switchMap(mapper);

on<SignUpTenantNameChanged>(
  _onTenantNameChanged,
  transformer: _debounce(const Duration(milliseconds: 500)),
);

on<SignUpSubmitted>(
  _onSubmitted,
  transformer: droppable(),
);
```

Dispatching an event from a widget:

```dart
context.read<SignUpBloc>().add(SignUpEmailChanged(value));
```

Listening for side effects:

```dart
BlocListener<SignUpBloc, SignUpState>(
  listenWhen: (prev, curr) => prev.submissionStatus != curr.submissionStatus,
  listener: (context, state) {
    if (state.submissionStatus == SubmissionStatus.success) {
      context.go('/success');
    } else if (state.submissionStatus == SubmissionStatus.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.failure!.toLocalizedMessage(context))),
      );
    }
  },
  child: ...,
)
```

Rebuilding efficiently:

```dart
BlocBuilder<SignUpBloc, SignUpState>(
  buildWhen: (prev, curr) => prev.tenantAvailability != curr.tenantAvailability,
  builder: (context, state) => TenantAvailabilityIndicator(status: state.tenantAvailability),
)
```

## 6. Networking

- All API calls go through a single `DioClient`. No direct `Dio()` instantiations.
- Timeouts: 30s connect, 30s receive. No "forever" requests.
- Every request is logged in debug, silenced in release.
- Parse responses via generated `fromJson`, never by hand.
- Catch `DioException` once in a global interceptor, map to a generic `Failure` (defined in `core/error/failures.dart`). Don't litter try/catch throughout the repository.

```dart
// core/network/interceptors/error_interceptor.dart
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final failure = switch (err.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
          const Failure.timeout(),
      DioExceptionType.connectionError => const Failure.network(),
      DioExceptionType.badResponse when err.response?.statusCode == 401 =>
          const Failure.unauthorized(),
      DioExceptionType.badResponse => Failure.server(
          code: err.response?.statusCode ?? 0,
          message: _extractAbpMessage(err.response?.data),
          validationErrors: _extractValidationErrors(err.response?.data),
        ),
      _ => const Failure.unknown(),
    };
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: failure,
      ),
    );
  }
}
```

The repository then catches `DioException`, reads `err.error as Failure`, and decides whether to surface it as a generic `AuthFailure.generic(failure)` or a narrower semantic variant like `AuthFailure.tenantTaken()` based on the response body.

## 7. Validation via domain value objects

Validation lives in the **domain layer** as value objects, not in widgets or a shared validators file. The principle (straight from DDD's value-object pattern): an `EmailAddress` can never exist in an invalid state.

```dart
// features/auth/domain/value_objects/email_address.dart
class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) => EmailAddress._(_validate(input));
  const EmailAddress._(this.value);
  const EmailAddress.pure() : value = const Left(ValueFailure.empty());

  @override
  final Either<ValueFailure<String>, String> value;

  static Either<ValueFailure<String>, String> _validate(String input) {
    if (input.isEmpty) return left(const ValueFailure.empty());
    final regex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
    return regex.hasMatch(input) ? right(input) : left(ValueFailure.invalidEmail(failedValue: input));
  }
}
```

- Server-driven rules (password policy) are passed into the value-object factory, not hardcoded.
- Widgets show errors by calling `valueObject.value.fold(...)`.
- Validate on submit and on blur, not on every keystroke.
- Every form field in state is a value object, never a raw `String`.

## 8. Error handling

- Show user-friendly messages. Never surface raw `DioException.toString()` to the user.
- Every failure has a UX answer: inline field error, snackbar, full-screen error, or retry dialog. Pick intentionally.
- Log the full error in debug; log only sanitized summaries in release.

## 9. Secrets and config

- The base URL is a `const`, not an env var for this test.
- The auth token is in `flutter_secure_storage` — never in `SharedPreferences`, never in memory-only state.
- No API keys should be required; if you add analytics/crash reporting, gate behind a flag and document in README.

## 10. Assets and platform

- Brand color palette lives in `AppColors` with both `light` and `dark` variants. Never inline a hex in a widget.
- **Light and dark ThemeData** both exist. `MaterialApp.themeMode` is `ThemeMode.system` so the OS setting wins by default.
- Brightness-aware colors use `Theme.of(context).colorScheme.X` — widgets never hardcode light-only colors.
- Icons are **SVG exports from Figma**, stored under `assets/icons/`. Rendered with `flutter_svg`:
  ```dart
  SvgPicture.asset('assets/icons/email.svg', width: 20, colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onSurface, BlendMode.srcIn))
  ```
- App icon generated from the brand logo via `flutter_launcher_icons`.
- Native splash configured via `flutter_native_splash` with both light and dark variants — avoids the flash on cold start.
- Status bar style set explicitly per theme (dark icons on light, light on dark), via `AnnotatedRegion<SystemUiOverlayStyle>` or `AppBarTheme.systemOverlayStyle`.

See [`06-UI-SYSTEM.md`](06-UI-SYSTEM.md) for the full theming + icon pipeline.

## 10a. Localization

- All user-facing strings come from `AppLocalizations.of(context)`, generated from ARB files.
- Minimum supported locales: `en` (English) and `ar` (Arabic). Arabic enables RTL testing.
- `MaterialApp.localizationsDelegates` wires the delegates; `supportedLocales` lists the locales.
- Never concatenate translated strings — use `.arb` placeholders:
  ```json
  "welcomeUser": "Welcome, {name}",
  "@welcomeUser": { "placeholders": { "name": { "type": "String" } } }
  ```
- Directionality flips automatically via `Directionality.of(context)` — use `EdgeInsetsDirectional`, not `EdgeInsets`, for left/right padding.
- Failure messages map to l10n keys, not hardcoded English:
  ```dart
  extension AuthFailureL10n on AuthFailure {
    String toLocalizedMessage(BuildContext context) {
      final l10n = AppLocalizations.of(context)!;
      return switch (this) {
        _Network() => l10n.errorNetwork,
        _TenantTaken() => l10n.errorTenantTaken,
        // ...
      };
    }
  }
  ```

See [`06-UI-SYSTEM.md`](06-UI-SYSTEM.md) for the full l10n setup.

## 11. Git hygiene

- One logical change per commit. No "WIP" or "fixes" in the final history.
- Commit message format: `<type>: <subject>` — e.g., `feat: tenant availability check with debounce`.
- Use `main` branch only. Feature branches are overkill for a test of this size.
- Include `.idea/`, `.vscode/`, `build/`, `.dart_tool/` in `.gitignore`.

## 12. README and docs

- The root `README.md` must show setup + run in ≤ 5 steps.
- A screenshot or GIF of the sign-up flow goes a long way.
- Link to this `docs/` directory from the README.
- Architecture decisions that deviate from the obvious go in `docs/` with rationale.

## 13. Testing priorities

Budget for tests in this order:

1. **Value object validators** (`test/features/auth/domain/value_objects/email_address_test.dart`, `password_test.dart`, `tenant_name_test.dart`, `person_name_test.dart`) — 15 minutes, proves the domain invariants.
2. **Repository error mapping** (`test/features/auth/infrastructure/repositories/auth_repository_impl_test.dart`) — 30 minutes, proves resilience when the datasource throws.
3. **Use case orchestration** (`test/features/auth/domain/usecases/register_and_authenticate_test.dart`) — 15 minutes, proves the three-step register→authenticate→getCurrentSession chain calls repo methods in the right order and bails on the first failure.
4. **Happy-path bloc test** (`test/features/auth/presentation/signup/bloc/signup_bloc_test.dart`) — 30 minutes, uses `bloc_test` to prove the full `SignUpStarted` → `SignUpSubmitted` sequence emits the right states.
5. Golden tests — only if time remains.

Tests mirror the three-layer split: files under `test/features/auth/domain/…` only import domain, files under `test/features/auth/infrastructure/…` import infrastructure + domain, and files under `test/features/auth/presentation/…` import presentation + domain. Bloc tests live next to the bloc they cover (`test/features/auth/presentation/signup/bloc/`). Widget tests live one directory up (`test/features/auth/presentation/signup/`) and use `MaterialApp` wrappers with a test `BlocProvider`.

## 14. Red flags the reviewer will look for

Avoid every one of these:

- `print()` statements in committed code
- `// TODO` comments left in for the reviewer to find
- Hardcoded URLs in widgets
- `setState` inside an async callback without a `mounted` check
- Large files with mixed responsibilities (a 500-line page widget)
- `any` or `dynamic` types (Dart has types — use them)
- Empty `catch (e) {}` blocks that swallow errors
- `Navigator.of(context).push(...)` mixed with `go_router`
- Unused imports
- A `pubspec.yaml` with a dozen packages you don't actually use

## 15. Green flags — things that separate your submission

- A working end-to-end flow against the real API
- Clean Architecture layering (domain / infrastructure / presentation) visible in the folder structure at first glance
- Event-driven BLoC with explicit transformers (`debounce`, `droppable`)
- Value objects for every form input (no raw `String`s in state)
- Live password rule checklist driven by `GetPasswordComplexitySetting`
- Debounced tenant availability check with three visible states (checking / available / taken)
- A `Failure` sealed class mapping every error category to a localized message
- Both light and dark themes that actually look designed (not just inverted)
- Arabic locale works end-to-end with correct RTL layout
- SVG icons that recolor with theme
- `get_it` DI with a single manual composition root (no annotations, no codegen)
- A short `ARCHITECTURE.md`, a `UI-SYSTEM.md`, and a clean commit history
- Zero analyzer warnings, zero `TODO`s
