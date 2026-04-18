import 'package:dartz/dartz.dart';
import 'package:workiom_signup/features/auth/domain/entities/auth_token.dart';
import 'package:workiom_signup/features/auth/domain/entities/edition.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/entities/registered_tenant.dart';
import 'package:workiom_signup/features/auth/domain/entities/user_session.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/person_name.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_availability.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';

abstract class AuthRepository {
  Stream<AuthStatus> get authStatus;

  Future<Either<AuthFailure, UserSession?>> getCurrentSession();

  Future<Either<AuthFailure, List<Edition>>> getEditions();

  Future<Either<AuthFailure, PasswordPolicy>> getPasswordPolicy();

  Future<Either<AuthFailure, TenantAvailabilityStatus>> checkTenantAvailable(
    TenantName name,
  );

  Future<Either<AuthFailure, RegisteredTenant>> registerTenant({
    required EmailAddress email,
    required Password password,
    required TenantName tenantName,
    required PersonName firstName,
    required PersonName lastName,
    required int editionId,
  });

  Future<Either<AuthFailure, AuthToken>> authenticate({
    required EmailAddress email,
    required Password password,
    required TenantName tenancyName,
  });
}

enum AuthStatus { authenticated, unauthenticated }
