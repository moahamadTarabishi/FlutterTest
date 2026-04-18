import 'package:dio/dio.dart';
import 'package:workiom_signup/core/constants/api_constants.dart';

abstract final class DioClient {
  static Dio create({
    required String baseUrl,
    required List<Interceptor> interceptors,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {'Content-Type': 'application/json'},
      ),
    );
    dio.interceptors.addAll(interceptors);
    return dio;
  }
}
