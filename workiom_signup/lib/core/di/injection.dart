import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:workiom_signup/core/constants/api_constants.dart';
import 'package:workiom_signup/core/network/dio_client.dart';
import 'package:workiom_signup/core/network/interceptors/auth_interceptor.dart';
import 'package:workiom_signup/core/network/interceptors/error_interceptor.dart';
import 'package:workiom_signup/core/network/interceptors/logging_interceptor.dart';
import 'package:workiom_signup/core/storage/secure_storage.dart';
import 'package:workiom_signup/features/auth/domain/repositories/auth_repository.dart';
import 'package:workiom_signup/features/auth/domain/usecases/authenticate.dart';
import 'package:workiom_signup/features/auth/domain/usecases/check_tenant_available.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_current_session.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_editions.dart';
import 'package:workiom_signup/features/auth/domain/usecases/get_password_policy.dart';
import 'package:workiom_signup/features/auth/domain/usecases/register_and_authenticate.dart';
import 'package:workiom_signup/features/auth/domain/usecases/register_tenant.dart';
import 'package:workiom_signup/features/auth/infrastructure/datasources/auth_remote_datasource.dart';
import 'package:workiom_signup/features/auth/infrastructure/repositories/auth_repository_impl.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Storage — SecureStorage first (AuthInterceptor depends on it)
  getIt.registerLazySingleton<SecureStorage>(
    () => const SecureStorage(FlutterSecureStorage()),
  );

  // Network — AuthInterceptor → Dio (ordered per DI graph in Appendix B)
  getIt.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(getIt()),
  );

  getIt.registerLazySingleton(
    () => DioClient.create(
      baseUrl: ApiConstants.baseUrl,
      interceptors: [
        getIt<AuthInterceptor>(),
        LoggingInterceptor(),
        ErrorInterceptor(),
      ],
    ),
  );

  // Datasource
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      datasource: getIt(),
      secureStorage: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetCurrentSession(getIt()));
  getIt.registerLazySingleton(() => GetEditions(getIt()));
  getIt.registerLazySingleton(() => GetPasswordPolicy(getIt()));
  getIt.registerLazySingleton(() => CheckTenantAvailable(getIt()));
  getIt.registerLazySingleton(() => RegisterTenant(getIt()));
  getIt.registerLazySingleton(() => Authenticate(getIt()));
  getIt.registerLazySingleton(
    () => RegisterAndAuthenticate(
      registerTenant: getIt(),
      authenticate: getIt(),
      getCurrentSession: getIt(),
    ),
  );

  // BLoC — factory (fresh instance per /signup shell)
  getIt.registerFactory<SignUpBloc>(
    () => SignUpBloc(
      getEditions: getIt(),
      getPasswordPolicy: getIt(),
      checkTenantAvailable: getIt(),
      registerAndAuthenticate: getIt(),
    ),
  );
}
