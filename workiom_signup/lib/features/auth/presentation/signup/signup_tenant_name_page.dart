import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/utils/value_failures.dart';
import 'package:workiom_signup/core/widgets/app_text_field.dart';
import 'package:workiom_signup/core/widgets/primary_button.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';
import 'package:workiom_signup/features/auth/presentation/signup/widgets/tenant_availability_indicator.dart';

class SignUpTenantNamePage extends StatelessWidget {
  const SignUpTenantNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return BlocBuilder<SignUpBloc, SignUpState>(
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
        final canProceed = state.tenantName.isValid &&
            state.tenantAvailability == TenantAvailability.available;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: cs.surface,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: cs.onSurface),
              onPressed: () => context.go('/signup/email-password'),
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
                    l10n.enterCompanyName,
                    style: tt.headlineMedium?.copyWith(
                      color: cs.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.yourCompanyOrTeamName,
                    style: tt.bodyLarge
                        ?.copyWith(color: cs.onSurfaceVariant),
                  ),
                  const SizedBox(height: 32),
                  AppTextField(
                    label: l10n.workspaceLabel,
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    errorText: tenantError,
                    onChanged: (v) => context
                        .read<SignUpBloc>()
                        .add(SignUpEvent.tenantNameChanged(v)),
                  ),
                  const SizedBox(height: 12),
                  TenantAvailabilityIndicator(
                    availability: state.tenantAvailability,
                    tenantName: state.tenantName.value.getOrElse(() => ''),
                  ),
                  const SizedBox(height: 32),
                  PrimaryButton(
                    label: l10n.nextStep,
                    onPressed: canProceed
                        ? () => context.go('/signup/personal-info')
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
