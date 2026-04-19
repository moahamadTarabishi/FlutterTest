import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workiom_signup/features/auth/domain/entities/auth_token.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';
import 'package:workiom_signup/features/auth/domain/usecases/authenticate.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';
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
  late Authenticate useCase;

  setUpAll(() {
    registerFallbackValue(EmailAddress('fallback@example.com'));
    registerFallbackValue(const Password.pure());
    registerFallbackValue(TenantName('fallback'));
  });

  setUp(() {
    mockRepo = _MockAuthRepository();
    useCase = Authenticate(mockRepo);
  });

  group('Authenticate', () {
    test('returns auth token on success', () async {
      const token = AuthToken(accessToken: 'test-access-token');
      when(
        () => mockRepo.authenticate(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenancyName: any(named: 'tenancyName'),
        ),
      ).thenAnswer((_) async => const Right(token));

      final result = await useCase(
        email: EmailAddress('user@example.com'),
        password: Password('abc123', _policy),
        tenancyName: TenantName('mycompany'),
      );

      expect(result, const Right<AuthFailure, AuthToken>(token));
    });

    test('returns invalidCredentials failure on bad credentials', () async {
      when(
        () => mockRepo.authenticate(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenancyName: any(named: 'tenancyName'),
        ),
      ).thenAnswer(
        (_) async => const Left(AuthFailure.invalidCredentials()),
      );

      final result = await useCase(
        email: EmailAddress('user@example.com'),
        password: Password('abc123', _policy),
        tenancyName: TenantName('mycompany'),
      );

      expect(
        result,
        const Left<AuthFailure, AuthToken>(AuthFailure.invalidCredentials()),
      );
    });
  });
}
