import 'package:dartz/dartz.dart';
import 'package:workiom_signup/features/auth/domain/entities/registered_tenant.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/person_name.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';

class RegisterTenant {
  RegisterTenant(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, RegisteredTenant>> call({
    required EmailAddress email,
    required Password password,
    required TenantName tenantName,
    required PersonName firstName,
    required PersonName lastName,
    required int editionId,
  }) =>
      _repository.registerTenant(
        email: email,
        password: password,
        tenantName: tenantName,
        firstName: firstName,
        lastName: lastName,
        editionId: editionId,
      );
}
