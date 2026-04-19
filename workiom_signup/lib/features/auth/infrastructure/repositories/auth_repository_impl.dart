import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:workiom_signup/core/error/failures.dart';
import 'package:workiom_signup/core/storage/secure_storage.dart';
import 'package:workiom_signup/features/auth/domain/entities/auth_token.dart';
import 'package:workiom_signup/features/auth/domain/entities/edition.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/entities/registered_tenant.dart';
import 'package:workiom_signup/features/auth/domain/entities/user_session.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/person_name.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_availability.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';
import 'package:workiom_signup/features/auth/infrastructure/datasources/auth_remote_datasource.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/authenticate_dto.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/edition_dto.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/password_policy_dto.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/register_tenant_dto.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/tenant_availability_dto.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/user_session_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDatasource datasource,
    required SecureStorage secureStorage,
  })  : _datasource = datasource,
        _secureStorage = secureStorage;

  final AuthRemoteDatasource _datasource;
  final SecureStorage _secureStorage;

  final _authStatusController =
      StreamController<AuthStatus>.broadcast();

  @override
  Stream<AuthStatus> get authStatus => _authStatusController.stream;

  @override
  Future<Either<AuthFailure, UserSession?>> getCurrentSession() =>
      _run(() async {
        final dto = await _datasource.getCurrentLoginInformations();
        return dto.toDomain();
      });

  @override
  Future<Either<AuthFailure, List<Edition>>> getEditions() =>
      _run(() async {
        final dto = await _datasource.getEditionsForSelect();
        return dto.editionsWithFeatures
            .map((e) => e.edition.toDomain())
            .where((e) => e.isRegistrable)
            .toList();
      });

  @override
  Future<Either<AuthFailure, PasswordPolicy>> getPasswordPolicy() =>
      _run(() async {
        final dto = await _datasource.getPasswordComplexitySetting();
        return dto.setting.toDomain();
      });

  @override
  Future<Either<AuthFailure, TenantAvailabilityStatus>> checkTenantAvailable(
    TenantName name,
  ) =>
      _run(() async {
        final dto =
            await _datasource.isTenantAvailable(name.getOrCrash());
        return dto.toDomain();
      });

  @override
  Future<Either<AuthFailure, RegisteredTenant>> registerTenant({
    required EmailAddress email,
    required Password password,
    required TenantName tenantName,
    required PersonName firstName,
    required PersonName lastName,
    required int editionId,
  }) =>
      _run(() async {
        final slug = tenantName.getOrCrash();
        final request = RegisterTenantRequestDto(
          tenancyName: slug,
          name: slug,
          adminEmailAddress: email.getOrCrash(),
          adminFirstName: firstName.getOrCrash(),
          adminLastName: lastName.getOrCrash(),
          adminPassword: password.getOrCrash(),
          editionId: editionId,
        );
        final timeZone = await FlutterTimezone.getLocalTimezone();
        final dto = await _datasource.registerTenant(
          request,
          timeZone: timeZone,
        );
        return dto.toDomain();
      });

  @override
  Future<Either<AuthFailure, AuthToken>> authenticate({
    required EmailAddress email,
    required Password password,
    required TenantName tenancyName,
  }) =>
      _run(() async {
        final timeZone = await FlutterTimezone.getLocalTimezone();
        final request = AuthenticateRequestDto(
          userNameOrEmailAddress: email.getOrCrash(),
          password: password.getOrCrash(),
          tenancyName: tenancyName.getOrCrash(),
          ianaTimeZone: timeZone,
        );
        final dto = await _datasource.authenticate(request);
        final token = dto.toDomain();
        // Persist before returning — BLoC/orchestrator never sees the raw token.
        await _secureStorage.writeAuthToken(token.accessToken);
        _authStatusController.add(AuthStatus.authenticated);
        return token;
      });

  /// Wraps async DTO calls and maps DioException into the appropriate
  /// [AuthFailure].
  Future<Either<AuthFailure, T>> _run<T>(
    Future<T> Function() action,
  ) async {
    try {
      return right(await action());
    } on DioException catch (e) {
      return left(_mapDioException(e));
    } on Object catch (_) {
      return left(const AuthFailure.generic(Failure.unknown()));
    }
  }

  AuthFailure _mapDioException(DioException e) {
    final failure = e.error;

    if (failure is UnauthorizedFailure) {
      return const AuthFailure.invalidCredentials();
    }

    if (failure is ServerFailure) {
      // HTTP 409 or ABP duplicate-tenancy error code.
      if (e.response?.statusCode == 409 ||
          (failure.code == 400 &&
              failure.message?.toLowerCase().contains('taken') == true)) {
        return const AuthFailure.tenantTaken();
      }

      final validationErrors = failure.validationErrors;
      if (validationErrors != null && validationErrors.isNotEmpty) {
        // Flatten → first error per field.
        return AuthFailure.validation({
          for (final entry in validationErrors.entries)
            entry.key: entry.value.first,
        });
      }

      return AuthFailure.generic(failure);
    }

    if (failure is Failure) {
      return AuthFailure.generic(failure);
    }

    return const AuthFailure.generic(Failure.unknown());
  }
}
