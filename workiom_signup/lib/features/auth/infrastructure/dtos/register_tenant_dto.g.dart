// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_tenant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterTenantRequestDto _$RegisterTenantRequestDtoFromJson(
  Map<String, dynamic> json,
) => _RegisterTenantRequestDto(
  tenancyName: json['tenancyName'] as String,
  name: json['name'] as String,
  adminEmailAddress: json['adminEmailAddress'] as String,
  adminFirstName: json['adminFirstName'] as String,
  adminLastName: json['adminLastName'] as String,
  adminPassword: json['adminPassword'] as String,
  editionId: (json['editionId'] as num).toInt(),
  captchaResponse: json['captchaResponse'] as String?,
);

Map<String, dynamic> _$RegisterTenantRequestDtoToJson(
  _RegisterTenantRequestDto instance,
) => <String, dynamic>{
  'tenancyName': instance.tenancyName,
  'name': instance.name,
  'adminEmailAddress': instance.adminEmailAddress,
  'adminFirstName': instance.adminFirstName,
  'adminLastName': instance.adminLastName,
  'adminPassword': instance.adminPassword,
  'editionId': instance.editionId,
  'captchaResponse': instance.captchaResponse,
};

_RegisterTenantResponseDto _$RegisterTenantResponseDtoFromJson(
  Map<String, dynamic> json,
) => _RegisterTenantResponseDto(
  tenantId: (json['tenantId'] as num?)?.toInt(),
  isActive: json['isActive'] as bool? ?? false,
  isPending: json['isPending'] as bool? ?? false,
);

Map<String, dynamic> _$RegisterTenantResponseDtoToJson(
  _RegisterTenantResponseDto instance,
) => <String, dynamic>{
  'tenantId': instance.tenantId,
  'isActive': instance.isActive,
  'isPending': instance.isPending,
};
