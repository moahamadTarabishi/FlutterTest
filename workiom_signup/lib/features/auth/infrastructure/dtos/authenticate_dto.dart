import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workiom_signup/features/auth/domain/entities/auth_token.dart';

part 'authenticate_dto.freezed.dart';
part 'authenticate_dto.g.dart';

@freezed
abstract class AuthenticateRequestDto with _$AuthenticateRequestDto {
  const factory AuthenticateRequestDto({
    required String userNameOrEmailAddress,
    required String password,
    // Workiom's API expects `tenantName` here, unlike IsTenantAvailable and
    // RegisterTenant which both use `tenancyName`. Sending `tenancyName`
    // returns 401 from /api/TokenAuth/Authenticate.
    @JsonKey(name: 'tenantName') required String tenancyName,
    // ianaTimeZone goes in body (RegisterTenant uses ?timeZone= query param)
    required String ianaTimeZone,
    @Default(false) bool rememberClient,
    String? twoFactorVerificationCode,
    String? captchaResponse,
    @Default(false) bool singleSignIn,
    String? returnUrl,
  }) = _AuthenticateRequestDto;

  factory AuthenticateRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateRequestDtoFromJson(json);
}

@freezed
abstract class AuthenticateResponseDto with _$AuthenticateResponseDto {
  const factory AuthenticateResponseDto({
    String? accessToken,
    String? encryptedAccessToken,
    int? expireInSeconds,
    int? userId,
  }) = _AuthenticateResponseDto;

  factory AuthenticateResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateResponseDtoFromJson(json);
}

extension AuthenticateResponseDtoMapper on AuthenticateResponseDto {
  AuthToken toDomain() => AuthToken(
        accessToken: accessToken ?? '',
        expireInSeconds: expireInSeconds,
      );
}
