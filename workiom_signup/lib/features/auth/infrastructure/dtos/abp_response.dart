import 'package:freezed_annotation/freezed_annotation.dart';

part 'abp_response.freezed.dart';
part 'abp_response.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class AbpResponse<T> with _$AbpResponse<T> {
  const factory AbpResponse({
    T? result,
    required bool success,
    AbpError? error,
    @JsonKey(name: 'unAuthorizedRequest')
    @Default(false)
    bool unauthorizedRequest,
  }) = _AbpResponse<T>;

  factory AbpResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$AbpResponseFromJson(json, fromJsonT);
}

@freezed
abstract class AbpError with _$AbpError {
  const factory AbpError({
    int? code,
    String? message,
    String? details,
  }) = _AbpError;

  factory AbpError.fromJson(Map<String, dynamic> json) =>
      _$AbpErrorFromJson(json);
}
