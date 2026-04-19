part of 'sign_in_bloc.dart';

@freezed
sealed class SignInEvent with _$SignInEvent {
  const factory SignInEvent.started() = SignInStarted;
  const factory SignInEvent.workspaceChanged(String tenantName) =
      SignInWorkspaceChanged;
  const factory SignInEvent.emailChanged(String email) = SignInEmailChanged;
  const factory SignInEvent.passwordChanged(String password) =
      SignInPasswordChanged;
  const factory SignInEvent.passwordVisibilityToggled() =
      SignInPasswordVisibilityToggled;
  const factory SignInEvent.submitted() = SignInSubmitted;
  const factory SignInEvent.reset() = SignInReset;
}
