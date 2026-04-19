import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workiom_signup/core/error/failures.dart';
import 'package:workiom_signup/features/auth/domain/entities/auth_token.dart';
import 'package:workiom_signup/features/auth/domain/entities/user_session.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/usecases/authenticate.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_current_session.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';
import 'package:workiom_signup/features/auth/presentation/login/bloc/sign_in_bloc.dart';

class _MockAuthenticate extends Mock implements Authenticate {}

class _MockGetCurrentSession extends Mock implements GetCurrentSession {}

const _testToken = AuthToken(accessToken: 'token123');

const _testSession = UserSession(
  user: SessionUser(
    id: 1,
    name: 'Jane',
    surname: 'Smith',
    userName: 'jane.smith',
    emailAddress: 'jane@example.com',
  ),
);

SignInBloc _buildBloc({
  required _MockAuthenticate authenticate,
  required _MockGetCurrentSession getCurrentSession,
}) =>
    SignInBloc(
      authenticate: authenticate,
      getCurrentSession: getCurrentSession,
    );

void main() {
  late _MockAuthenticate mockAuthenticate;
  late _MockGetCurrentSession mockGetCurrentSession;

  setUpAll(() {
    registerFallbackValue(TenantName('fallback'));
    registerFallbackValue(EmailAddress('fallback@example.com'));
    registerFallbackValue(Password.signIn('fallback'));
  });

  setUp(() {
    mockAuthenticate = _MockAuthenticate();
    mockGetCurrentSession = _MockGetCurrentSession();
  });

  group('SignInWorkspaceChanged', () {
    blocTest<SignInBloc, SignInState>(
      'emits valid TenantName for well-formed input',
      build: () => _buildBloc(
        authenticate: mockAuthenticate,
        getCurrentSession: mockGetCurrentSession,
      ),
      act: (b) => b.add(const SignInEvent.workspaceChanged('mycompany')),
      expect: () => [
        isA<SignInState>()
            .having((s) => s.workspace.isValid, 'workspace.isValid', true),
      ],
    );

    blocTest<SignInBloc, SignInState>(
      'emits invalid TenantName for names starting with a digit',
      build: () => _buildBloc(
        authenticate: mockAuthenticate,
        getCurrentSession: mockGetCurrentSession,
      ),
      act: (b) => b.add(const SignInEvent.workspaceChanged('1bad')),
      expect: () => [
        isA<SignInState>()
            .having((s) => s.workspace.isValid, 'workspace.isValid', false),
      ],
    );
  });

  group('SignInEmailChanged', () {
    blocTest<SignInBloc, SignInState>(
      'emits valid EmailAddress for valid email',
      build: () => _buildBloc(
        authenticate: mockAuthenticate,
        getCurrentSession: mockGetCurrentSession,
      ),
      act: (b) => b.add(const SignInEvent.emailChanged('user@example.com')),
      expect: () => [
        isA<SignInState>()
            .having((s) => s.email.isValid, 'email.isValid', true),
      ],
    );

    blocTest<SignInBloc, SignInState>(
      'emits invalid EmailAddress for malformed email',
      build: () => _buildBloc(
        authenticate: mockAuthenticate,
        getCurrentSession: mockGetCurrentSession,
      ),
      act: (b) => b.add(const SignInEvent.emailChanged('not-an-email')),
      expect: () => [
        isA<SignInState>()
            .having((s) => s.email.isValid, 'email.isValid', false),
      ],
    );
  });

  group('SignInPasswordChanged', () {
    blocTest<SignInBloc, SignInState>(
      'emits valid Password for non-empty input',
      build: () => _buildBloc(
        authenticate: mockAuthenticate,
        getCurrentSession: mockGetCurrentSession,
      ),
      act: (b) => b.add(const SignInEvent.passwordChanged('anyPassword')),
      expect: () => [
        isA<SignInState>()
            .having((s) => s.password.isValid, 'password.isValid', true),
      ],
    );

    blocTest<SignInBloc, SignInState>(
      'emits invalid Password for empty string',
      build: () => _buildBloc(
        authenticate: mockAuthenticate,
        getCurrentSession: mockGetCurrentSession,
      ),
      act: (b) => b.add(const SignInEvent.passwordChanged('')),
      expect: () => [
        isA<SignInState>()
            .having((s) => s.password.isValid, 'password.isValid', false),
      ],
    );
  });

  group('SignInPasswordVisibilityToggled', () {
    blocTest<SignInBloc, SignInState>(
      'flips obscurePassword from true to false then back',
      build: () => _buildBloc(
        authenticate: mockAuthenticate,
        getCurrentSession: mockGetCurrentSession,
      ),
      act: (b) {
        b
          ..add(const SignInEvent.passwordVisibilityToggled())
          ..add(const SignInEvent.passwordVisibilityToggled());
      },
      expect: () => [
        isA<SignInState>()
            .having((s) => s.obscurePassword, 'obscurePassword', false),
        isA<SignInState>()
            .having((s) => s.obscurePassword, 'obscurePassword', true),
      ],
    );
  });

  group('SignInSubmitted', () {
    SignInBloc buildWithValidFields() {
      final bloc = _buildBloc(
        authenticate: mockAuthenticate,
        getCurrentSession: mockGetCurrentSession,
      );
      return bloc
        ..add(const SignInEvent.workspaceChanged('mycompany'))
        ..add(const SignInEvent.emailChanged('user@example.com'))
        ..add(const SignInEvent.passwordChanged('secret'));
    }

    blocTest<SignInBloc, SignInState>(
      'does nothing when fields are invalid',
      build: () => _buildBloc(
        authenticate: mockAuthenticate,
        getCurrentSession: mockGetCurrentSession,
      ),
      act: (b) => b.add(const SignInEvent.submitted()),
      expect: () => <SignInState>[],
      verify: (_) => verifyNever(
        () => mockAuthenticate(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenancyName: any(named: 'tenancyName'),
        ),
      ),
    );

    blocTest<SignInBloc, SignInState>(
      'emits submitting then success with userSession on happy path',
      build: () {
        when(
          () => mockAuthenticate(
            email: any(named: 'email'),
            password: any(named: 'password'),
            tenancyName: any(named: 'tenancyName'),
          ),
        ).thenAnswer((_) async => const Right(_testToken));
        when(() => mockGetCurrentSession())
            .thenAnswer((_) async => const Right(_testSession));
        return buildWithValidFields();
      },
      act: (b) => b.add(const SignInEvent.submitted()),
      skip: 3, // skip the 3 field-change states
      expect: () => [
        isA<SignInState>().having(
          (s) => s.submissionStatus,
          'submissionStatus',
          SignInSubmissionStatus.submitting,
        ),
        isA<SignInState>()
            .having(
              (s) => s.submissionStatus,
              'submissionStatus',
              SignInSubmissionStatus.success,
            )
            .having((s) => s.userSession, 'userSession', _testSession),
      ],
    );

    blocTest<SignInBloc, SignInState>(
      'clears stale failure and userSession on resubmit',
      build: () {
        when(
          () => mockAuthenticate(
            email: any(named: 'email'),
            password: any(named: 'password'),
            tenancyName: any(named: 'tenancyName'),
          ),
        ).thenAnswer(
          (_) async =>
              const Left(AuthFailure.generic(Failure.network())),
        );
        return buildWithValidFields();
      },
      act: (b) => b.add(const SignInEvent.submitted()),
      skip: 3,
      expect: () => [
        isA<SignInState>()
            .having(
              (s) => s.submissionStatus,
              'submissionStatus',
              SignInSubmissionStatus.submitting,
            )
            .having((s) => s.failure, 'failure', null)
            .having((s) => s.userSession, 'userSession', null),
        isA<SignInState>().having(
          (s) => s.submissionStatus,
          'submissionStatus',
          SignInSubmissionStatus.failure,
        ),
      ],
    );

    blocTest<SignInBloc, SignInState>(
      'emits failure with invalidCredentials on auth error',
      build: () {
        when(
          () => mockAuthenticate(
            email: any(named: 'email'),
            password: any(named: 'password'),
            tenancyName: any(named: 'tenancyName'),
          ),
        ).thenAnswer(
          (_) async => const Left(AuthFailure.invalidCredentials()),
        );
        return buildWithValidFields();
      },
      act: (b) => b.add(const SignInEvent.submitted()),
      skip: 3,
      expect: () => [
        isA<SignInState>().having(
          (s) => s.submissionStatus,
          'submissionStatus',
          SignInSubmissionStatus.submitting,
        ),
        isA<SignInState>()
            .having(
              (s) => s.submissionStatus,
              'submissionStatus',
              SignInSubmissionStatus.failure,
            )
            .having(
              (s) => s.failure,
              'failure',
              const AuthFailure.invalidCredentials(),
            ),
      ],
      verify: (_) => verifyNever(() => mockGetCurrentSession()),
    );

    blocTest<SignInBloc, SignInState>(
      'emits success even when session fetch fails after auth succeeds',
      build: () {
        when(
          () => mockAuthenticate(
            email: any(named: 'email'),
            password: any(named: 'password'),
            tenancyName: any(named: 'tenancyName'),
          ),
        ).thenAnswer((_) async => const Right(_testToken));
        when(() => mockGetCurrentSession()).thenAnswer(
          (_) async =>
              const Left(AuthFailure.generic(Failure.network())),
        );
        return buildWithValidFields();
      },
      act: (b) => b.add(const SignInEvent.submitted()),
      skip: 3,
      expect: () => [
        isA<SignInState>().having(
          (s) => s.submissionStatus,
          'submissionStatus',
          SignInSubmissionStatus.submitting,
        ),
        isA<SignInState>()
            .having(
              (s) => s.submissionStatus,
              'submissionStatus',
              SignInSubmissionStatus.success,
            )
            .having((s) => s.userSession, 'userSession', null),
      ],
    );

    blocTest<SignInBloc, SignInState>(
      'droppable: second submit while first is in progress is ignored',
      build: () {
        when(
          () => mockAuthenticate(
            email: any(named: 'email'),
            password: any(named: 'password'),
            tenancyName: any(named: 'tenancyName'),
          ),
        ).thenAnswer((_) async => const Right(_testToken));
        when(() => mockGetCurrentSession())
            .thenAnswer((_) async => const Right(_testSession));
        return buildWithValidFields();
      },
      act: (b) {
        b
          ..add(const SignInEvent.submitted())
          ..add(const SignInEvent.submitted());
      },
      skip: 3,
      verify: (_) => verify(
        () => mockAuthenticate(
          email: any(named: 'email'),
          password: any(named: 'password'),
          tenancyName: any(named: 'tenancyName'),
        ),
      ).called(1),
    );
  });

  group('SignInReset', () {
    blocTest<SignInBloc, SignInState>(
      'resets all state to initial after valid fields have been entered',
      build: () => _buildBloc(
        authenticate: mockAuthenticate,
        getCurrentSession: mockGetCurrentSession,
      ),
      act: (b) => b
        ..add(const SignInEvent.workspaceChanged('mycompany'))
        ..add(const SignInEvent.emailChanged('user@example.com'))
        ..add(const SignInEvent.passwordChanged('secret'))
        ..add(const SignInEvent.reset()),
      skip: 3,
      expect: () => [
        isA<SignInState>()
            .having((s) => s.workspace.isValid, 'workspace.isValid', false)
            .having((s) => s.email.isValid, 'email.isValid', false)
            .having((s) => s.password.isValid, 'password.isValid', false)
            .having(
              (s) => s.submissionStatus,
              'submissionStatus',
              SignInSubmissionStatus.idle,
            )
            .having((s) => s.failure, 'failure', null)
            .having((s) => s.userSession, 'userSession', null)
            .having((s) => s.obscurePassword, 'obscurePassword', true),
      ],
    );
  });
}
