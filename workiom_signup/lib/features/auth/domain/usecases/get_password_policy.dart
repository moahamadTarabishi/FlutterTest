import 'package:dartz/dartz.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';

class GetPasswordPolicy {
  GetPasswordPolicy(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, PasswordPolicy>> call() =>
      _repository.getPasswordPolicy();
}
