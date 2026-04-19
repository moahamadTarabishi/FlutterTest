import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
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

part 'signup_bloc.freezed.dart';
part 'signup_event.dart';
part 'signup_state.dart';

EventTransformer<T> _debounce<T>(Duration duration) =>
    (events, mapper) => events.debounceTime(duration).switchMap(mapper);

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required GetEditions getEditions,
    required GetPasswordPolicy getPasswordPolicy,
    required CheckTenantAvailable checkTenantAvailable,
    required RegisterAndAuthenticate registerAndAuthenticate,
  })  : _getEditions = getEditions,
        _getPasswordPolicy = getPasswordPolicy,
        _checkTenantAvailable = checkTenantAvailable,
        _registerAndAuthenticate = registerAndAuthenticate,
        super(const SignUpState()) {
    on<SignUpStarted>(_onStarted);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpTenantNameChanged>(
      _onTenantNameChanged,
      transformer: _debounce(const Duration(milliseconds: 500)),
    );
    on<SignUpFirstNameChanged>(_onFirstNameChanged);
    on<SignUpLastNameChanged>(_onLastNameChanged);
    on<SignUpEditionSelected>(_onEditionSelected);
    on<SignUpSubmitted>(_onSubmitted, transformer: droppable());
  }

  final GetEditions _getEditions;
  final GetPasswordPolicy _getPasswordPolicy;
  final CheckTenantAvailable _checkTenantAvailable;
  final RegisterAndAuthenticate _registerAndAuthenticate;

  Future<void> _onStarted(
    SignUpStarted event,
    Emitter<SignUpState> emit,
  ) async {
    final editionsResult = await _getEditions();
    final policyResult = await _getPasswordPolicy();

    var editions = const <Edition>[];
    PasswordPolicy? policy;
    var bootFailed = false;

    editionsResult.fold(
      (_) => bootFailed = true,
      (list) => editions = list,
    );
    policyResult.fold(
      (_) => bootFailed = true,
      (p) => policy = p,
    );

    emit(
      state.copyWith(
        editions: editions,
        passwordPolicy: policy,
        selectedEditionId: editions.isNotEmpty ? editions.first.id : null,
        bootFailed: bootFailed,
      ),
    );
  }

  void _onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(email: EmailAddress(event.email)));
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final policy = state.passwordPolicy;
    if (policy == null) return;
    emit(state.copyWith(password: Password(event.password, policy)));
  }

  Future<void> _onTenantNameChanged(
    SignUpTenantNameChanged event,
    Emitter<SignUpState> emit,
  ) async {
    final name = TenantName(event.tenantName);
    emit(
      state.copyWith(
        tenantName: name,
        tenantAvailability: TenantAvailability.unknown,
      ),
    );

    if (!name.isValid) return;

    emit(state.copyWith(tenantAvailability: TenantAvailability.checking));
    final result = await _checkTenantAvailable(name);
    result.fold(
      (_) => emit(
        state.copyWith(tenantAvailability: TenantAvailability.unknown),
      ),
      (status) => emit(
        state.copyWith(
          tenantAvailability: status == TenantAvailabilityStatus.available
              ? TenantAvailability.available
              : TenantAvailability.taken,
        ),
      ),
    );
  }

  void _onFirstNameChanged(
    SignUpFirstNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(firstName: PersonName(event.firstName)));
  }

  void _onLastNameChanged(
    SignUpLastNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(lastName: PersonName(event.lastName)));
  }

  void _onEditionSelected(
    SignUpEditionSelected event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(selectedEditionId: event.editionId));
  }

  Future<void> _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    final editionId = state.selectedEditionId;
    if (editionId == null) return;

    emit(
      state.copyWith(
        submissionStatus: SubmissionStatus.submitting,
        failure: null,
      ),
    );

    final result = await _registerAndAuthenticate(
      email: state.email,
      password: state.password,
      tenantName: state.tenantName,
      firstName: state.firstName,
      lastName: state.lastName,
      editionId: editionId,
    );

    result.fold(
      (f) => emit(
        state.copyWith(
          submissionStatus: SubmissionStatus.failure,
          failure: f,
        ),
      ),
      (session) => emit(
        state.copyWith(
          submissionStatus: SubmissionStatus.success,
          userSession: session,
        ),
      ),
    );
  }
}
