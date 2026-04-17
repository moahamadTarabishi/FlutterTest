---
doc: 05-submission-checklist
title: "Submission Checklist — the final gate before emailing the APK"
role: "A hard gate. Every box must be ticked before the submission goes out."
audience: "The person shipping the test submission; a reviewer sanity-checking what was verified."
reads_like: "A checklist — read top-to-bottom, tick every box, do not skip."
pdf_test_criteria:
  - "The Sign-up process is working, and a tenant can be created."
  - "The design matches the Figma file shared."
  - "Works on both iOS and Android."
  - "The .apk package for Android is submitted to irfan.ozdemir@workiom.com."
  - "The GitHub project is publicly shared."
prerequisites:
  - docs/03-ROADMAP.md
  - docs/04-BEST-PRACTICES.md
  - docs/06-UI-SYSTEM.md
leads_to: []
related:
  - docs/01-ARCHITECTURE.md
  - docs/02-API-REFERENCE.md
last_reviewed: 2026-04-17
---

# 05 — Submission Checklist

The final gate before you send the APK. Work through this list top to bottom. Do not skip.

## 0. PDF "Test Criteria" (verbatim)

The PDF's own evaluation list — every bullet must be a yes before you email the submission:

- [ ] The sign-up process is working, and a tenant can be created using it.
- [ ] The design matches the Figma file shared.
- [ ] Works on both iOS and Android.
- [ ] The `.apk` package for Android is submitted to `irfan.ozdemir@workiom.com`.
- [ ] The GitHub project is publicly shared (link in the email body).

The rest of this checklist is a harder bar than the PDF's five bullets — it exists so you don't ship a submission that technically meets the criteria but feels sloppy.

## 1. Functional verification

Manually run the full sign-up flow on a real device. The checks below are ordered to match the PDF's six phases (Initial Step → Getting Editions → Asking for information → Register → Authenticate → Login Information):

