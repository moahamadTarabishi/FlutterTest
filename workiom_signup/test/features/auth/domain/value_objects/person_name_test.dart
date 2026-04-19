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

    test('hyphen allowed (Anne-Marie)', () {
      expect(PersonName('Anne-Marie').isValid, isTrue);
    });

    test("apostrophe allowed (O'Brien)", () {
      expect(PersonName("O'Brien").isValid, isTrue);
    });

    test('spaces allowed (Mary Ann)', () {
      expect(PersonName('Mary Ann').isValid, isTrue);
    });

    test('trims whitespace before validation', () {
      expect(PersonName('  John  ').getOrCrash(), 'John');
    });
  });
}
