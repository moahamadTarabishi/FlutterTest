import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/widgets/primary_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              Text(
                l10n.welcomeTitle,
                style: tt.displaySmall?.copyWith(
                  color: cs.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.welcomeSubtitle,
                style: tt.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
              ),
              const Spacer(flex: 3),
              PrimaryButton(
                label: l10n.createWorkspace,
                onPressed: () => context.go('/signup/email-password'),
              ),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text(
                    l10n.signIn,
                    style: tt.bodyMedium?.copyWith(
                      color: cs.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
