import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workiom_signup/core/error/failures.dart';
import 'package:workiom_signup/features/auth/domain/entities/edition.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/entities/user_session.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/usecases/check_tenant_available.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_editions.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_password_policy.dart';
import 'package:workiom_signup/features/auth/domain/usecases/register_and_authenticate.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/person_name.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_availability.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';

class _MockGetEditions extends Mock implements GetEditions {}

class _MockGetPasswordPolicy extends Mock implements GetPasswordPolicy {}

class _MockCheckTenantAvailable extends Mock implements CheckTenantAvailable {}

class _MockRegisterAndAuthenticate extends Mock
    implements RegisterAndAuthenticate {}

const _testPolicy = PasswordPolicy(
  requiredLength: 6,
  requireUppercase: false,
  requireLowercase: false,
  requireDigit: false,
  requireNonAlphanumeric: false,
);

const _testEdition = Edition(id: 1, displayName: 'Free');

const _testSession = UserSession(
  user: SessionUser(
    id: 1,
    name: 'John',
    surname: 'Doe',
    userName: 'john.doe',
    emailAddress: 'john@example.com',
  ),
);

SignUpBloc _buildBloc({
  required _MockGetEditions editions,
  required _MockGetPasswordPolicy policy,
  required _MockCheckTenantAvailable check,
  required _MockRegisterAndAuthenticate register,
}) =>
    SignUpBloc(
      getEditions: editions,
      getPasswordPolicy: policy,
      checkTenantAvailable: check,
      registerAndAuthenticate: register,
    );

