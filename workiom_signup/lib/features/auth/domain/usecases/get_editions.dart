import 'package:dartz/dartz.dart';
import 'package:workiom_signup/features/auth/domain/entities/edition.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';

class GetEditions {
  GetEditions(this._repository);
  final AuthRepository _repository;

  Future<Either<AuthFailure, List<Edition>>> call() =>
      _repository.getEditions();
}
