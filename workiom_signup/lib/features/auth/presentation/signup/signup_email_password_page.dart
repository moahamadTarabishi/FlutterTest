import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/utils/value_failures.dart';
import 'package:workiom_signup/core/widgets/app_text_field.dart';
import 'package:workiom_signup/core/widgets/primary_button.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';
import 'package:workiom_signup/features/auth/presentation/signup/widgets/password_rules_list.dart';

class SignUpEmailPasswordPage extends StatefulWidget {
  const SignUpEmailPasswordPage({super.key});

  @override
  State<SignUpEmailPasswordPage> createState() =>
      _SignUpEmailPasswordPageState();
}

class _SignUpEmailPasswordPageState extends State<SignUpEmailPasswordPage> {
  String _rawPassword = '';
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        final policy = state.passwordPolicy;
        final emailError = state.email.value.fold(
          (f) => switch (f) {
            ValueFailureEmpty() => l10n.errorEmptyField,
            ValueFailureInvalidEmail() => l10n.errorInvalidEmail,
            _ => null,
          },
          (_) => null,
        );
        final passwordError = state.password.value.fold(
          (f) => switch (f) {
            ValueFailureWeakPassword() => l10n.passwordNotStrongEnough,
            _ => null,
          },
          (_) => null,
        );
        final canProceed = state.email.isValid && state.password.isValid;

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
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    l10n.createFreeAccount,
                    style: tt.headlineMedium?.copyWith(
                      color: cs.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.letsStartJourney,
                    style: tt.bodyLarge
                        ?.copyWith(color: cs.onSurfaceVariant),
                  ),
                  const SizedBox(height: 32),
                  AppTextField(
                    label: l10n.emailLabel,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    errorText: emailError,
                    onChanged: (v) =>
                        context.read<SignUpBloc>().add(SignUpEvent.emailChanged(v)),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    label: l10n.passwordLabel,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    errorText: passwordError,
                    suffix: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: cs.onSurfaceVariant,
                      ),
                      onPressed: () => setState(
                        () => _obscurePassword = !_obscurePassword,
                      ),
                    ),
                    onChanged: (v) {
                      setState(() => _rawPassword = v);
                      context
                          .read<SignUpBloc>()
                          .add(SignUpEvent.passwordChanged(v));
                    },
                  ),
                  if (policy != null) ...[
                    const SizedBox(height: 12),
                    PasswordRulesList(input: _rawPassword, policy: policy),
                  ],
                  const SizedBox(height: 32),
                  PrimaryButton(
                    label: l10n.nextStep,
                    onPressed: canProceed
                        ? () => context.go('/signup/tenant-name')
                        : null,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
