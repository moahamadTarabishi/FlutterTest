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
import 'package:workiom_signup/core/widgets/app_text_field.dart';
import 'package:workiom_signup/core/widgets/primary_button.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';
import 'package:workiom_signup/features/auth/presentation/signup/widgets/tenant_availability_indicator.dart';

class SignUpWorkspacePage extends StatelessWidget {
  const SignUpWorkspacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return BlocListener<SignUpBloc, SignUpState>(
      listenWhen: (prev, curr) =>
          prev.submissionStatus != curr.submissionStatus,
      listener: (context, state) {
        if (state.submissionStatus == SubmissionStatus.success) {
          context.go(AppRoutes.signupSuccess);
        } else if (state.submissionStatus == SubmissionStatus.failure) {
          final msg = _errorMessage(state, l10n);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(msg)));
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          final tenantError = state.tenantName.value.fold(
            (f) => switch (f) {
              ValueFailureEmpty() => null,
              ValueFailureInvalidTenantName() => l10n.errorTenantNameFormat,
              ValueFailureInvalidLength() => l10n.errorTenantNameTooShort,
              _ => null,
            },
            (_) => null,
          );
          final firstError = state.firstName.value.fold(
            (f) => switch (f) {
              ValueFailureLettersOnly() => l10n.errorLettersOnly,
              _ => null,
            },
            (_) => null,
          );
          final lastError = state.lastName.value.fold(
            (f) => switch (f) {
              ValueFailureLettersOnly() => l10n.errorLettersOnly,
              _ => null,
            },
            (_) => null,
          );
          final isSubmitting =
              state.submissionStatus == SubmissionStatus.submitting;
          final canSubmit = state.tenantName.isValid &&
              state.tenantAvailability == TenantAvailability.available &&
              state.firstName.isValid &&
              state.lastName.isValid &&
              !isSubmitting;

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: AppIcon(Assets.icons.icChevronLeft, color: cs.primary),
                onPressed: () => context.go(AppRoutes.signupEmailPassword),
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(l10n.enterCompanyName, style: tt.headlineMedium),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(l10n.letsStartJourney, style: tt.titleLarge)
                            ],
                          ),
                          const SizedBox(height: 30),
                          // Workspace field
                          AppTextField(
                            label: l10n.yourCompanyOrTeamName,
                            hintText: l10n.workspaceNameHint,
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.next,
                            prefixIcon:
                                AppIcon(Assets.icons.icGroup, size: 16),
                            suffixText: '.workiom.com',
                            errorText: tenantError,
                            onChanged: (v) => context
                                .read<SignUpBloc>()
                                .add(SignUpEvent.tenantNameChanged(v)),
                          ),
                          const SizedBox(height: 8),
                          TenantAvailabilityIndicator(
                            availability: state.tenantAvailability,
                            tenantName: state.tenantName.value
                                .getOrElse(() => ''),
                          ),
                          const SizedBox(height: 24),
                          // First name field
                          AppTextField(
                            label: l10n.yourFirstName,
                            hintText: l10n.enterFirstName,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            prefixIcon:
                                AppIcon(Assets.icons.icPerson, size: 16),
                            errorText: firstError,
                            onChanged: (v) => context
                                .read<SignUpBloc>()
                                .add(SignUpEvent.firstNameChanged(v)),
                          ),
                          const SizedBox(height: 24),
                          // Last name field
                          AppTextField(
                            label: l10n.yourLastName,
                            hintText: l10n.enterLastName,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            prefixIcon:
                                AppIcon(Assets.icons.icPerson, size: 16),
                            errorText: lastError,
                            onChanged: (v) => context
                                .read<SignUpBloc>()
                                .add(SignUpEvent.lastNameChanged(v)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        PrimaryButton(
                          label: isSubmitting
                              ? l10n.submitting
                              : l10n.createWorkspace,
                          isLoading: isSubmitting,
                          onPressed: canSubmit
                              ? () => context
                                  .read<SignUpBloc>()
                                  .add(const SignUpEvent.submitted())
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
      ),
    );
  }

  String _errorMessage(SignUpState state, AppLocalizations l10n) {
    final f = state.failure;
    if (f == null) return l10n.errorUnknown;
    return switch (f) {
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
}
