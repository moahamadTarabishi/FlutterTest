import 'package:dartz/dartz.dart';
import 'package:workiom_signup/features/auth/domain/entities/user_session.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentSession {
  GetCurrentSession(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, UserSession?>> call() =>
      _repository.getCurrentSession();
}
