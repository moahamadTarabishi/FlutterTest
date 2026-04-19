import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workiom_signup/core/error/failures.dart';
import 'package:workiom_signup/features/auth/domain/entities/edition.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_editions.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

const _testEditions = [Edition(id: 1, displayName: 'Free')];

void main() {
  late _MockAuthRepository mockRepo;
  late GetEditions useCase;

  setUp(() {
    mockRepo = _MockAuthRepository();
    useCase = GetEditions(mockRepo);
  });

  group('GetEditions', () {
    test('returns editions list when repository succeeds', () async {
      when(() => mockRepo.getEditions())
          .thenAnswer((_) async => const Right(_testEditions));

      final result = await useCase();

      expect(result, const Right<AuthFailure, List<Edition>>(_testEditions));
    });

    test('returns empty list when no editions exist', () async {
      when(() => mockRepo.getEditions())
          .thenAnswer((_) async => const Right([]));

      final result = await useCase();

      expect(result, const Right<AuthFailure, List<Edition>>([]));
    });

    test('returns failure when repository fails', () async {
      const failure = AuthFailure.generic(Failure.timeout());
      when(() => mockRepo.getEditions())
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase();

      expect(result, const Left<AuthFailure, List<Edition>>(failure));
    });
  });
}
