---
doc: 03-roadmap
title: "Roadmap — Day-by-day build plan from scaffold to submission"
role: "Sequenced work plan. Turns the architecture and API reference into a reproducible build order."
audience: "Whoever is actually building the submission; a reviewer curious about what was planned vs shipped."
reads_like: "A playbook — work through Day 0 → Day 6 in order; each day ends in a commit and a deliverable."
pdf_sections_covered:
  - "All six — each screen and each API call lands on a specific day."
prerequisites:
  - README.md
  - docs/01-ARCHITECTURE.md
  - docs/02-API-REFERENCE.md
leads_to:
  - docs/04-BEST-PRACTICES.md
  - docs/05-SUBMISSION-CHECKLIST.md
  - docs/06-UI-SYSTEM.md
last_reviewed: 2026-04-17
---

# 03 — Roadmap

A day-by-day implementation plan. Each day produces something shippable or verifiable. If you only have 3 days instead of 6, merge Day 1+2 and Day 4+5 — never skip Day 0.

## Day 0 — Reconnaissance (2–3 hours, no code)

Before writing a single line, do the cheap work that saves days later. The test PDF and the Figma prototype are the two authoritative sources — read them together.

- [ ] Read the test PDF end to end. Note the six named sections it describes: **Initial Step**, **Getting Editions**, **Asking for information**, **Register a tenant with user**, **Login the user In**, **Login Information**. Every doc in this repo maps back to those names.
- [ ] Install the live Workiom app from the Play Store / App Store. Sign up. Observe every screen, error, keyboard transition. The PDF literally says *"Feel free to cheat by signing-up to the current workiom app"* — take it.
- [ ] Open the Figma design file (`https://www.figma.com/file/KVVFSCqrG1Auh3OLSSuhh0/`) and the Prototype (`https://www.figma.com/proto/KVVFSCqrG1Auh3OLSSuhh0/Flutter-Test?...&starting-point-node-id=1281%3A541`). The prototype's starting point is node **1281:541** — walk from there in order. Note transitions between every frame.
- [ ] Reconcile what the PDF spells out vs what the Figma adds. The PDF only describes three data-collection screens (email+password → tenant name → first/last name) plus a success state. Any other frame in Figma (splash, welcome, onboarding, etc.) is a design-only addition with no API impact.
- [ ] Extract design tokens from Figma for **both light and dark variants**: brand colors (paired), text styles, spacing scale, border radii, button heights.
- [ ] **Export every icon from Figma as SVG.** Select icon → Export panel → format `SVG` → include "Outline stroke" if needed. Save to `assets/icons/` with snake_case filenames (`icon_email.svg`, `icon_eye.svg`, etc.).
- [ ] Note which strings are user-facing (for ARB extraction) vs fixed (brand name, API values).
- [ ] Hit every API endpoint with `curl` or Postman. Confirm response shapes match the test PDF.
  - `GET /api/services/app/Session/GetCurrentLoginInformations`
  - `GET /api/services/app/TenantRegistration/GetEditionsForSelect`
  - `GET /api/services/app/Profile/GetPasswordComplexitySetting`
  - `POST /api/services/app/Account/IsTenantAvailable` with `{"tenancyName":"test-name"}`
- [ ] Create a GitHub repo (empty, public). Clone it locally.

**Deliverable:** a `NOTES.md` with Figma screenshots (light + dark), exported SVGs in `assets/icons/`, and raw API responses.

## Day 1 — Foundation

Scaffold the project and everything infrastructural.

