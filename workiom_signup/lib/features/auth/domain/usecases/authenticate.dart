import 'package:dartz/dartz.dart';
import 'package:workiom_signup/features/auth/domain/entities/auth_token.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';

class Authenticate {
  Authenticate(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, AuthToken>> call({
    required EmailAddress email,
    required Password password,
    required TenantName tenancyName,
  }) =>
      _repository.authenticate(
        email: email,
        password: password,
        tenancyName: tenancyName,
      );
}
