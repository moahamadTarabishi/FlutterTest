// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AbpResponse<T> _$AbpResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _AbpResponse<T>(
  success: json['success'] as bool,
  result: _$nullableGenericFromJson(json['result'], fromJsonT),
  error: json['error'] == null
      ? null
      : AbpError.fromJson(json['error'] as Map<String, dynamic>),
  unauthorizedRequest: json['unAuthorizedRequest'] as bool? ?? false,
);

Map<String, dynamic> _$AbpResponseToJson<T>(
  _AbpResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'success': instance.success,
  'result': _$nullableGenericToJson(instance.result, toJsonT),
  'error': instance.error,
  'unAuthorizedRequest': instance.unauthorizedRequest,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

_AbpError _$AbpErrorFromJson(Map<String, dynamic> json) => _AbpError(
  code: (json['code'] as num?)?.toInt(),
  message: json['message'] as String?,
  details: json['details'] as String?,
);

Map<String, dynamic> _$AbpErrorToJson(_AbpError instance) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'details': instance.details,
};
