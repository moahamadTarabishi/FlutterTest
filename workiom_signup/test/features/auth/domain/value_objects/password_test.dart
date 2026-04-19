import 'package:flutter_test/flutter_test.dart';
import 'package:workiom_signup/core/utils/value_failures.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';

const _minimal = PasswordPolicy(
  requiredLength: 6,
  requireUppercase: false,
  requireLowercase: false,
  requireDigit: false,
  requireNonAlphanumeric: false,
);

const _full = PasswordPolicy(
  requiredLength: 8,
  requireUppercase: true,
  requireLowercase: true,
  requireDigit: true,
  requireNonAlphanumeric: true,
);

void main() {
  group('Password.pure()', () {
    test('is invalid', () {
      expect(const Password.pure().isValid, isFalse);
    });

    test('has empty failure', () {
      const Password.pure().value.fold(
        (f) => expect(f, isA<ValueFailureEmpty<String>>()),
        (_) => fail('expected Left'),
      );
    });
  });

  group('Password validation — minimal policy', () {
    test('empty input returns empty failure', () {
      Password('', _minimal).value.fold(
        (f) => expect(f, isA<ValueFailureEmpty<String>>()),
        (_) => fail('expected Left'),
      );
    });

    test('meets required length is valid', () {
      expect(Password('abcdef', _minimal).isValid, isTrue);
    });

    test('shorter than required length is invalid', () {
      expect(Password('abc', _minimal).isValid, isFalse);
    });
  });

  group('Password validation — full policy', () {
    test('satisfies all rules is valid', () {
      expect(Password('Test1234!', _full).isValid, isTrue);
    });

    test('missing uppercase is invalid', () {
      expect(Password('test1234!', _full).isValid, isFalse);
    });

    test('missing lowercase is invalid', () {
      expect(Password('TEST1234!', _full).isValid, isFalse);
    });

    test('missing digit is invalid', () {
      expect(Password('TestAbcd!', _full).isValid, isFalse);
    });

    test('missing special character is invalid', () {
      expect(Password('Test1234', _full).isValid, isFalse);
    });

    test('too short is invalid even if all other rules pass', () {
      expect(Password('Te1!', _full).isValid, isFalse);
    });
  });

  group('Password.passes() static helper', () {
    test('returns true when all rules satisfied', () {
      expect(Password.passes('Test1234!', _full), isTrue);
    });

    test('returns false when any rule fails', () {
      expect(Password.passes('test1234!', _full), isFalse);
    });
  });

  group('Password.ruleResults() live checklist', () {
    test('only includes rules the policy enables', () {
      final results = Password.ruleResults('abc', _minimal);
      expect(results.containsKey(PasswordRule.minLength), isTrue);
      expect(results.containsKey(PasswordRule.uppercase), isFalse);
      expect(results.containsKey(PasswordRule.digit), isFalse);
    });

    test('minLength passes when input meets required length', () {
      final results = Password.ruleResults('abcdef', _minimal);
      expect(results[PasswordRule.minLength], isTrue);
    });

    test('minLength fails when input is too short', () {
      final results = Password.ruleResults('abc', _minimal);
      expect(results[PasswordRule.minLength], isFalse);
    });

    test('all rules pass for a strong password', () {
      final results = Password.ruleResults('Test1234!', _full);
      expect(results.values, everyElement(isTrue));
    });

    test('uppercase rule reflects presence of capital letter', () {
      final withUpper = Password.ruleResults('Test1234!', _full);
      final withoutUpper = Password.ruleResults('test1234!', _full);
      expect(withUpper[PasswordRule.uppercase], isTrue);
      expect(withoutUpper[PasswordRule.uppercase], isFalse);
    });

    test('special rule reflects presence of non-alphanumeric char', () {
      final withSpecial = Password.ruleResults('Test1234!', _full);
      final withoutSpecial = Password.ruleResults('Test1234', _full);
      expect(withSpecial[PasswordRule.special], isTrue);
      expect(withoutSpecial[PasswordRule.special], isFalse);
    });
  });

  group('Password.signIn factory', () {
    test('empty input is invalid with ValueFailureEmpty', () {
      final p = Password.signIn('');
      expect(p.isValid, isFalse);
      p.value.fold(
        (f) => expect(f, isA<ValueFailureEmpty<String>>()),
        (_) => fail('expected failure'),
      );
    });

    test('single character is valid (no policy enforced)', () {
      expect(Password.signIn('a').isValid, isTrue);
    });

    test('typical password is valid regardless of complexity', () {
      expect(Password.signIn('password').isValid, isTrue);
    });
  });
}
