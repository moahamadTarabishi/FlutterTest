import 'package:flutter_test/flutter_test.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/person_name.dart';

void main() {
  group('PersonName', () {
    test('pure() is invalid', () {
      expect(const PersonName.pure().isValid, isFalse);
    });

    test('latin letters valid', () {
      expect(PersonName('John').isValid, isTrue);
    });

    test('unicode letters valid (María)', () {
      expect(PersonName('María').isValid, isTrue);
    });

    test('digits rejected', () {
      expect(PersonName('A1ex').isValid, isFalse);
    });

    test('hyphen rejected', () {
      expect(PersonName('Jean-Luc').isValid, isFalse);
    });

    test("apostrophe rejected", () {
      expect(PersonName("O'Brien").isValid, isFalse);
    });

    test('spaces rejected', () {
      expect(PersonName('John Doe').isValid, isFalse);
    });

    test('trims whitespace before validation', () {
      expect(PersonName('  John  ').getOrCrash(), 'John');
    });
  });
}