- [ ] `flutter create workiom_signup --org com.yourname --platforms=ios,android`
- [ ] Add `very_good_analysis` to `analysis_options.yaml`. Fix every lint on the generated code.
- [ ] Set up `.gitignore` and commit the skeleton.
- [ ] Add dependencies to `pubspec.yaml` (see [`04-BEST-PRACTICES.md`](04-BEST-PRACTICES.md) for the full list).
- [ ] Create the Clean Architecture folder structure described in [`01-ARCHITECTURE.md`](01-ARCHITECTURE.md) with the `core/` + `features/auth/{domain,infrastructure,presentation}/` split — three layers, no separate `application/` — even with empty files so git tracks the layout.
- [ ] **Theme:** Build `core/theme/` with both `AppTheme.light()` and `AppTheme.dark()`. Set `MaterialApp.themeMode = ThemeMode.system`.
- [ ] **Localization:** Scaffold `core/l10n/` with `app_en.arb` and `app_ar.arb` (a few placeholder keys). Configure `flutter gen-l10n` via `l10n.yaml`. Wire `localizationsDelegates` and `supportedLocales` in `MaterialApp`. See [`06-UI-SYSTEM.md`](06-UI-SYSTEM.md).
- [ ] **SVG pipeline:** Declare `assets/icons/` in `pubspec.yaml`. Drop in the exports from Day 0. Build a thin `AppIcon` widget that wraps `SvgPicture.asset` with theme-aware coloring.
- [ ] Build `core/network/`: Dio client, logging + auth + error interceptors, ABP envelope model.
- [ ] Build `core/storage/`: secure storage wrapper.
- [ ] Wire `get_it` in `core/di/injection.dart` as a **single manual composition root**. No `injectable`, no codegen for DI. Register Dio, SecureStorage, interceptors, and placeholders for feature classes you'll add Day 2.
- [ ] Bootstrap with `await configureDependencies()` in `main.dart` before `runApp`.

**Commit:** `chore: Clean Architecture scaffold with theme, l10n, SVG pipeline, network, and DI`

**Deliverable:** app launches, shows a blank scaffold themed with brand colors. Flip system theme → app follows. Flip device language to Arabic → layout mirrors (RTL) even with placeholder copy.

## Day 2 — Domain + Infrastructure layers

Build the entire backend integration and business rules. No UI yet. No separate `application/` — use cases live in `domain/usecases/`, BLoCs come tomorrow in `presentation/`.

- [ ] **Core domain:** `ValueObject<T>` base class in `core/domain/value_object.dart`; sealed generic `Failure` (NetworkFailure, TimeoutFailure, ServerFailure, UnauthorizedFailure, UnknownFailure) in `core/error/failures.dart`.
- [ ] **Core common:** `DataState<T>` sealed union (idle/loading/success/failure) in `core/common/data_state.dart`.
- [ ] **Domain (feature):** Create value objects (`EmailAddress`, `Password`, `TenantName`, `PersonName`) with `ValueFailure` types under `features/auth/domain/value_objects/`. Per the PDF: `EmailAddress` is "any valid email address"; `Password` obeys the policy returned by `GetPasswordComplexitySetting`; `TenantName` must "start with a letter and can contain numbers and dashes"; `PersonName` is "Letters only" (no digits, no punctuation — spaces are a UX courtesy only and must not be sent to the server if they appear).
- [ ] **Domain (feature):** Create entities (`Edition`, `PasswordPolicy`, `UserSession`, `RegisteredTenant`) under `features/auth/domain/entities/`.
- [ ] **Domain (feature):** Sealed `AuthFailure` in `features/auth/domain/failures/auth_failure.dart` — feature-specific semantic failures (tenant taken, invalid credentials, validation), with a `.generic(Failure)` wrapper for transport-level failures from `core/error`.
- [ ] **Domain (feature):** Abstract `AuthRepository` in `features/auth/domain/repositories/`.
- [ ] **Domain (feature):** Seven use cases under `features/auth/domain/usecases/`, one file per action the BLoC or splash controller can trigger:
  - `get_current_session.dart` — PDF: Initial Step + Login Information
  - `get_editions.dart` — PDF: Getting Editions
  - `get_password_policy.dart` — PDF: Asking for information (password)
  - `check_tenant_available.dart` — PDF: Asking for information (tenant name)
  - `register_tenant.dart` — PDF: Register a tenant with user
  - `authenticate.dart` — PDF: Login the user In
  - `register_and_authenticate.dart` — orchestrator composing `RegisterTenant` → `Authenticate` → `GetCurrentSession`
- [ ] **Infrastructure:** Freezed DTOs for every endpoint under `features/auth/infrastructure/dtos/`.
- [ ] **Infrastructure:** `AuthRemoteDatasource` with one method per endpoint, returning DTOs.
- [ ] **Infrastructure:** `AuthRepositoryImpl` mapping DTOs → domain entities, `DioException` → `AuthFailure`.
- [ ] Run `build_runner` after each DTO added (for `freezed` + `json_serializable` only — DI stays manual).
- [ ] Register `AuthRemoteDatasource`, `AuthRepositoryImpl` (as `AuthRepository`), and all seven use cases in `core/di/injection.dart` as you create them. The `SignUpBloc` factory gets registered tomorrow.
- [ ] Write a throwaway `main()` that invokes each use case (`await getEditions();`, `await registerAndAuthenticate(...)`, ...) and prints the result. Run it. Fix bugs.

