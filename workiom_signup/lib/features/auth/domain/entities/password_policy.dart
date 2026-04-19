import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_policy.freezed.dart';

@freezed
abstract class PasswordPolicy with _$PasswordPolicy {
  const factory PasswordPolicy({
    required int requiredLength,
    required bool requireUppercase,
    required bool requireLowercase,
    required bool requireDigit,
    required bool requireNonAlphanumeric,
  }) = _PasswordPolicy;
}
