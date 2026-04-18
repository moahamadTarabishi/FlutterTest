import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/error/failures.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/utils/value_failures.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/core/widgets/app_text_field.dart';
import 'package:workiom_signup/core/widgets/primary_button.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

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
          context.go('/signup/success');
        } else if (state.submissionStatus == SubmissionStatus.failure) {
          final msg = _errorMessage(state, l10n);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(msg)));
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
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
          final canSubmit = state.firstName.isValid &&
              state.lastName.isValid &&
              !isSubmitting;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: cs.surface,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: cs.onSurface),
                onPressed: () => context.go('/signup/tenant-name'),
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
                      l10n.enterFirstName,
                      style: tt.headlineMedium?.copyWith(
                        color: cs.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 32),
                    AppTextField(
                      label: l10n.firstNameLabel,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      errorText: firstError,
                      onChanged: (v) => context
                          .read<SignUpBloc>()
                          .add(SignUpEvent.firstNameChanged(v)),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      label: l10n.lastNameLabel,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      errorText: lastError,
                      onChanged: (v) => context
                          .read<SignUpBloc>()
                          .add(SignUpEvent.lastNameChanged(v)),
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(
                      label: isSubmitting ? l10n.submitting : l10n.createWorkspace,
                      isLoading: isSubmitting,
                      onPressed: canSubmit
                          ? () => context
                              .read<SignUpBloc>()
                              .add(const SignUpEvent.submitted())
                          : null,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
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
