import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';

/// Stub login page — UX only, no backend integration required.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: cs.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: cs.onSurface),
          onPressed: () => context.go('/welcome'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                l10n.signIn,
                style: tt.headlineMedium?.copyWith(
                  color: cs.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.loginSubtitle,
                style: tt.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
              ),
              const Spacer(),
              Center(
                child: Text(
                  l10n.loginOutOfScope,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
