import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workiom_signup/core/error/failures.dart';

part 'auth_failure.freezed.dart';

@freezed
sealed class AuthFailure with _$AuthFailure {
  const factory AuthFailure.generic(Failure failure) = AuthFailureGeneric;
  const factory AuthFailure.tenantTaken() = AuthFailureTenantTaken;
  const factory AuthFailure.invalidCredentials() =
      AuthFailureInvalidCredentials;
  const factory AuthFailure.validation(Map<String, String> fieldErrors) =
      AuthFailureValidation;
}
