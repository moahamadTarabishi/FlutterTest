import 'package:dartz/dartz.dart';
import 'package:workiom_signup/core/error/failures.dart';
import 'package:workiom_signup/features/auth/domain/entities/user_session.dart';
import 'package:workiom_signup/features/auth/domain/failures/auth_failure.dart';
import 'package:workiom_signup/features/auth/domain/usecases/authenticate.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_current_session.dart';
import 'package:workiom_signup/features/auth/domain/usecases/register_tenant.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/person_name.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';

class RegisterAndAuthenticate {
  RegisterAndAuthenticate({
    required RegisterTenant registerTenant,
    required Authenticate authenticate,
    required GetCurrentSession getCurrentSession,
  })  : _registerTenant = registerTenant,
        _authenticate = authenticate,
        _getCurrentSession = getCurrentSession;

  final RegisterTenant _registerTenant;
  final Authenticate _authenticate;
  final GetCurrentSession _getCurrentSession;

  Future<Either<AuthFailure, UserSession>> call({
    required EmailAddress email,
    required Password password,
    required TenantName tenantName,
    required PersonName firstName,
    required PersonName lastName,
    required int editionId,
  }) async {
    final registered = await _registerTenant(
      email: email,
      password: password,
      tenantName: tenantName,
      firstName: firstName,
      lastName: lastName,
      editionId: editionId,
    );

    return registered.fold(
      left,
      (_) async {
        final authed = await _authenticate(
          email: email,
          password: password,
          tenancyName: tenantName,
        );
        return authed.fold(
          left,
          (_) async {
            final session = await _getCurrentSession();
            return session.fold(
              left,
              (s) => s == null
                  ? left(const AuthFailure.generic(Failure.unknown()))
                  : right(s),
            );
          },
        );
      },
    );
  }
}
