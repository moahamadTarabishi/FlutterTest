import 'package:dartz/dartz.dart';
import 'package:workiom_signup/core/domain/value_object.dart';
import 'package:workiom_signup/core/utils/value_failures.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';

class Password extends ValueObject<String> {
  factory Password(String input, PasswordPolicy policy) =>
      Password._(_validate(input, policy));

  const Password._(this.value);

  const Password.pure()
      : value = const Left(ValueFailure<String>.empty());

  @override
  final Either<ValueFailure<String>, String> value;

  static Either<ValueFailure<String>, String> _validate(
    String input,
    PasswordPolicy policy,
  ) {
    if (input.isEmpty) return const Left(ValueFailure.empty());
    if (!passes(input, policy)) {
      return const Left(ValueFailure.weakPassword());
    }
    return Right(input);
  }

  static bool passes(String input, PasswordPolicy policy) {
    if (input.length < policy.requiredLength) return false;
    if (policy.requireUppercase && !input.contains(RegExp('[A-Z]'))) {
      return false;
    }
    if (policy.requireLowercase && !input.contains(RegExp('[a-z]'))) {
      return false;
    }
    if (policy.requireDigit && !input.contains(RegExp('[0-9]'))) return false;
    if (policy.requireNonAlphanumeric &&
        !input.contains(RegExp('[^A-Za-z0-9]'))) {
      return false;
    }
    return true;
  }

  /// Returns rule-level pass/fail for the live checklist UI.
  static Map<PasswordRule, bool> ruleResults(
    String input,
    PasswordPolicy policy,
  ) =>
      {
        if (policy.requiredLength > 0)
          PasswordRule.minLength: input.length >= policy.requiredLength,
        if (policy.requireUppercase)
          PasswordRule.uppercase: input.contains(RegExp('[A-Z]')),
        if (policy.requireLowercase)
          PasswordRule.lowercase: input.contains(RegExp('[a-z]')),
        if (policy.requireDigit)
          PasswordRule.digit: input.contains(RegExp('[0-9]')),
        if (policy.requireNonAlphanumeric)
          PasswordRule.special: input.contains(RegExp('[^A-Za-z0-9]')),
      };
}

enum PasswordRule { minLength, uppercase, lowercase, digit, special }
