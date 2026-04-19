import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/entities/registered_tenant.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';
import 'package:workiom_signup/features/auth/domain/usecases/register_tenant.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/person_name.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

const _policy = PasswordPolicy(
  requiredLength: 6,
  requireUppercase: false,
  requireLowercase: false,
  requireDigit: false,
  requireNonAlphanumeric: false,
);

void main() {
  late _MockAuthRepository mockRepo;
  late RegisterTenant useCase;

  setUpAll(() {
    registerFallbackValue(EmailAddress('fallback@example.com'));
    registerFallbackValue(const Password.pure());
    registerFallbackValue(TenantName('fallback'));
    registerFallbackValue(PersonName('John'));
  });

  setUp(() {
    mockRepo = _MockAuthRepository();
    useCase = RegisterTenant(mockRepo);
  });

  group('RegisterTenant', () {
    test('returns registered tenant on success', () async {
      const registered = RegisteredTenant(tenantId: 42);
      when(
        () => mockRepo.registerTenant(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenantName: any(named: 'tenantName'),
          firstName: any(named: 'firstName'),
          lastName: any(named: 'lastName'),
          editionId: any(named: 'editionId'),
        ),
      ).thenAnswer((_) async => const Right(registered));

      final result = await useCase(
        email: EmailAddress('user@example.com'),
        password: Password('abc123', _policy),
        tenantName: TenantName('mycompany'),
        firstName: PersonName('John'),
        lastName: PersonName('Doe'),
        editionId: 1,
      );

      expect(result, const Right<AuthFailure, RegisteredTenant>(registered));
    });

    test('returns tenantTaken failure when name is taken', () async {
      when(
        () => mockRepo.registerTenant(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenantName: any(named: 'tenantName'),
          firstName: any(named: 'firstName'),
          lastName: any(named: 'lastName'),
          editionId: any(named: 'editionId'),
        ),
      ).thenAnswer((_) async => const Left(AuthFailure.tenantTaken()));

      final result = await useCase(
        email: EmailAddress('user@example.com'),
        password: Password('abc123', _policy),
        tenantName: TenantName('taken-name'),
        firstName: PersonName('John'),
        lastName: PersonName('Doe'),
        editionId: 1,
      );

      expect(
        result,
        const Left<AuthFailure, RegisteredTenant>(AuthFailure.tenantTaken()),
      );
    });
  });
}
