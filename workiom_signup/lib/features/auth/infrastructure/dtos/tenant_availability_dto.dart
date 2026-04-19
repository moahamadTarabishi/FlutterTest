import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_availability.dart';

part 'tenant_availability_dto.freezed.dart';
part 'tenant_availability_dto.g.dart';

@freezed
abstract class TenantAvailabilityDto with _$TenantAvailabilityDto {
  const factory TenantAvailabilityDto({
    int? tenantId,
    @Default(0) int state,
  }) = _TenantAvailabilityDto;

  factory TenantAvailabilityDto.fromJson(Map<String, dynamic> json) =>
      _$TenantAvailabilityDtoFromJson(json);
}

extension TenantAvailabilityDtoMapper on TenantAvailabilityDto {
  // Per PDF: tenantId == null means available, regardless of state value.
  TenantAvailabilityStatus toDomain() =>
      tenantId == null
          ? TenantAvailabilityStatus.available
          : TenantAvailabilityStatus.taken;
}
