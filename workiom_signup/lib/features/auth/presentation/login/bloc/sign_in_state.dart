part of 'sign_in_bloc.dart';

enum SignInSubmissionStatus { idle, submitting, success, failure }

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    @Default(TenantName.pure()) TenantName workspace,
    @Default(EmailAddress.pure()) EmailAddress email,
    @Default(Password.pure()) Password password,
    @Default(true) bool obscurePassword,
    @Default(SignInSubmissionStatus.idle)
    SignInSubmissionStatus submissionStatus,
    @Default(null) AuthFailure? failure,
    @Default(null) UserSession? userSession,
  }) = _SignInState;
}
