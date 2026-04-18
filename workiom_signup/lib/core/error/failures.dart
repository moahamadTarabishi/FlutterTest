import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network() = NetworkFailure;
  const factory Failure.timeout() = TimeoutFailure;
  const factory Failure.server({
    required int code,
    String? message,
    Map<String, List<String>>? validationErrors,
  }) = ServerFailure;
  const factory Failure.unauthorized() = UnauthorizedFailure;
  const factory Failure.unknown() = UnknownFailure;
}
