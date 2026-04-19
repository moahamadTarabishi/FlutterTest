import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workiom_signup/features/auth/domain/entities/user_session.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/usecases/authenticate.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_current_session.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required Authenticate authenticate,
    required GetCurrentSession getCurrentSession,
  })  : _authenticate = authenticate,
        _getCurrentSession = getCurrentSession,
        super(const SignInState()) {
    on<SignInStarted>(_onStarted);
    on<SignInWorkspaceChanged>(_onWorkspaceChanged);
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<SignInSubmitted>(_onSubmitted, transformer: droppable());
    on<SignInReset>((_, emit) => emit(const SignInState()));
  }

  final Authenticate _authenticate;
  final GetCurrentSession _getCurrentSession;

  void _onStarted(SignInStarted event, Emitter<SignInState> emit) {}

  void _onWorkspaceChanged(
    SignInWorkspaceChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(workspace: TenantName(event.tenantName)));
  }

  void _onEmailChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(email: EmailAddress(event.email)));
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(password: Password.signIn(event.password)));
  }

  void _onPasswordVisibilityToggled(
    SignInPasswordVisibilityToggled event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  Future<void> _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    if (!state.workspace.isValid ||
        !state.email.isValid ||
        !state.password.isValid) {
      return;
    }

    emit(
      state.copyWith(
        submissionStatus: SignInSubmissionStatus.submitting,
        failure: null,
        userSession: null,
      ),
    );

    final tokenResult = await _authenticate(
      email: state.email,
      password: state.password,
      tenancyName: state.workspace,
    );

    await tokenResult.fold(
      (f) async => emit(
        state.copyWith(
          submissionStatus: SignInSubmissionStatus.failure,
          failure: f,
        ),
      ),
      (_) async {
        final sessionResult = await _getCurrentSession();
        sessionResult.fold(
          (_) => emit(
            state.copyWith(
              submissionStatus: SignInSubmissionStatus.success,
            ),
          ),
          (session) => emit(
            state.copyWith(
              submissionStatus: SignInSubmissionStatus.success,
              userSession: session,
            ),
          ),
        );
      },
    );
  }
}
