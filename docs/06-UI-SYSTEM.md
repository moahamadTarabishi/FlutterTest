---
doc: 06-ui-system
title: "UI System — theming (light + dark), localization (EN + AR / RTL), SVG icon pipeline"
role: "Everything that lives in core/ and shapes how the app looks and speaks."
audience: "Engineers building screens, exporting icons from Figma, or editing ARB strings."
reads_like: "A design-system reference — three major sections (theme, l10n, SVG) you can read independently."
prerequisites:
  - docs/01-ARCHITECTURE.md
leads_to:
  - docs/05-SUBMISSION-CHECKLIST.md
related:
  - docs/03-ROADMAP.md
  - docs/04-BEST-PRACTICES.md
last_reviewed: 2026-04-17
---

# 06 — UI System

Theming, localization, and the SVG icon pipeline. This doc covers everything that lives in `core/` and defines how the app looks and speaks.

## 1. Theming — light + dark

The app supports both light and dark mode via Flutter's native `ThemeMode` system. The OS setting drives the choice by default; a manual override can be exposed later.

### 1.1 Color tokens

Design tokens from Figma are captured in `core/theme/app_colors.dart` as **paired** values — every semantic role has a light and dark variant.

```dart
// core/theme/app_colors.dart
class AppColors {
  AppColors._();

  // Brand
  static const brandPrimary = Color(0xFF5B21B6);     // Workiom purple
  static const brandAccent = Color(0xFFFACC15);

  // Light
  static const lightBackground = Color(0xFFFFFFFF);
  static const lightSurface = Color(0xFFF8F9FB);
  static const lightTextPrimary = Color(0xFF1A1A2E);
  static const lightTextSecondary = Color(0xFF6B7280);
  static const lightBorder = Color(0xFFE5E7EB);

  // Dark
  static const darkBackground = Color(0xFF0F0F1A);
  static const darkSurface = Color(0xFF1A1A2E);
  static const darkTextPrimary = Color(0xFFF5F5F7);
  static const darkTextSecondary = Color(0xFF9CA3AF);
  static const darkBorder = Color(0xFF2A2A3E);

  // Semantic (same in both themes unless design says otherwise)
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
}
```

### 1.2 Typography

```dart
// core/theme/app_typography.dart
class AppTypography {
  AppTypography._();

  static const _family = 'Inter';   // or whatever Figma specifies

  static TextTheme textTheme(Color onSurface, Color onSurfaceMuted) => TextTheme(
    displayLarge: TextStyle(fontFamily: _family, fontSize: 32, fontWeight: FontWeight.w700, color: onSurface),
    titleLarge:   TextStyle(fontFamily: _family, fontSize: 22, fontWeight: FontWeight.w600, color: onSurface),
    bodyLarge:    TextStyle(fontFamily: _family, fontSize: 16, fontWeight: FontWeight.w400, color: onSurface),
    bodyMedium:   TextStyle(fontFamily: _family, fontSize: 14, fontWeight: FontWeight.w400, color: onSurfaceMuted),
    labelLarge:   TextStyle(fontFamily: _family, fontSize: 14, fontWeight: FontWeight.w600, color: onSurface),
  );
}
```

Register the font in `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-Medium.ttf
          weight: 500
        - asset: assets/fonts/Inter-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Inter-Bold.ttf
          weight: 700
```

### 1.3 ThemeData composition

```dart
// core/theme/app_theme.dart
class AppTheme {
  AppTheme._();

  static ThemeData light() => _base(
    colorScheme: const ColorScheme.light(
      primary: AppColors.brandPrimary,
      onPrimary: Colors.white,
      secondary: AppColors.brandAccent,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightTextPrimary,
      onSurfaceVariant: AppColors.lightTextSecondary,
      outline: AppColors.lightBorder,
      surfaceContainerHighest: AppColors.lightBorder,
      error: AppColors.error,
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
  );

  static ThemeData dark() => _base(
    colorScheme: const ColorScheme.dark(
      primary: AppColors.brandPrimary,
      onPrimary: Colors.white,
      secondary: AppColors.brandAccent,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
      onSurfaceVariant: AppColors.darkTextSecondary,
      outline: AppColors.darkBorder,
      surfaceContainerHighest: AppColors.darkBorder,
      error: AppColors.error,
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
  );

  static ThemeData _base({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      textTheme: AppTypography.textTheme(
        colorScheme.onSurface,
        colorScheme.onSurfaceVariant,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: const TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
```

