// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSessionResultDto _$UserSessionResultDtoFromJson(
  Map<String, dynamic> json,
) => _UserSessionResultDto(
  user: json['user'] == null
      ? null
      : SessionUserDto.fromJson(json['user'] as Map<String, dynamic>),
  tenant: json['tenant'] == null
      ? null
      : SessionTenantDto.fromJson(json['tenant'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserSessionResultDtoToJson(
  _UserSessionResultDto instance,
) => <String, dynamic>{'user': instance.user, 'tenant': instance.tenant};

_SessionUserDto _$SessionUserDtoFromJson(Map<String, dynamic> json) =>
    _SessionUserDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      surname: json['surname'] as String,
      userName: json['userName'] as String,
      emailAddress: json['emailAddress'] as String,
    );

Map<String, dynamic> _$SessionUserDtoToJson(_SessionUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'userName': instance.userName,
      'emailAddress': instance.emailAddress,
    };

_SessionTenantDto _$SessionTenantDtoFromJson(Map<String, dynamic> json) =>
    _SessionTenantDto(
      id: (json['id'] as num).toInt(),
      tenancyName: json['tenancyName'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SessionTenantDtoToJson(_SessionTenantDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenancyName': instance.tenancyName,
      'name': instance.name,
    };
