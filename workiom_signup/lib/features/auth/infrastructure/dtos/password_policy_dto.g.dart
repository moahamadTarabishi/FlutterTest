// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_policy_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PasswordPolicyResultDto _$PasswordPolicyResultDtoFromJson(
  Map<String, dynamic> json,
) => _PasswordPolicyResultDto(
  setting: PasswordPolicyDto.fromJson(json['setting'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PasswordPolicyResultDtoToJson(
  _PasswordPolicyResultDto instance,
) => <String, dynamic>{'setting': instance.setting};

_PasswordPolicyDto _$PasswordPolicyDtoFromJson(Map<String, dynamic> json) =>
    _PasswordPolicyDto(
      requireDigit: json['requireDigit'] as bool? ?? false,
      requireLowercase: json['requireLowercase'] as bool? ?? false,
      requireNonAlphanumeric: json['requireNonAlphanumeric'] as bool? ?? false,
      requireUppercase: json['requireUppercase'] as bool? ?? false,
      requiredLength: (json['requiredLength'] as num?)?.toInt() ?? 8,
    );

Map<String, dynamic> _$PasswordPolicyDtoToJson(_PasswordPolicyDto instance) =>
    <String, dynamic>{
      'requireDigit': instance.requireDigit,
      'requireLowercase': instance.requireLowercase,
      'requireNonAlphanumeric': instance.requireNonAlphanumeric,
      'requireUppercase': instance.requireUppercase,
      'requiredLength': instance.requiredLength,
    };
