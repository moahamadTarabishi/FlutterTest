part of 'signup_bloc.dart';

enum SubmissionStatus { idle, submitting, success, failure }

/// Presentation-layer tenant availability indicator — distinct from the domain
/// enum [TenantAvailabilityStatus] returned by [CheckTenantAvailable].
enum TenantAvailability { unknown, checking, available, taken }

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default([]) List<Edition> editions,
    @Default(null) PasswordPolicy? passwordPolicy,
    @Default(null) int? selectedEditionId,
    @Default(EmailAddress.pure()) EmailAddress email,
    @Default(Password.pure()) Password password,
    @Default(TenantName.pure()) TenantName tenantName,
    @Default(PersonName.pure()) PersonName firstName,
    @Default(PersonName.pure()) PersonName lastName,
    @Default(TenantAvailability.unknown) TenantAvailability tenantAvailability,
    @Default(SubmissionStatus.idle) SubmissionStatus submissionStatus,
    @Default(null) AuthFailure? failure,
    // Populated after RegisterAndAuthenticate succeeds.
    @Default(null) UserSession? userSession,
  }) = _SignUpState;
}
