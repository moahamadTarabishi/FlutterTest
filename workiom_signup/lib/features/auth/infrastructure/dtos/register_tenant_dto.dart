import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workiom_signup/features/auth/domain/entities/registered_tenant.dart';

part 'register_tenant_dto.freezed.dart';
part 'register_tenant_dto.g.dart';

@freezed
abstract class RegisterTenantRequestDto with _$RegisterTenantRequestDto {
  const factory RegisterTenantRequestDto({
    required String tenancyName,
    required String name,
    required String adminEmailAddress,
    required String adminFirstName,
    required String adminLastName,
    required String adminPassword,
    required int editionId,
    // Must be present and null — ABP rejects the request if omitted entirely.
    String? captchaResponse,
  }) = _RegisterTenantRequestDto;

  factory RegisterTenantRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterTenantRequestDtoFromJson(json);
}

@freezed
abstract class RegisterTenantResponseDto with _$RegisterTenantResponseDto {
  const factory RegisterTenantResponseDto({
    int? tenantId,
    @Default(false) bool isActive,
    @Default(false) bool isPending,
  }) = _RegisterTenantResponseDto;

  factory RegisterTenantResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterTenantResponseDtoFromJson(json);
}

extension RegisterTenantResponseDtoMapper on RegisterTenantResponseDto {
  RegisteredTenant toDomain() => RegisteredTenant(
        tenantId: tenantId,
        isPending: isPending,
      );
}