A few M3 notes:

- `surfaceVariant` was deprecated in Flutter 3.18 (May 2024) — use `surfaceContainerHighest` for the container role and `onSurfaceVariant` for muted text. Sticking with the old name ships a deprecation warning in `flutter analyze`.
- `brightness` is derived automatically from `ColorScheme.light()` / `.dark()`, so it doesn't need to be passed through `_base`.
- Read muted text via `colorScheme.onSurfaceVariant`, read borders via `colorScheme.outline` — one source of truth per role.

### 1.4 Wiring into MaterialApp

```dart
// app.dart
MaterialApp.router(
  theme: AppTheme.light(),
  darkTheme: AppTheme.dark(),
  themeMode: ThemeMode.system,   // OS drives the choice
  routerConfig: getIt<AppRouter>().config,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
);
```

### 1.5 Using the theme in widgets

Always read from `Theme.of(context)`, never import `AppColors` directly into widgets.

```dart
final colors = Theme.of(context).colorScheme;
final textStyles = Theme.of(context).textTheme;

Container(
  decoration: BoxDecoration(
    color: colors.surface,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Text('Hello', style: textStyles.titleLarge),
)
```

---

## 2. Localization

The app supports multiple languages via Flutter's generated `AppLocalizations`, driven by ARB files.

### 2.1 Supported locales

- `en` — English (default)
- `ar` — Arabic (for RTL coverage)

Adding a third locale is a matter of adding one ARB file and restarting `flutter gen-l10n`.

### 2.2 Setup

Add to `pubspec.yaml`:

```yaml
flutter:
  generate: true
```

Create `l10n.yaml` at the project root:

```yaml
arb-dir: lib/core/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
output-class: AppLocalizations
nullable-getter: false
```

### 2.3 ARB files

```json
// lib/core/l10n/app_en.arb
{
  "@@locale": "en",

  "appName": "Workiom",

  "welcomeTitle": "Create your Workiom workspace",
  "welcomeSubtitle": "Sign up to get started with your team.",

  "emailLabel": "Email address",
  "emailHint": "you@company.com",
  "emailErrorInvalid": "Please enter a valid email address",

  "passwordLabel": "Password",
  "passwordRuleMinLength": "At least {count} characters",
  "@passwordRuleMinLength": {
    "placeholders": { "count": { "type": "int" } }
  },
  "passwordRuleUppercase": "Uppercase letter",
  "passwordRuleLowercase": "Lowercase letter",
  "passwordRuleDigit": "Digit",
  "passwordRuleSpecial": "Special character",

  "tenantNameLabel": "Workspace name",
  "tenantNameHint": "acme-co",
  "tenantNameErrorInvalid": "Must start with a letter and contain only letters, numbers, or dashes",
  "tenantNameChecking": "Checking availability…",
  "tenantNameAvailable": "Available",
  "tenantNameTaken": "This workspace name is taken",

  "firstNameLabel": "First name",
  "lastNameLabel": "Last name",
  "personNameErrorInvalid": "Letters only",

  "submitCta": "Create workspace",
  "nextCta": "Next",
  "backCta": "Back",

  "successTitle": "You're in!",
  "successSubtitle": "Welcome, {name}. Your workspace is ready.",
  "@successSubtitle": {
    "placeholders": { "name": { "type": "String" } }
  },

  "errorNetwork": "No internet connection. Please try again.",
  "errorTimeout": "The request took too long. Please try again.",
  "errorServer": "Something went wrong on our side.",
  "errorTenantTaken": "This workspace name is already taken.",
  "errorInvalidCredentials": "Email or password is incorrect.",
  "errorUnknown": "Something went wrong. Please try again."
}
```