**Commit:** `feat: domain + infrastructure — value objects, DTOs, repository, seven use cases`

**Deliverable:** you can sign up a test tenant end-to-end from a CLI-style driver, without any UI.

## Day 3 — Presentation shell and navigation

Build every screen as a static mock matching Figma, wired with `go_router`. No state logic yet, but full theme + l10n integration. File paths below follow the presentation split in [`01-ARCHITECTURE.md`](01-ARCHITECTURE.md) — one folder per screen concept, files carry their flow prefix.

The three data-collection screens (email+password, tenant name, personal info) and the final success screen map **one-to-one** to the PDF's "Asking for information" subsections. The splash, welcome, and login pages are Figma-driven — they are not in the PDF's flow description, but the prototype walks through them so they need to look right even though they carry no backend logic for this test.

- [ ] `presentation/splash/splash_page.dart` — session-check page (Initial Step: calls `GetCurrentLoginInformations` and branches on `user == null`).
- [ ] `presentation/welcome/welcome_page.dart` — welcome / entry page (Figma, not in the PDF's flow description; starting point of the prototype at node `1281:541`).
- [ ] `presentation/login/login_page.dart` — sign-in page (Figma, out-of-scope for the test — stub that renders in every theme/locale).
- [ ] `presentation/signup/signup_email_password_page.dart` — PDF step 1 of "Asking for information": email + password with live rules from `GetPasswordComplexitySetting`.
- [ ] `presentation/signup/signup_tenant_name_page.dart` — PDF step 2: tenant name with `IsTenantAvailable` (debounced).
- [ ] `presentation/personal_info/personal_info_page.dart` — PDF step 3: first + last name, letters only (PDF: *"It should be Letters only."*).
- [ ] `presentation/signup/signup_success_page.dart` — post-registration landing driven by the final `GetCurrentLoginInformations` response.
- [ ] Flow-scoped widgets live beside their pages. Shared widgets in `features/auth/presentation/widgets/`: `PasswordRulesList`, `TenantAvailabilityIndicator`, `StepProgressIndicator`.
- [ ] Truly app-wide widgets in `core/widgets/`: `PrimaryButton`, `AppTextField`, `AppIcon` (SVG wrapper).
- [ ] Every user-facing string goes through `AppLocalizations.of(context).someKey` — no hardcoded strings. Add keys to both `app_en.arb` and `app_ar.arb` as you build.
- [ ] Every color reads from `Theme.of(context).colorScheme` or a semantic extension — no hardcoded hex.
- [ ] Every icon renders via `AppIcon('assets/icons/...svg')` with a theme-aware `colorFilter`.
- [ ] Every horizontal inset uses `EdgeInsetsDirectional` so RTL works.
- [ ] `go_router` routes connecting all screens in order.
- [ ] Hardcode `onPressed` to just `context.go('/next')` for now.

**Commit:** `feat: all sign-up pages with navigation, theme, l10n, and SVG icons`

**Deliverable:** reviewer can click through the entire flow and see every screen in light mode, dark mode, English, and Arabic. It looks right, it just doesn't do anything real.

## Day 4 — Wiring BLoC + validation

Make the buttons actually work using event-driven BLoC. BLoCs live inside the flow they drive.

- [ ] Create `SignUpBloc`, `SignUpEvent` (sealed class family), `SignUpState` (freezed) under `features/auth/presentation/signup/bloc/` per [`01-ARCHITECTURE.md`](01-ARCHITECTURE.md).
- [ ] Register `SignUpBloc` with `getIt.registerFactory(...)` in `injection.dart`, wired with `getEditions`, `getPasswordPolicy`, `checkTenantAvailable`, and `registerAndAuthenticate` — all use cases, no direct repository dependency. Provide via the `ShellRoute` in `go_router` so one bloc instance spans every `/signup/*` child route.
- [ ] On `SignUpStarted`: invoke the `GetEditions` + `GetPasswordPolicy` use cases in parallel via `Future.wait`.
- [ ] On email/password changes: dispatch `SignUpEmailChanged` / `SignUpPasswordChanged`; BLoC constructs value objects and updates state.
- [ ] Render live password rule checklist from `state.passwordPolicy` + current `Password` value object.
- [ ] On `SignUpTenantNameChanged`: use the custom `_debounce(500ms)` transformer (built on rxdart's `debounceTime` — **not** from `bloc_concurrency`) to invoke the `CheckTenantAvailable` use case. Show three visible states in UI.
- [ ] On first/last name changes: update `PersonName` value objects.
- [ ] On `SignUpSubmitted` (with `transformer: droppable()`): invoke the `RegisterAndAuthenticate` orchestrator use case, which composes `RegisterTenant` → `Authenticate` → `GetCurrentSession` and returns a single `Either<AuthFailure, UserSession>`. Persist the token on success, emit the resulting state.
- [ ] `BlocListener` handles navigation and snackbars — never from inside the bloc.
- [ ] Map every `AuthFailure` to a localized string via an extension that reads `AppLocalizations`.
- [ ] Loading states: disable buttons, show spinners, prevent double-submits via `droppable` transformer.

**Commit:** `feat: SignUpBloc wires sign-up flow end-to-end with event transformers`

**Deliverable:** a reviewer can complete the sign-up against the live API. A real tenant gets created. Error paths surface localized messages.

## Day 5 — Polish

This is the day that decides your grade.

- [ ] Keyboard: `autofillHints`, `textInputAction.next`, dismiss on tap outside.
- [ ] Form fields: show/hide password toggle (SVG eye icon that swaps open/closed), clear button.
- [ ] Transitions: match the Figma prototype's page animations.
- [ ] Accessibility: `Semantics` labels on every interactive widget, min 48px tap targets, AA contrast in both themes.
- [ ] Platform: iOS safe areas, Android back-button handling, status-bar colors per theme.
- [ ] Empty and error states visually designed, not just raw error text.
- [ ] **Theme QA:** walk every screen in light mode, then dark mode. Fix any hardcoded colors found.
- [ ] **Locale QA:** walk every screen in English, then Arabic. Confirm RTL layout flips correctly, no strings clipped, all icons positioned via `EdgeInsetsDirectional`.
- [ ] **SVG QA:** confirm every icon recolors with the theme (not baked-in black) and renders crisply on both platforms.
- [ ] Native splash configured with `flutter_native_splash` — light + dark variants.
- [ ] App icon generated via `flutter_launcher_icons`.
- [ ] Compare every screen side-by-side with Figma. Fix pixel drift.
- [ ] Add unit tests for value objects (fast win, high signal).
- [ ] Add `bloc_test` for the happy-path event sequence.

**Commit:** `polish: animations, a11y, theme QA, l10n QA, SVG QA, platform integration, tests`

**Deliverable:** the app feels production-quality. Light, dark, English, Arabic all ship.

## Day 6 — Ship

- [ ] Write a real `README.md` (or update the generated one). See root `README.md`.
- [ ] Record a 60-second screen capture of the flow (optional but strong signal).
- [ ] `flutter analyze` → zero warnings.
- [ ] `flutter test` → all green.
- [ ] `flutter build apk --release` → verify output.
- [ ] Install the release APK on a real Android device. Sign up. Confirm it works.
- [ ] Install on an iOS device or run on iOS simulator. Confirm sign-up works.
- [ ] Clean git history: rebase trivial fixups, good commit messages.
- [ ] Push to GitHub. Make repo public.
- [ ] Email APK + GitHub link to `irfan.ozdemir@workiom.com`.

See [`05-SUBMISSION-CHECKLIST.md`](05-SUBMISSION-CHECKLIST.md) for the final gate.

## Time-saving shortcuts if you're behind

If you have less time, skip in this order (first = cheapest to cut):

1. Widget/bloc tests (keep validator unit tests)
2. Edition selection screen — auto-pick first registrable edition
3. Animated page transitions
4. Demo video recording
5. iOS testing (still write cross-platform code, just verify only on Android)

Never skip:

- Matching Figma design
- End-to-end tenant creation working
- Running on Android
- Public GitHub repo
- README
