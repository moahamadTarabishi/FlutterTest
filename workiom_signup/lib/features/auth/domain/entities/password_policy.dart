import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_policy.freezed.dart';

@freezed
abstract class PasswordPolicy with _$PasswordPolicy {
  const factory PasswordPolicy({
    @Default(8) int requiredLength,
    @Default(false) bool requireUppercase,
    @Default(false) bool requireLowercase,
    @Default(false) bool requireDigit,
    @Default(false) bool requireNonAlphanumeric,
  }) = _PasswordPolicy;

  static const defaultPolicy = PasswordPolicy();
}