void main() {
  late _MockGetEditions mockEditions;
  late _MockGetPasswordPolicy mockPolicy;
  late _MockCheckTenantAvailable mockCheck;
  late _MockRegisterAndAuthenticate mockRegister;

  setUpAll(() {
    registerFallbackValue(TenantName('fallback'));
    registerFallbackValue(EmailAddress('fallback@example.com'));
    registerFallbackValue(const Password.pure());
    registerFallbackValue(PersonName('John'));
  });

  setUp(() {
    mockEditions = _MockGetEditions();
    mockPolicy = _MockGetPasswordPolicy();
    mockCheck = _MockCheckTenantAvailable();
    mockRegister = _MockRegisterAndAuthenticate();
  });

  group('SignUpStarted', () {
    blocTest<SignUpBloc, SignUpState>(
      'emits editions, policy, and auto-selected edition id on success',
      build: () {
        when(() => mockEditions()).thenAnswer(
          (_) async => const Right([_testEdition]),
        );
        when(() => mockPolicy()).thenAnswer(
          (_) async => const Right(_testPolicy),
        );
        return _buildBloc(
          editions: mockEditions,
          policy: mockPolicy,
          check: mockCheck,
          register: mockRegister,
        );
      },
      act: (b) => b.add(const SignUpEvent.started()),
      expect: () => [
        isA<SignUpState>()
            .having((s) => s.editions, 'editions', [_testEdition])
            .having((s) => s.passwordPolicy, 'policy', _testPolicy)
            .having((s) => s.selectedEditionId, 'selectedEditionId', 1)
            .having((s) => s.bootFailed, 'bootFailed', false),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'sets bootFailed when editions call fails',
      build: () {
        when(() => mockEditions()).thenAnswer(
          (_) async => const Left(AuthFailure.generic(Failure.network())),
        );
        when(() => mockPolicy()).thenAnswer(
          (_) async => const Right(_testPolicy),
        );
        return _buildBloc(
          editions: mockEditions,
          policy: mockPolicy,
          check: mockCheck,
          register: mockRegister,
        );
      },
      act: (b) => b.add(const SignUpEvent.started()),
      expect: () => [
        isA<SignUpState>().having((s) => s.bootFailed, 'bootFailed', true),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'sets bootFailed when policy call fails',
      build: () {
        when(() => mockEditions()).thenAnswer(
          (_) async => const Right([_testEdition]),
        );
        when(() => mockPolicy()).thenAnswer(
          (_) async => const Left(AuthFailure.generic(Failure.network())),
        );
        return _buildBloc(
          editions: mockEditions,
          policy: mockPolicy,
          check: mockCheck,
          register: mockRegister,
        );
      },
      act: (b) => b.add(const SignUpEvent.started()),
      expect: () => [
        isA<SignUpState>().having((s) => s.bootFailed, 'bootFailed', true),
      ],
    );
  });

  group('SignUpEmailChanged', () {
    blocTest<SignUpBloc, SignUpState>(
      'emits valid email value object',
      build: () => _buildBloc(
        editions: mockEditions,
        policy: mockPolicy,
        check: mockCheck,
        register: mockRegister,
      ),
      act: (b) => b.add(const SignUpEvent.emailChanged('user@example.com')),
      expect: () => [
        isA<SignUpState>()
            .having((s) => s.email.isValid, 'email.isValid', true),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits invalid email for malformed input',
      build: () => _buildBloc(
        editions: mockEditions,
        policy: mockPolicy,
        check: mockCheck,
        register: mockRegister,
      ),
      act: (b) => b.add(const SignUpEvent.emailChanged('not-an-email')),
      expect: () => [
        isA<SignUpState>()
            .having((s) => s.email.isValid, 'email.isValid', false),
      ],
    );
  });

  group('SignUpTenantNameChanged (debounced)', () {
    blocTest<SignUpBloc, SignUpState>(
      'emits checking then available after debounce',
      build: () {
        when(() => mockCheck(any())).thenAnswer(
          (_) async => const Right(TenantAvailabilityStatus.available),
        );
        return _buildBloc(
          editions: mockEditions,
          policy: mockPolicy,
          check: mockCheck,
          register: mockRegister,
        );
      },
      act: (b) => b.add(const SignUpEvent.tenantNameChanged('mycompany')),
      wait: const Duration(milliseconds: 600),
      expect: () => [
        isA<SignUpState>().having(
          (s) => s.tenantAvailability,
          'availability',
          TenantAvailability.unknown,
        ),
        isA<SignUpState>().having(
          (s) => s.tenantAvailability,
          'availability',
          TenantAvailability.checking,
        ),
        isA<SignUpState>().having(
          (s) => s.tenantAvailability,
          'availability',
          TenantAvailability.available,
        ),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits only unknown for an invalid tenant name (no API call)',
      build: () => _buildBloc(
        editions: mockEditions,
        policy: mockPolicy,
        check: mockCheck,
        register: mockRegister,
      ),
      act: (b) =>
          b.add(const SignUpEvent.tenantNameChanged('1starts-with-digit')),
      wait: const Duration(milliseconds: 600),
      expect: () => [
        isA<SignUpState>().having(
          (s) => s.tenantAvailability,
          'availability',
          TenantAvailability.unknown,
        ),
      ],
      verify: (_) => verifyNever(() => mockCheck(any())),
    );
  });

  group('SignUpSubmitted (droppable)', () {
    blocTest<SignUpBloc, SignUpState>(
      'does nothing when selectedEditionId is null',
      build: () => _buildBloc(
        editions: mockEditions,
        policy: mockPolicy,
        check: mockCheck,
        register: mockRegister,
      ),
      act: (b) => b.add(const SignUpEvent.submitted()),
      expect: () => <SignUpState>[],
      verify: (_) => verifyNever(
        () => mockRegister(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenantName: any(named: 'tenantName'),
          firstName: any(named: 'firstName'),
          lastName: any(named: 'lastName'),
          editionId: any(named: 'editionId'),
        ),
      ),
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits submitting then success with userSession on happy path',
      build: () {
        when(
          () => mockRegister(
            email: any(named: 'email'),
            password: any(named: 'password'),
            tenantName: any(named: 'tenantName'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            editionId: any(named: 'editionId'),
          ),
        ).thenAnswer((_) async => const Right(_testSession));
        return _buildBloc(
          editions: mockEditions,
          policy: mockPolicy,
          check: mockCheck,
          register: mockRegister,
        );
      },
      seed: () => SignUpState(
        selectedEditionId: 1,
        email: EmailAddress('user@example.com'),
        password: Password('abc123', _testPolicy),
        tenantName: TenantName('mycompany'),
        firstName: PersonName('John'),
        lastName: PersonName('Doe'),
        tenantAvailability: TenantAvailability.available,
      ),
      act: (b) => b.add(const SignUpEvent.submitted()),
      expect: () => [
        isA<SignUpState>().having(
          (s) => s.submissionStatus,
          'status',
          SubmissionStatus.submitting,
        ),
        isA<SignUpState>()
            .having(
              (s) => s.submissionStatus,
              'status',
              SubmissionStatus.success,
            )
            .having((s) => s.userSession, 'userSession', _testSession),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits submitting then failure on registration error',
      build: () {
        when(
          () => mockRegister(
            email: any(named: 'email'),
            password: any(named: 'password'),
            tenantName: any(named: 'tenantName'),
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            editionId: any(named: 'editionId'),
          ),
        ).thenAnswer((_) async => const Left(AuthFailure.tenantTaken()));
        return _buildBloc(
          editions: mockEditions,
          policy: mockPolicy,
          check: mockCheck,
          register: mockRegister,
        );
      },
      seed: () => SignUpState(
        selectedEditionId: 1,
        email: EmailAddress('user@example.com'),
        password: Password('abc123', _testPolicy),
        tenantName: TenantName('mycompany'),
        firstName: PersonName('John'),
        lastName: PersonName('Doe'),
        tenantAvailability: TenantAvailability.available,
      ),
      act: (b) => b.add(const SignUpEvent.submitted()),
      expect: () => [
        isA<SignUpState>().having(
          (s) => s.submissionStatus,
          'status',
          SubmissionStatus.submitting,
        ),
        isA<SignUpState>()
            .having(
              (s) => s.submissionStatus,
              'status',
              SubmissionStatus.failure,
            )
            .having(
              (s) => s.failure,
              'failure',
              const AuthFailure.tenantTaken(),
            ),
      ],
    );
  });
}