```json
// lib/core/l10n/app_ar.arb
{
  "@@locale": "ar",
  "appName": "ووركيوم",
  "welcomeTitle": "أنشئ مساحة عمل ووركيوم الخاصة بك",
  "welcomeSubtitle": "سجّل للبدء مع فريقك.",
  "emailLabel": "البريد الإلكتروني",
  ...
}
```

### 2.4 Generating code

```bash
flutter gen-l10n
# or just
flutter pub get
```

This produces `AppLocalizations` in `.dart_tool/flutter_gen/gen_l10n/` — import it where needed.

### 2.5 Wiring into MaterialApp

```dart
MaterialApp.router(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  // locale: const Locale('ar'),    // hardcode during QA; otherwise omit
  ...
);
```

### 2.6 Using strings in widgets

```dart
final l10n = AppLocalizations.of(context)!;

Text(l10n.welcomeTitle)
Text(l10n.successSubtitle('Jane'))
Text(l10n.passwordRuleMinLength(policy.requiredLength))
```

### 2.7 RTL correctness

When Arabic is the active locale, Flutter sets `Directionality.ltr` → `Directionality.rtl` automatically. Your job is to use directional APIs throughout:

| Wrong | Right |
| --- | --- |
| `EdgeInsets.only(left: 16)` | `EdgeInsetsDirectional.only(start: 16)` |
| `Alignment.centerLeft` | `AlignmentDirectional.centerStart` |
| `Row(children: [icon, text])` with `MainAxisAlignment.start` | same — `Row` already flips |
| `Positioned(left: 0, top: 0)` | `PositionedDirectional(start: 0, top: 0)` |
| `Icons.arrow_back` | `Icons.arrow_back` wrapped in `Transform.flip(flipX: Directionality.of(context) == TextDirection.rtl)` — or a directional SVG variant |

Test in Arabic locale before you ship. Most RTL bugs are found by just *looking* at the screens.

### 2.8 Mapping failures to localized strings

Extension method keeps widget code clean:

```dart
extension AuthFailureL10n on AuthFailure {
  String toLocalizedMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      _Network()            => l10n.errorNetwork,
      _Timeout()            => l10n.errorTimeout,
      _Server()             => l10n.errorServer,
      _Validation()         => l10n.errorServer,
      _TenantTaken()        => l10n.errorTenantTaken,
      _InvalidCredentials() => l10n.errorInvalidCredentials,
      _Unknown()            => l10n.errorUnknown,
    };
  }
}
```

---

## 3. SVG icon pipeline

Icons from Figma ship as SVG, not as raster images. SVGs scale crisply on all densities and can be recolored via Flutter — crucial for theme switching.

### 3.1 Exporting from Figma

For each icon in the design:

1. Select the icon frame in Figma.
2. In the right panel, under **Export**, choose format `SVG`.
3. Tick **Outline stroke** if the icon uses strokes (converts to paths — avoids thickness drift).
4. Export.
5. Save under `assets/icons/` with a `snake_case` filename: `icon_email.svg`, `icon_eye_open.svg`, `icon_check.svg`.

### 3.2 Optimizing SVGs

Figma exports sometimes include clutter. Run each SVG through `svgo` once:

```bash
npm install -g svgo
svgo assets/icons/*.svg --multipass
```

This strips metadata, collapses paths, and shrinks file size without visual change.

### 3.3 Declaring assets

```yaml
# pubspec.yaml
flutter:
  assets:
    - assets/icons/
```

Listing the directory (not each file) means new icons auto-register after `flutter pub get`.

### 3.4 Rendering with flutter_svg

```dart
SvgPicture.asset(
  'assets/icons/icon_email.svg',
  width: 20,
  height: 20,
)
```

### 3.5 Theme-aware icon coloring

The trick: export SVGs with `fill="currentColor"` or `fill="#000"` then recolor at runtime with a `ColorFilter`.

