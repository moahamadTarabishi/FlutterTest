// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthenticateRequestDto _$AuthenticateRequestDtoFromJson(
  Map<String, dynamic> json,
) => _AuthenticateRequestDto(
  userNameOrEmailAddress: json['userNameOrEmailAddress'] as String,
  password: json['password'] as String,
  tenancyName: json['tenantName'] as String,
  ianaTimeZone: json['ianaTimeZone'] as String,
  rememberClient: json['rememberClient'] as bool? ?? false,
  twoFactorVerificationCode: json['twoFactorVerificationCode'] as String?,
  captchaResponse: json['captchaResponse'] as String?,
  singleSignIn: json['singleSignIn'] as bool? ?? false,
  returnUrl: json['returnUrl'] as String?,
);

Map<String, dynamic> _$AuthenticateRequestDtoToJson(
  _AuthenticateRequestDto instance,
) => <String, dynamic>{
  'userNameOrEmailAddress': instance.userNameOrEmailAddress,
  'password': instance.password,
  'tenantName': instance.tenancyName,
  'ianaTimeZone': instance.ianaTimeZone,
  'rememberClient': instance.rememberClient,
  'twoFactorVerificationCode': instance.twoFactorVerificationCode,
  'captchaResponse': instance.captchaResponse,
  'singleSignIn': instance.singleSignIn,
  'returnUrl': instance.returnUrl,
};

_AuthenticateResponseDto _$AuthenticateResponseDtoFromJson(
  Map<String, dynamic> json,
) => _AuthenticateResponseDto(
  accessToken: json['accessToken'] as String?,
  encryptedAccessToken: json['encryptedAccessToken'] as String?,
  expireInSeconds: (json['expireInSeconds'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
);

Map<String, dynamic> _$AuthenticateResponseDtoToJson(
  _AuthenticateResponseDto instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'encryptedAccessToken': instance.encryptedAccessToken,
  'expireInSeconds': instance.expireInSeconds,
  'userId': instance.userId,
};
