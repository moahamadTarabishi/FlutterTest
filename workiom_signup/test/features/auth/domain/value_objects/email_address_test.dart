import 'package:flutter_test/flutter_test.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/email_address.dart';

void main() {
  group('EmailAddress', () {
    test('pure() is invalid', () {
      expect(const EmailAddress.pure().isValid, isFalse);
    });

    test('valid email returns right', () {
      expect(EmailAddress('user@example.com').isValid, isTrue);
    });

    test('no @ returns left', () {
      expect(EmailAddress('notanemail').isValid, isFalse);
    });

    test('empty string returns empty failure', () {
      expect(EmailAddress('').isValid, isFalse);
    });

    test('getOrCrash returns value for valid email', () {
      expect(EmailAddress('a@b.com').getOrCrash(), 'a@b.com');
    });
  });
}
