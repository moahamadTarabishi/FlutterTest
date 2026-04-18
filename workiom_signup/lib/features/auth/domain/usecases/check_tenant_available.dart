import 'package:dartz/dartz.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_availability.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';

class CheckTenantAvailable {
  CheckTenantAvailable(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, TenantAvailabilityStatus>> call(TenantName name) =>
      _repository.checkTenantAvailable(name);
}
