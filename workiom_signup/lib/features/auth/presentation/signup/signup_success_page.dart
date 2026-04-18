import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        final session = state.userSession;
        final tenancyName = session?.tenant?.tenancyName ?? '';

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 80,
                    color: cs.primary,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.thankYouForChoosing,
                    style: tt.headlineMedium?.copyWith(
                      color: cs.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.successSubtitle,
                    style: tt.bodyLarge
                        ?.copyWith(color: cs.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                  if (tenancyName.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: cs.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            l10n.successWorkspace,
                            style: tt.bodySmall
                                ?.copyWith(color: cs.onSurfaceVariant),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'https://$tenancyName.workiom.com/',
                            style: tt.bodyMedium?.copyWith(
                              color: cs.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
