import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';

part 'password_policy_dto.freezed.dart';
part 'password_policy_dto.g.dart';

@freezed
abstract class PasswordPolicyResultDto with _$PasswordPolicyResultDto {
  const factory PasswordPolicyResultDto({
    required PasswordPolicyDto setting,
  }) = _PasswordPolicyResultDto;

  factory PasswordPolicyResultDto.fromJson(Map<String, dynamic> json) =>
      _$PasswordPolicyResultDtoFromJson(json);
}

@freezed
abstract class PasswordPolicyDto with _$PasswordPolicyDto {
  const factory PasswordPolicyDto({
    @Default(false) bool requireDigit,
    @Default(false) bool requireLowercase,
    @Default(false) bool requireNonAlphanumeric,
    @Default(false) bool requireUppercase,
    @Default(8) int requiredLength,
  }) = _PasswordPolicyDto;

  factory PasswordPolicyDto.fromJson(Map<String, dynamic> json) =>
      _$PasswordPolicyDtoFromJson(json);
}

extension PasswordPolicyDtoMapper on PasswordPolicyDto {
  PasswordPolicy toDomain() => PasswordPolicy(
        requiredLength: requiredLength,
        requireUppercase: requireUppercase,
        requireLowercase: requireLowercase,
        requireDigit: requireDigit,
        requireNonAlphanumeric: requireNonAlphanumeric,
      );
}
