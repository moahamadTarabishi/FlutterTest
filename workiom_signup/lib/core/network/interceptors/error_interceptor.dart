import 'package:dio/dio.dart';
import 'package:workiom_signup/core/error/failures.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final failure = switch (err.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        const Failure.timeout(),
      DioExceptionType.connectionError => const Failure.network(),
      DioExceptionType.badResponse when err.response?.statusCode == 401 =>
        const Failure.unauthorized(),
      DioExceptionType.badResponse => Failure.server(
          code: err.response?.statusCode ?? 0,
          message: _extractAbpMessage(err.response?.data),
          validationErrors: _extractValidationErrors(err.response?.data),
        ),
      _ => const Failure.unknown(),
    };

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: failure,
      ),
    );
  }

  static String? _extractAbpMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      final error = data['error'];
      if (error is Map<String, dynamic>) {
        return error['message'] as String?;
      }
    }
    return null;
  }

  static Map<String, List<String>>? _extractValidationErrors(dynamic data) {
    if (data is Map<String, dynamic>) {
      final error = data['error'];
      if (error is Map<String, dynamic>) {
        final errors = error['validationErrors'];
        if (errors is List) {
          final result = <String, List<String>>{};
          for (final e in errors) {
            if (e is Map<String, dynamic>) {
              final members = e['members'] as List?;
              final message = e['message'] as String?;
              if (members != null && message != null) {
                for (final m in members) {
                  final key = m as String;
                  result.putIfAbsent(key, () => []).add(message);
                }
              }
            }
          }
          return result.isEmpty ? null : result;
        }
      }
    }
    return null;
  }
}
