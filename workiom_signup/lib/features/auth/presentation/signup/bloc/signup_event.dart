part of 'signup_bloc.dart';

@freezed
sealed class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.started() = SignUpStarted;
  const factory SignUpEvent.emailChanged(String email) = SignUpEmailChanged;
  const factory SignUpEvent.passwordChanged(String password) =
      SignUpPasswordChanged;
  const factory SignUpEvent.tenantNameChanged(String tenantName) =
      SignUpTenantNameChanged;
  const factory SignUpEvent.firstNameChanged(String firstName) =
      SignUpFirstNameChanged;
  const factory SignUpEvent.lastNameChanged(String lastName) =
      SignUpLastNameChanged;
  const factory SignUpEvent.editionSelected(int editionId) =
      SignUpEditionSelected;
  const factory SignUpEvent.submitted() = SignUpSubmitted;
}