```dart
// core/widgets/app_icon.dart
class AppIcon extends StatelessWidget {
  /// Decorative icon — screen readers ignore it. Use for icons that
  /// accompany a label (e.g., an email icon next to the word "Email").
  const AppIcon(
    this.asset, {
    this.size = 24,
    this.color,
    super.key,
  })  : semanticsLabel = null,
        _excludeFromSemantics = true;

  /// Meaningful icon — pass a localized label. Use for icon-only buttons
  /// or icons that convey information not present in surrounding text.
  const AppIcon.labeled(
    this.asset, {
    required String this.semanticsLabel,
    this.size = 24,
    this.color,
    super.key,
  }) : _excludeFromSemantics = false;

  final String asset;
  final double size;
  final Color? color;
  final String? semanticsLabel;
  final bool _excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final tint = color ?? Theme.of(context).colorScheme.onSurface;
    return SvgPicture.asset(
      asset,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
      excludeFromSemantics: _excludeFromSemantics,
      semanticsLabel: semanticsLabel,
    );
  }
}
```

Accessibility note: passing `semanticsLabel: ''` (empty string) is **not** the same as omitting it — an empty label still announces to screen readers. For purely decorative icons use `excludeFromSemantics: true`, which is why `AppIcon`'s default constructor hides the icon from the accessibility tree. Reach for `AppIcon.labeled(...)` whenever the icon carries information not already present in nearby text (e.g., an icon-only close button).

Usage:

```dart
AppIcon('assets/icons/icon_email.svg')                           // decorative — beside a "Email" label
AppIcon('assets/icons/icon_check.svg', color: AppColors.success) // decorative — beside "Available"
AppIcon.labeled('assets/icons/icon_close.svg', semanticsLabel: l10n.close) // meaningful — icon-only button
```

When the theme flips light ↔ dark, every icon that uses `AppIcon` recolors automatically because `Theme.of(context).colorScheme.onSurface` differs between themes.

### 3.6 Asset naming convention

| Kind | Prefix | Example |
| --- | --- | --- |
| Functional icon | `icon_` | `icon_email.svg`, `icon_arrow_back.svg` |
| Brand / illustration | `illu_` | `illu_welcome.svg` |
| Logo | `logo_` | `logo_workiom.svg`, `logo_workiom_mono.svg` |

### 3.7 Common pitfalls

- **SVG ships with hardcoded colors → can't theme.** Open the SVG, replace fills with `currentColor` or a single recoloring fill.
- **Strokes look different at different sizes.** Use "Outline stroke" at export time.
- **Directional icons (arrows) don't flip in RTL.** Either export two variants (`icon_arrow_start.svg` / `icon_arrow_end.svg`) or wrap in `Transform` that flips based on `Directionality`.
- **SVG rendering is slow on old Android devices.** For frequently-rendered icons, precache with `precachePicture` in `initState`.

---

## 4. Putting it together in `app.dart`

```dart
class WorkiomApp extends StatelessWidget {
  const WorkiomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Workiom',
      debugShowCheckedModeBanner: false,

      // Theme
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,

      // Localization
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Routing
      routerConfig: getIt<AppRouter>().config,
    );
  }
}
```

## 5. Verification matrix

Before calling the UI system done, verify every row:

Each row maps to a file under `features/auth/presentation/`:

| Scenario | File | Light / EN | Light / AR | Dark / EN | Dark / AR |
| --- | --- | --- | --- | --- | --- |
| Splash | `splash/splash_page.dart` | ☐ | ☐ | ☐ | ☐ |
| Welcome | `welcome/welcome_page.dart` | ☐ | ☐ | ☐ | ☐ |
| Login (stub) | `login/login_page.dart` | ☐ | ☐ | ☐ | ☐ |
| Sign-up: Email + Password | `signup/signup_email_password_page.dart` | ☐ | ☐ | ☐ | ☐ |
| Sign-up: Tenant Name | `signup/signup_tenant_name_page.dart` | ☐ | ☐ | ☐ | ☐ |
| Personal Info | `personal_info/personal_info_page.dart` | ☐ | ☐ | ☐ | ☐ |
| Sign-up: Success | `signup/signup_success_page.dart` | ☐ | ☐ | ☐ | ☐ |
| Error snackbar (shared widget) | `presentation/widgets/` | ☐ | ☐ | ☐ | ☐ |

All 32 cells should be green before submission. The login page exists as a scaffolded stub — out of scope for the test's user journey, but it must render correctly in every theme/locale combination so no regression sneaks in when it's fleshed out later.
