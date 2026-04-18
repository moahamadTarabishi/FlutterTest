import 'package:dio/dio.dart';
import 'package:workiom_signup/core/storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._storage);

  final SecureStorage _storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.readAuthToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
