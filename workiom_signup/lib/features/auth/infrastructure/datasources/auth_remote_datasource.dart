import 'package:dio/dio.dart';
import 'package:workiom_signup/core/constants/api_constants.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/abp_response.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/authenticate_dto.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/edition_dto.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/password_policy_dto.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/register_tenant_dto.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/tenant_availability_dto.dart';
import 'package:workiom_signup/features/auth/infrastructure/dtos/user_session_dto.dart';

class AuthRemoteDatasource {
  AuthRemoteDatasource(this._dio);

  final Dio _dio;

  Future<UserSessionResultDto> getCurrentLoginInformations() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.getCurrentLoginInformations,
    );
    final envelope = AbpResponse<UserSessionResultDto>.fromJson(
      response.data!,
      (json) => UserSessionResultDto.fromJson(json! as Map<String, dynamic>),
    );
    return envelope.result ?? const UserSessionResultDto();
  }

  Future<EditionsResultDto> getEditionsForSelect() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.getEditionsForSelect,
    );
    final envelope = AbpResponse<EditionsResultDto>.fromJson(
      response.data!,
      (json) => EditionsResultDto.fromJson(json! as Map<String, dynamic>),
    );
    return envelope.result ?? const EditionsResultDto();
  }

  Future<PasswordPolicyResultDto> getPasswordComplexitySetting() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.getPasswordComplexitySetting,
    );
    final envelope = AbpResponse<PasswordPolicyResultDto>.fromJson(
      response.data!,
      (json) => PasswordPolicyResultDto.fromJson(json! as Map<String, dynamic>),
    );
    final result = envelope.result;
    if (result == null) {
      throw StateError('GetPasswordComplexitySetting returned no result');
    }
    return result;
  }

  Future<TenantAvailabilityDto> isTenantAvailable(String tenancyName) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiConstants.isTenantAvailable,
      data: {'tenancyName': tenancyName},
    );
    final envelope = AbpResponse<TenantAvailabilityDto>.fromJson(
      response.data!,
      (json) => TenantAvailabilityDto.fromJson(json! as Map<String, dynamic>),
    );
    return envelope.result ?? const TenantAvailabilityDto();
  }

  Future<RegisterTenantResponseDto> registerTenant(
    RegisterTenantRequestDto request, {
    required String timeZone,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiConstants.registerTenant,
      queryParameters: {'timeZone': timeZone},
      data: request.toJson(),
    );
    final envelope = AbpResponse<RegisterTenantResponseDto>.fromJson(
      response.data!,
      (json) =>
          RegisterTenantResponseDto.fromJson(json! as Map<String, dynamic>),
    );
    return envelope.result ?? const RegisterTenantResponseDto();
  }

  Future<AuthenticateResponseDto> authenticate(
    AuthenticateRequestDto request,
  ) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiConstants.authenticate,
      data: request.toJson(),
    );
    final envelope = AbpResponse<AuthenticateResponseDto>.fromJson(
      response.data!,
      (json) =>
          AuthenticateResponseDto.fromJson(json! as Map<String, dynamic>),
    );
    return envelope.result ?? const AuthenticateResponseDto();
  }
}
