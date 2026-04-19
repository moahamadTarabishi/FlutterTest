import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/router/app_routes.dart';
import 'package:workiom_signup/core/widgets/app_footer.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';
import 'package:workiom_signup/core/widgets/app_language_switcher.dart';
import 'package:workiom_signup/core/widgets/app_theme_switcher.dart';
import 'package:workiom_signup/core/widgets/google_sign_in_button.dart';
import 'package:workiom_signup/core/widgets/or_divider.dart';
import 'package:workiom_signup/core/widgets/primary_button.dart';
import 'package:workiom_signup/core/widgets/terms_privacy_footer.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 140,
        leading: TextButton.icon(
          onPressed: () => context.go(AppRoutes.login),
          icon: AppIcon(
            Assets.icons.icChevronLeft,
            size: 18,
            color: cs.primary,
            matchTextDirection: true,
          ),
          label: Text(
            l10n.signIn,
            style: tt.labelLarge?.copyWith(color: cs.primary),
          ),
        ),
        actions: const [
          AppThemeSwitcher(),
          SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(l10n.createFreeAccount, style: tt.headlineMedium),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(l10n.letsStartJourney, style: tt.titleLarge),
                  const SizedBox(width: 6),
                  SvgPicture.asset(
                    Assets.icons.icWavingHand,
                    width: 22,
                    height: 22,
                  ),
                ],
              ),
              const SizedBox(height: 137),
              const GoogleSignInButton(),
              const SizedBox(height: 30),
              const OrDivider(),
              const SizedBox(height: 30),
              PrimaryButton(
                label: l10n.continueWithEmail,
                onPressed: () => context.push(AppRoutes.signupEmailPassword),
              ),
              const SizedBox(height: 16),
              const Center(child: TermsPrivacyFooter()),
              const Spacer(),
              const Center(child: AppLanguageSwitcher()),
              const SizedBox(height: 16),
              const Center(child: AppFooter()),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
