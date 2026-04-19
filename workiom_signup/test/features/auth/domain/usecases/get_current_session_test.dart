import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workiom_signup/core/error/failures.dart';
import 'package:workiom_signup/features/auth/domain/entities/user_session.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_current_session.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

const _testSession = UserSession(
  user: SessionUser(
    id: 1,
    name: 'John',
    surname: 'Doe',
    userName: 'john.doe',
    emailAddress: 'john@example.com',
  ),
);

void main() {
  late _MockAuthRepository mockRepo;
  late GetCurrentSession useCase;

  setUp(() {
    mockRepo = _MockAuthRepository();
    useCase = GetCurrentSession(mockRepo);
  });

  group('GetCurrentSession', () {
    test('returns session when repository succeeds', () async {
      when(() => mockRepo.getCurrentSession())
          .thenAnswer((_) async => const Right(_testSession));

      final result = await useCase();

      expect(result, const Right<AuthFailure, UserSession?>(_testSession));
    });

    test('returns null session when no user is logged in', () async {
      when(() => mockRepo.getCurrentSession())
          .thenAnswer((_) async => const Right(null));

      final result = await useCase();

      expect(result, const Right<AuthFailure, UserSession?>(null));
    });

    test('returns failure when repository fails', () async {
      const failure = AuthFailure.generic(Failure.network());
      when(() => mockRepo.getCurrentSession())
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase();

      expect(result, const Left<AuthFailure, UserSession?>(failure));
    });
  });
}
