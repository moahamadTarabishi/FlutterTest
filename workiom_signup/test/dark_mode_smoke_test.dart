// Pumps each major widget in a dark-themed MaterialApp to catch rendering
// exceptions (invisible paint, assertion failures, missing extensions, etc.).
// These tests don't verify pixel-perfect output — that requires visual diff.
// They catch the most common regression: a widget crashing on dark surfaces.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/l10n/locale_cubit.dart';
import 'package:workiom_signup/core/storage/secure_storage.dart';
import 'package:workiom_signup/core/theme/app_theme.dart';
import 'package:workiom_signup/core/theme/cubit/theme_cubit.dart';
import 'package:workiom_signup/core/widgets/app_footer.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';
import 'package:workiom_signup/core/widgets/app_language_switcher.dart';
import 'package:workiom_signup/core/widgets/google_sign_in_button.dart';
import 'package:workiom_signup/core/widgets/primary_button.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/presentation/signup/widgets/password_strength_bar.dart';

class _MockSecureStorage extends Mock implements SecureStorage {}

const _testPolicy = PasswordPolicy(
  requiredLength: 8,
  requireUppercase: true,
  requireLowercase: true,
  requireDigit: true,
  requireNonAlphanumeric: false,
);

void main() {
  late _MockSecureStorage mockStorage;

  setUp(() {
    mockStorage = _MockSecureStorage();
    when(() => mockStorage.readThemeMode()).thenAnswer((_) async => 'dark');
  });

  Future<void> pumpDark(WidgetTester tester, Widget child) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit(mockStorage)),
          BlocProvider(create: (_) => LocaleCubit()),
        ],
        child: MaterialApp(
          theme: AppTheme.dark(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: child),
        ),
      ),
    );
    // One frame to resolve async layout; two to flush post-frame callbacks.
    await tester.pump();
    await tester.pump();
  }

  group('Dark-mode smoke — widgets render without throwing', () {
    testWidgets('GoogleSignInButton', (tester) async {
      await pumpDark(tester, const GoogleSignInButton());
      expect(find.byType(GoogleSignInButton), findsOneWidget);
    });

    testWidgets('AppLanguageSwitcher', (tester) async {
      await pumpDark(tester, const AppLanguageSwitcher());
      expect(find.byType(AppLanguageSwitcher), findsOneWidget);
    });

    testWidgets('AppFooter', (tester) async {
      await pumpDark(tester, const AppFooter());
      expect(find.byType(AppFooter), findsOneWidget);
    });

    testWidgets('PrimaryButton enabled', (tester) async {
      await pumpDark(
        tester,
        PrimaryButton(label: 'Next', onPressed: () {}),
      );
      expect(find.byType(PrimaryButton), findsOneWidget);
    });

    testWidgets('PrimaryButton disabled', (tester) async {
      await pumpDark(
        tester,
        const PrimaryButton(label: 'Next', onPressed: null),
      );
      expect(find.byType(PrimaryButton), findsOneWidget);
    });

    testWidgets('PasswordStrengthBar — empty input', (tester) async {
      await pumpDark(
        tester,
        const PasswordStrengthBar(input: '', policy: _testPolicy),
      );
      expect(find.byType(PasswordStrengthBar), findsOneWidget);
    });

    testWidgets('PasswordStrengthBar — strong password', (tester) async {
      await pumpDark(
        tester,
        const PasswordStrengthBar(
          input: 'Test1234!',
          policy: _testPolicy,
        ),
      );
      expect(find.byType(PasswordStrengthBar), findsOneWidget);
    });

    testWidgets('AppIcon with explicit color — theme-reactive', (tester) async {
      await pumpDark(
        tester,
        Builder(
          builder: (context) => AppIcon(
            Assets.icons.icEmail,
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      );
      expect(find.byType(AppIcon), findsOneWidget);
    });

    testWidgets('AppIcon without color — no crash', (tester) async {
      await pumpDark(
        tester,
        AppIcon(Assets.icons.icWorkiom),
      );
      expect(find.byType(AppIcon), findsOneWidget);
    });
  });
}