- [ ] **Initial Step.** Cold-start the app on a fresh install (uninstall first if you tested before). Splash runs `GetCurrentLoginInformations` and lands on welcome because `user == null`. No blank flash.
- [ ] **Getting Editions.** Confirm in Dio logs that `GetEditionsForSelect` is called and the first registrable edition is cached in BLoC state. No plan-picker UI is required by the PDF; if you did render one, verify "Next" carries the chosen `editionId`.
- [ ] **Email + password step.** Navigate to it. Enter an invalid email → see inline error. Enter a weak password → watch the rule checklist update live from the `GetPasswordComplexitySetting` response. Enter a valid password → checklist all green, Next enables.
- [ ] **Tenant name step.** Type a name that starts with a digit or contains a space → see inline regex error (must start with a letter; letters, digits, dashes only). Type a name that's obviously taken (try `admin` or `test`) → see "not available" state driven by `IsTenantAvailable` returning a non-null `tenantId`. Type a fresh name → see "available" check (null `tenantId`).
- [ ] **First / last name step.** Type a name with numbers → see "letters only" error (PDF's wording). Type clean names → Submit enables.
- [ ] **Register + authenticate.** Submit → watch loading state, no ability to double-tap (`droppable` transformer). Confirm the network tab shows `RegisterTenant?timeZone=Europe/Istanbul` with `captchaResponse: null`, then `Authenticate` with `ianaTimeZone`, then the authenticated `GetCurrentLoginInformations`.
- [ ] **Success screen.** Arrive at success screen with the real tenant name (from the final `GetCurrentLoginInformations`) visible.
- [ ] **Persistence.** Kill the app and reopen → land directly on the authenticated state (token persisted via `flutter_secure_storage`).
- [ ] Log out (if you implemented) and confirm you can sign up a second tenant without residual state.

## 2. Cross-platform verification

- [ ] Runs on an Android device (release APK, not debug).
- [ ] Runs on an iOS simulator or device.
- [ ] Both orientations don't break layout (even if you lock to portrait — confirm the lock works).
- [ ] Keyboard behaves correctly on both platforms (no overlap, obscured fields).
- [ ] System back button on Android navigates within the flow, not out of the app mid-form.
- [ ] iOS swipe-back either works or is disabled deliberately.

## 3. Design match

Open the Figma prototype and your app side-by-side for each screen:

- [ ] Colors match in **light mode** (check with a color picker — don't eyeball brand colors).
- [ ] Colors match in **dark mode** (or look deliberately designed, not auto-inverted).
- [ ] Typography matches (font family, weights, sizes, line heights).
- [ ] Spacing matches (padding, margins, element gaps). Use `EdgeInsetsDirectional` so RTL mirrors.
- [ ] Button heights, border radii, icon sizes match.
- [ ] All icons render from **SVGs exported from Figma**. No `Icon(Icons.X)` placeholders left behind.
- [ ] SVG icons recolor via the current theme (try flipping theme — icons should change tint).
- [ ] Loading states and error states visually match or are clearly designed.
- [ ] Transitions between screens match the prototype flow.

## 3a. Theme verification

- [ ] App respects `ThemeMode.system` on first launch.
- [ ] Flipping OS theme live (Settings → Display) updates the app without relaunch.
- [ ] No `Color(0xFF...)` or `Colors.X` hardcoded in any widget — all colors via `Theme.of(context).colorScheme`.
- [ ] Status bar icons contrast with the theme background (dark icons on light, light on dark).
- [ ] Native splash has both light and dark variants configured.

## 3b. Localization verification

- [ ] Every user-facing string routes through `AppLocalizations.of(context)`. Search the codebase for quoted strings in widgets — should find none.
- [ ] Language switching (e.g., iOS Settings → Language) updates every screen.
- [ ] **Arabic locale** renders end-to-end with correct RTL layout — text right-aligned, icons mirrored where semantic (arrows), padding flipped.
- [ ] No clipped or overflowing strings in Arabic (often longer than English).
- [ ] Error messages from `AuthFailure` are localized, not English-only.
- [ ] Placeholders in ARB strings (`{name}`) render correctly with runtime values.

## 4. Code quality

Run these commands; every one must be clean:

```bash
flutter analyze                              # zero issues
flutter test                                 # all tests pass
dart format --set-exit-if-changed lib test   # formatting clean
dart run build_runner build --delete-conflicting-outputs   # no codegen drift
```

Manual review:

- [ ] No `print()` statements.
- [ ] No `TODO` or `FIXME` comments.
- [ ] No commented-out code blocks.
- [ ] No unused imports, variables, or files.
- [ ] No hardcoded user-facing strings (everything via `AppLocalizations`).
- [ ] No hardcoded hex colors outside of `AppColors` / `ColorScheme`.
- [ ] No empty `catch` blocks.
- [ ] No `Cubit` imports — BLoC pattern only.
- [ ] No `application/` folder anywhere — the project uses three layers (`domain`, `infrastructure`, `presentation`), not four.
- [ ] No DTOs imported from `domain/` or `presentation/` — infrastructure layer stays contained.
- [ ] No Flutter imports in `domain/` (Dart-only — no `flutter_bloc`, no widgets, no Dio).
- [ ] `features/auth/presentation/` is split into `splash/`, `welcome/`, `login/`, `signup/`, `personal_info/`, and `widgets/` — one folder per screen concept, flow-prefixed file names.
- [ ] Each flow folder that owns a BLoC has a `bloc/` subfolder (`presentation/signup/bloc/{signup_bloc,signup_event,signup_state}.dart`).
- [ ] `features/auth/domain/usecases/` contains one file per action: `get_current_session.dart`, `get_editions.dart`, `get_password_policy.dart`, `check_tenant_available.dart`, `register_tenant.dart`, `authenticate.dart`, and the orchestrator `register_and_authenticate.dart`.
- [ ] `SignUpBloc` (and any other BLoC) depends on use cases only. No `AuthRepository` imported into any file under `presentation/`.
- [ ] Shared widgets reused across sub-flows live in `features/auth/presentation/widgets/`, not duplicated inside each flow folder.

## 5. Repository hygiene

- [ ] `.gitignore` excludes `build/`, `.dart_tool/`, `.idea/`, `.vscode/`, `ios/Pods`, `*.lock` for local-only.
- [ ] `pubspec.lock` is committed (reviewer gets reproducible deps).
- [ ] Commit history is clean and readable. Squash or rebase noise commits.
- [ ] Final commit message summarizes the submission, e.g., `chore: release v1.0 for Workiom technical test`.
- [ ] Tag the release: `git tag v1.0 && git push --tags`.
- [ ] GitHub repository is **public**. Double-check this in settings.
- [ ] Repository description is filled in ("Flutter technical test — Workiom tenant sign-up flow").
- [ ] README renders correctly on GitHub (check images, links, markdown).

## 6. README review

Open the GitHub-rendered `README.md`:

- [ ] Project name and purpose clear in the first sentence.
- [ ] Quick-start commands work verbatim on a fresh clone.
- [ ] Screenshots or a GIF of the flow (strongly recommended).
- [ ] Tech stack table present with rationale or a link to `docs/`.
- [ ] Link to the APK file or release tag.
- [ ] Your name and contact info at the bottom.

## 7. APK build

```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter build apk --release
```

Verify:

- [ ] APK size is reasonable (< 30 MB for a sign-up app).
- [ ] APK installs on a clean Android device.
- [ ] APK runs without crashes.
- [ ] APK name renamed or placed in a predictable location:
  `mv build/app/outputs/flutter-apk/app-release.apk ./workiom_signup_v1.0.apk`

## 8. Email submission

Send to `irfan.ozdemir@workiom.com`:

- [ ] Subject line is clear, e.g., `Flutter Technical Test Submission — [Your Name]`.
- [ ] Body briefly thanks them for the opportunity, explains what's attached, and lists the repo URL.
- [ ] APK attached directly (not via a link that could expire).
- [ ] GitHub repo URL in the body, clearly labelled.
- [ ] A 60-second Loom or screen capture link (optional but excellent).

## 9. Email template

```
Subject: Flutter Technical Test Submission — [Your Name]

Hi Irfan,

Thank you for the opportunity to complete the Flutter technical test.
Please find my submission below:

• GitHub repository: https://github.com/<your-username>/workiom_signup
• Release APK: attached to this email (workiom_signup_v1.0.apk)
• Demo video: <optional Loom link>

Summary of the implementation:
The app covers the full sign-up flow described in the brief — session
check, edition selection, dynamic password validation based on the
server-provided policy, debounced tenant-name availability check,
tenant registration, authentication, and authenticated session retrieval.
Architecture, tech-stack rationale, and an API reference are in the
`docs/` directory of the repo.

Happy to walk through the implementation or answer any questions.

Best regards,
[Your Name]
[Your phone / LinkedIn / Portfolio]
```

## 10. After you press send

- [ ] Keep the repo public until you hear back.
- [ ] Don't push more commits after submission unless requested — the reviewer is testing what you sent.
- [ ] Note the submission timestamp for your records.
- [ ] Prepare talking points for a follow-up interview: the three hardest decisions you made, what you would do differently with more time, and what you deliberately cut to ship.

## Related docs

- [`01-ARCHITECTURE.md`](01-ARCHITECTURE.md) — what to point to during the code walkthrough
- [`03-ROADMAP.md`](03-ROADMAP.md) — what you actually shipped vs. planned
