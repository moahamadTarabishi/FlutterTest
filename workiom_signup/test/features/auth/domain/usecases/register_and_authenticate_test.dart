import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workiom_signup/core/error/failures.dart';
import 'package:workiom_signup/features/auth/domain/entities/auth_token.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/entities/registered_tenant.dart';
import 'package:workiom_signup/features/auth/domain/entities/user_session.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/usecases/authenticate.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_current_session.dart';
import 'package:workiom_signup/features/auth/domain/usecases/register_and_authenticate.dart';
import 'package:workiom_signup/features/auth/domain/usecases/register_tenant.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/person_name.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';

class _MockRegisterTenant extends Mock implements RegisterTenant {}

class _MockAuthenticate extends Mock implements Authenticate {}

class _MockGetCurrentSession extends Mock implements GetCurrentSession {}

const _policy = PasswordPolicy(
  requiredLength: 6,
  requireUppercase: false,
  requireLowercase: false,
  requireDigit: false,
  requireNonAlphanumeric: false,
);

const _token = AuthToken(accessToken: 'test-token');
const _registered = RegisteredTenant(tenantId: 1);
const _session = UserSession(
  user: SessionUser(
    id: 1,
    name: 'John',
    surname: 'Doe',
    userName: 'john.doe',
    emailAddress: 'john@example.com',
  ),
);

void main() {
  late _MockRegisterTenant mockRegister;
  late _MockAuthenticate mockAuth;
  late _MockGetCurrentSession mockGetSession;
  late RegisterAndAuthenticate useCase;

  final email = EmailAddress('john@example.com');
  final password = Password('abc123', _policy);
  final tenantName = TenantName('mycompany');
  final firstName = PersonName('John');
  final lastName = PersonName('Doe');
  const editionId = 1;

  setUpAll(() {
    registerFallbackValue(EmailAddress('fallback@example.com'));
    registerFallbackValue(const Password.pure());
    registerFallbackValue(TenantName('fallback'));
    registerFallbackValue(PersonName('John'));
  });

  setUp(() {
    mockRegister = _MockRegisterTenant();
    mockAuth = _MockAuthenticate();
    mockGetSession = _MockGetCurrentSession();
    useCase = RegisterAndAuthenticate(
      registerTenant: mockRegister,
      authenticate: mockAuth,
      getCurrentSession: mockGetSession,
    );
  });

  group('RegisterAndAuthenticate', () {
    test('success: registers → authenticates → gets session → returns session',
        () async {
      when(
        () => mockRegister(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenantName: any(named: 'tenantName'),
          firstName: any(named: 'firstName'),
          lastName: any(named: 'lastName'),
          editionId: any(named: 'editionId'),
        ),
      ).thenAnswer((_) async => const Right(_registered));
      when(
        () => mockAuth(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenancyName: any(named: 'tenancyName'),
        ),
      ).thenAnswer((_) async => const Right(_token));
      when(() => mockGetSession())
          .thenAnswer((_) async => const Right(_session));

      final result = await useCase(
        email: email,
        password: password,
        tenantName: tenantName,
        firstName: firstName,
        lastName: lastName,
        editionId: editionId,
      );

      expect(result, const Right<AuthFailure, UserSession>(_session));
      verify(() => mockRegister(
            email: any(named: 'email'),
            password: any(named: 'password'),
            tenantName: any(named: 'tenantName'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            editionId: any(named: 'editionId'),
          )).called(1);
      verify(() => mockAuth(
            email: any(named: 'email'),
            password: any(named: 'password'),
            tenancyName: any(named: 'tenancyName'),
          )).called(1);
      verify(() => mockGetSession()).called(1);
    });

    test('registration failure short-circuits — authenticate never called',
        () async {
      const failure = AuthFailure.tenantTaken();
      when(
        () => mockRegister(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenantName: any(named: 'tenantName'),
          firstName: any(named: 'firstName'),
          lastName: any(named: 'lastName'),
          editionId: any(named: 'editionId'),
        ),
      ).thenAnswer((_) async => const Left(failure));

      final result = await useCase(
        email: email,
        password: password,
        tenantName: tenantName,
        firstName: firstName,
        lastName: lastName,
        editionId: editionId,
      );

      expect(result, const Left<AuthFailure, UserSession>(failure));
      verifyNever(() => mockAuth(
            email: any(named: 'email'),
            password: any(named: 'password'),
            tenancyName: any(named: 'tenancyName'),
          ));
    });

    test('auth failure short-circuits — getSession never called', () async {
      const failure = AuthFailure.invalidCredentials();
      when(
        () => mockRegister(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenantName: any(named: 'tenantName'),
          firstName: any(named: 'firstName'),
          lastName: any(named: 'lastName'),
          editionId: any(named: 'editionId'),
        ),
      ).thenAnswer((_) async => const Right(_registered));
      when(
        () => mockAuth(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenancyName: any(named: 'tenancyName'),
        ),
      ).thenAnswer((_) async => const Left(failure));

      final result = await useCase(
        email: email,
        password: password,
        tenantName: tenantName,
        firstName: firstName,
        lastName: lastName,
        editionId: editionId,
      );

      expect(result, const Left<AuthFailure, UserSession>(failure));
      verifyNever(() => mockGetSession());
    });

    test('null session after auth returns generic unknown failure', () async {
      when(
        () => mockRegister(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenantName: any(named: 'tenantName'),
          firstName: any(named: 'firstName'),
          lastName: any(named: 'lastName'),
          editionId: any(named: 'editionId'),
        ),
      ).thenAnswer((_) async => const Right(_registered));
      when(
        () => mockAuth(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenancyName: any(named: 'tenancyName'),
        ),
      ).thenAnswer((_) async => const Right(_token));
      when(() => mockGetSession()).thenAnswer((_) async => const Right(null));

      final result = await useCase(
        email: email,
        password: password,
        tenantName: tenantName,
        firstName: firstName,
        lastName: lastName,
        editionId: editionId,
      );

      expect(
        result,
        const Left<AuthFailure, UserSession>(
          AuthFailure.generic(Failure.unknown()),
        ),
      );
    });
  });
}
