import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workiom_signup/core/error/failures.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_password_policy.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

const _testPolicy = PasswordPolicy(
  requiredLength: 8,
  requireUppercase: true,
  requireLowercase: true,
  requireDigit: true,
  requireNonAlphanumeric: false,
);

void main() {
  late _MockAuthRepository mockRepo;
  late GetPasswordPolicy useCase;

  setUp(() {
    mockRepo = _MockAuthRepository();
    useCase = GetPasswordPolicy(mockRepo);
  });

  group('GetPasswordPolicy', () {
    test('returns policy when repository succeeds', () async {
      when(() => mockRepo.getPasswordPolicy())
          .thenAnswer((_) async => const Right(_testPolicy));

      final result = await useCase();

      expect(result, const Right<AuthFailure, PasswordPolicy>(_testPolicy));
    });

    test('returns failure when repository fails', () async {
      const failure = AuthFailure.generic(Failure.network());
      when(() => mockRepo.getPasswordPolicy())
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase();

      expect(result, const Left<AuthFailure, PasswordPolicy>(failure));
    });
  });
}
