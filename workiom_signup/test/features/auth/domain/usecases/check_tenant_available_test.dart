import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workiom_signup/core/error/failures.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';
import 'package:workiom_signup/features/auth/domain/usecases/check_tenant_available.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_availability.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late _MockAuthRepository mockRepo;
  late CheckTenantAvailable useCase;

  setUpAll(() {
    registerFallbackValue(TenantName('fallback'));
  });

  setUp(() {
    mockRepo = _MockAuthRepository();
    useCase = CheckTenantAvailable(mockRepo);
  });

  group('CheckTenantAvailable', () {
    test('returns available when tenant name is free', () async {
      when(() => mockRepo.checkTenantAvailable(any())).thenAnswer(
        (_) async => const Right(TenantAvailabilityStatus.available),
      );

      final result = await useCase(TenantName('mycompany'));

      expect(
        result,
        const Right<AuthFailure, TenantAvailabilityStatus>(
          TenantAvailabilityStatus.available,
        ),
      );
    });

    test('returns taken when tenant name is already registered', () async {
      when(() => mockRepo.checkTenantAvailable(any())).thenAnswer(
        (_) async => const Right(TenantAvailabilityStatus.taken),
      );

      final result = await useCase(TenantName('mycompany'));

      expect(
        result,
        const Right<AuthFailure, TenantAvailabilityStatus>(
          TenantAvailabilityStatus.taken,
        ),
      );
    });

    test('returns failure when repository fails', () async {
      const failure = AuthFailure.generic(Failure.network());
      when(() => mockRepo.checkTenantAvailable(any()))
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase(TenantName('mycompany'));

      expect(
        result,
        const Left<AuthFailure, TenantAvailabilityStatus>(failure),
      );
    });
  });
}
