import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/router/app_routes.dart';
import 'package:workiom_signup/core/theme/app_semantic_colors.dart';
import 'package:workiom_signup/core/utils/value_failures.dart';
import 'package:workiom_signup/core/widgets/app_footer.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';
import 'package:workiom_signup/core/widgets/app_text_field.dart';
import 'package:workiom_signup/core/widgets/error_banner.dart';
import 'package:workiom_signup/core/widgets/primary_button.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';
import 'package:workiom_signup/features/auth/presentation/signup/widgets/password_rules_list.dart';
import 'package:workiom_signup/features/auth/presentation/signup/widgets/password_strength_bar.dart';

class SignUpEmailPasswordPage extends StatefulWidget {
  const SignUpEmailPasswordPage({super.key});

  @override
  State<SignUpEmailPasswordPage> createState() =>
      _SignUpEmailPasswordPageState();
}

class _SignUpEmailPasswordPageState extends State<SignUpEmailPasswordPage> {
  final _emailController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  String _rawPassword = '';
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final sem = Theme.of(context).extension<AppSemanticColors>()!;

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
        final canProceed = state.email.isValid && state.password.isValid;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: AppIcon(
                Assets.icons.icChevronLeft,
                color: cs.primary,
                matchTextDirection: true,
              ),
              onPressed: () => context.pop(),
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                if (state.bootFailed)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 12),
                      ErrorBanner(message: l10n.errorLoadingConfig),
                      Center(
                        child: TextButton(
                          onPressed: () => context
                              .read<SignUpBloc>()
                              .add(const SignUpEvent.started()),
                          child: Text(l10n.retry),
                        ),
                      ),
                    ],
                  ),
                Expanded(
                  child: AutofillGroup(
                    child: SingleChildScrollView(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            l10n.enterStrongPassword,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(l10n.letsStartJourney,
                                  style: Theme.of(context).textTheme.titleLarge)
                            ],
                          ),
                          const SizedBox(height: 30),
                          AppTextField(
                            label: l10n.yourWorkEmail,
                            hintText: l10n.emailLabel,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            autofillHints: const [AutofillHints.email],
                            autocorrect: false,
                            focusNode: _emailFocus,
                            onSubmitted: (_) =>
                                _passwordFocus.requestFocus(),
                            prefixIcon: AppIcon(
                              Assets.icons.icEmail,
                              size: 16,
                              color: cs.onSurfaceVariant,
                            ),
                            controller: _emailController,
                            errorText: emailError,
                            suffix: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              splashRadius: 20,
                              icon: AppIcon(
                                Assets.icons.icCloseCircle,
                                size: 18,
                                color: sem.textTertiary,
                              ),
                              onPressed: () {
                                _emailController.clear();
                                context
                                    .read<SignUpBloc>()
                                    .add(const SignUpEvent.emailChanged(''));
                              },
                            ),
                            onChanged: (v) => context
                                .read<SignUpBloc>()
                                .add(SignUpEvent.emailChanged(v)),
                          ),
                          const SizedBox(height: 24),
                          AppTextField(
                            label: l10n.yourPassword,
                            hintText: l10n.passwordLabel,
                            obscureText: _obscurePassword,
                            textInputAction: TextInputAction.done,
                            autofillHints: const [AutofillHints.newPassword],
                            autocorrect: false,
                            enableSuggestions: false,
                            focusNode: _passwordFocus,
                            onSubmitted: (_) {
                              if (canProceed) {
                                context.go(AppRoutes.signupWorkspace);
                              }
                            },
                            prefixIcon: AppIcon(
                              Assets.icons.icLock,
                              size: 16,
                              color: cs.onSurfaceVariant,
                            ),
                            suffix: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              splashRadius: 20,
                              icon: AppIcon(
                                _obscurePassword
                                    ? Assets.icons.icEye
                                    : Assets.icons.icEyeOff,
                                size: 20,
                                color: sem.textTertiary,
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
                          const SizedBox(height: 30),
                          PasswordStrengthBar(
                              input: _rawPassword, policy: policy),
                          const SizedBox(height: 8),
                          PasswordRulesList(
                              input: _rawPassword, policy: policy),
                        ],
                      ],
                    ),
                  ),
                ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      PrimaryButton(
                        label: l10n.confirmPassword,
                        onPressed: canProceed
                            ? () => context.go(AppRoutes.signupWorkspace)
                            : null,
                      ),
                      const SizedBox(height: 16),
                      const AppFooter(),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
