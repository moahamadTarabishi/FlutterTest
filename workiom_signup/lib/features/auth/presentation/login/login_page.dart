import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/error/failures.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/router/app_routes.dart';
import 'package:workiom_signup/core/utils/value_failures.dart';
import 'package:workiom_signup/core/widgets/app_footer.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';
import 'package:workiom_signup/core/widgets/app_language_switcher.dart';
import 'package:workiom_signup/core/widgets/app_text_field.dart';
import 'package:workiom_signup/core/widgets/app_theme_switcher.dart';
import 'package:workiom_signup/core/widgets/error_banner.dart';
import 'package:workiom_signup/core/widgets/primary_button.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/presentation/login/bloc/sign_in_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _workspaceController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _workspaceFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _workspaceFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    _workspaceController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _workspaceFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _submit(SignInBloc bloc, SignInState state) {
    if (state.workspace.isValid &&
        state.email.isValid &&
        state.password.isValid) {
      bloc.add(const SignInEvent.submitted());
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return BlocListener<SignInBloc, SignInState>(
      listenWhen: (prev, curr) =>
          prev.submissionStatus != curr.submissionStatus &&
          curr.submissionStatus == SignInSubmissionStatus.success,
      listener: (context, _) => context.go(AppRoutes.signInSuccess),
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          final bloc = context.read<SignInBloc>();
          final isSubmitting =
              state.submissionStatus == SignInSubmissionStatus.submitting;
          final canSubmit = state.workspace.isValid &&
              state.email.isValid &&
              state.password.isValid &&
              !isSubmitting;

          final workspaceError = state.workspace.value.fold(
            (f) => switch (f) {
              ValueFailureEmpty() => null,
              ValueFailureInvalidTenantName() => l10n.errorTenantNameFormat,
              ValueFailureInvalidLength() => l10n.errorTenantNameTooShort,
              _ => null,
            },
            (_) => null,
          );
          final emailError = state.email.value.fold(
            (f) => switch (f) {
              ValueFailureInvalidEmail() => l10n.errorInvalidEmail,
              _ => null,
            },
            (_) => null,
          );

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: const [
                AppLanguageSwitcher(),
                SizedBox(width: 8),
                AppThemeSwitcher(),
                SizedBox(width: 12),
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  if (state.failure != null &&
                      state.submissionStatus ==
                          SignInSubmissionStatus.failure) ...[
                    const SizedBox(height: 12),
                    ErrorBanner(message: _errorMessage(state.failure!, l10n)),
                  ],
                  Expanded(
                    child: AutofillGroup(
                      child: SingleChildScrollView(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Text(l10n.signInTitle, style: tt.headlineMedium),
                            const SizedBox(height: 8),
                            Text(l10n.signInSubtitle, style: tt.titleLarge),
                            const SizedBox(height: 30),
                            AppTextField(
                              label: l10n.workspaceLabel,
                              hintText: l10n.workspaceNameHint,
                              controller: _workspaceController,
                              focusNode: _workspaceFocus,
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.next,
                              autocorrect: false,
                              autofillHints: const [
                                AutofillHints.organizationName,
                              ],
                              prefixIcon: AppIcon(
                                Assets.icons.icGroup,
                                size: 16,
                                color: cs.onSurfaceVariant,
                              ),
                              errorText: workspaceError,
                              onChanged: (v) =>
                                  bloc.add(SignInEvent.workspaceChanged(v)),
                              onSubmitted: (_) => _emailFocus.requestFocus(),
                            ),
                            const SizedBox(height: 24),
                            AppTextField(
                              label: l10n.emailLabel,
                              hintText: l10n.yourWorkEmail,
                              controller: _emailController,
                              focusNode: _emailFocus,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              autofillHints: const [
                                AutofillHints.username,
                                AutofillHints.email,
                              ],
                              prefixIcon: AppIcon(
                                Assets.icons.icEmail,
                                size: 16,
                                color: cs.onSurfaceVariant,
                              ),
                              errorText: emailError,
                              onChanged: (v) =>
                                  bloc.add(SignInEvent.emailChanged(v)),
                              onSubmitted: (_) => _passwordFocus.requestFocus(),
                            ),
                            const SizedBox(height: 24),
                            AppTextField(
                              label: l10n.passwordLabel,
                              hintText: l10n.yourPassword,
                              controller: _passwordController,
                              focusNode: _passwordFocus,
                              obscureText: state.obscurePassword,
                              textInputAction: TextInputAction.done,
                              autofillHints: const [AutofillHints.password],
                              prefixIcon: AppIcon(
                                Assets.icons.icLock,
                                size: 16,
                                color: cs.onSurfaceVariant,
                              ),
                              suffix: IconButton(
                                onPressed: () => bloc.add(
                                  const SignInEvent.passwordVisibilityToggled(),
                                ),
                                icon: AppIcon(
                                  state.obscurePassword
                                      ? Assets.icons.icEyeOff
                                      : Assets.icons.icEye,
                                  size: 20,
                                  color: cs.onSurfaceVariant,
                                ),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                  minWidth: 44,
                                  minHeight: 44,
                                ),
                              ),
                              onChanged: (v) =>
                                  bloc.add(SignInEvent.passwordChanged(v)),
                              onSubmitted: (_) => _submit(bloc, state),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        PrimaryButton(
                          label: isSubmitting ? l10n.signingIn : l10n.signIn,
                          isLoading: isSubmitting,
                          onPressed: canSubmit
                              ? () => bloc.add(const SignInEvent.submitted())
                              : null,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l10n.dontHaveAccount,
                              style: tt.bodyMedium,
                            ),
                            TextButton(
                              onPressed: () => context.go(AppRoutes.welcome),
                              style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsetsDirectional.symmetric(
                                  horizontal: 4,
                                ),
                                minimumSize: Size.zero,
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                l10n.createOne,
                                style: tt.labelLarge
                                    ?.copyWith(color: cs.primary),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
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
      ),
    );
  }

  String _errorMessage(AuthFailure failure, AppLocalizations l10n) =>
      switch (failure) {
        AuthFailureGeneric(:final failure) => switch (failure) {
            NetworkFailure() => l10n.errorNetwork,
            TimeoutFailure() => l10n.errorTimeout,
            ServerFailure(:final message) => message ?? l10n.errorServer,
            UnauthorizedFailure() => l10n.errorUnauthorized,
            UnknownFailure() => l10n.errorUnknown,
          },
        AuthFailureTenantTaken() => l10n.errorTenantTaken,
        AuthFailureInvalidCredentials() => l10n.errorInvalidCredentials,
        AuthFailureValidation(:final fieldErrors) => fieldErrors.values.first,
      };
}
