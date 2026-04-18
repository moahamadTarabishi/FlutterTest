// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_availability_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenantAvailabilityDto _$TenantAvailabilityDtoFromJson(
  Map<String, dynamic> json,
) => _TenantAvailabilityDto(
  tenantId: (json['tenantId'] as num?)?.toInt(),
  state: (json['state'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TenantAvailabilityDtoToJson(
  _TenantAvailabilityDto instance,
) => <String, dynamic>{'tenantId': instance.tenantId, 'state': instance.state};
