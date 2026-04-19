import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:workiom_signup/core/constants/api_constants.dart';
import 'package:workiom_signup/core/l10n/locale_cubit.dart';
import 'package:workiom_signup/core/network/dio_client.dart';
import 'package:workiom_signup/core/network/interceptors/auth_interceptor.dart';
import 'package:workiom_signup/core/network/interceptors/error_interceptor.dart';
import 'package:workiom_signup/core/storage/secure_storage.dart';
import 'package:workiom_signup/core/theme/cubit/theme_cubit.dart';
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
import 'package:workiom_signup/features/auth/presentation/login/bloc/sign_in_bloc.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  getIt
    // Storage — SecureStorage first (AuthInterceptor depends on it)
    ..registerLazySingleton<SecureStorage>(
      () => const SecureStorage(FlutterSecureStorage()),
    )
    // Network — AuthInterceptor → Dio (ordered per DI graph)
    ..registerLazySingleton<AuthInterceptor>(
      () => AuthInterceptor(getIt()),
    )
    ..registerLazySingleton(
      () => DioClient.create(
        baseUrl: ApiConstants.baseUrl,
        interceptors: [
          getIt<AuthInterceptor>(),
          if (kDebugMode)
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
            ),
          ErrorInterceptor(),
        ],
      ),
    )
    // Datasource
    ..registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasource(getIt()),
    )
    // Repository
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        datasource: getIt(),
        secureStorage: getIt(),
      ),
    )
    // Use cases
    ..registerLazySingleton(() => GetCurrentSession(getIt()))
    ..registerLazySingleton(() => GetEditions(getIt()))
    ..registerLazySingleton(() => GetPasswordPolicy(getIt()))
    ..registerLazySingleton(() => CheckTenantAvailable(getIt()))
    ..registerLazySingleton(() => RegisterTenant(getIt()))
    ..registerLazySingleton(() => Authenticate(getIt()))
    ..registerLazySingleton(
      () => RegisterAndAuthenticate(
        registerTenant: getIt(),
        authenticate: getIt(),
        getCurrentSession: getIt(),
      ),
    )
    // Theme — singleton for app lifetime
    ..registerLazySingleton<ThemeCubit>(() => ThemeCubit(getIt()))
    // Locale — singleton for app lifetime
    ..registerLazySingleton<LocaleCubit>(LocaleCubit.new)
    // BLoC — factory (fresh instance per /signup shell)
    ..registerFactory<SignUpBloc>(
      () => SignUpBloc(
        getEditions: getIt(),
        getPasswordPolicy: getIt(),
        checkTenantAvailable: getIt(),
        registerAndAuthenticate: getIt(),
      ),
    )
    // BLoC — factory (fresh instance per /login shell)
    ..registerFactory<SignInBloc>(
      () => SignInBloc(
        authenticate: getIt(),
        getCurrentSession: getIt(),
      ),
    );
}
