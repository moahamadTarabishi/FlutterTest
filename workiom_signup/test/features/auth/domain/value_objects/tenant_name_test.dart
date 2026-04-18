import 'package:flutter_test/flutter_test.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/tenant_name.dart';

void main() {
  group('TenantName', () {
    test('pure() is invalid', () {
      expect(const TenantName.pure().isValid, isFalse);
    });

    test('lowercases input before validation', () {
      expect(TenantName('MyCompany').getOrCrash(), 'mycompany');
    });

    test('valid lowercase name is valid', () {
      expect(TenantName('acme-corp').isValid, isTrue);
    });

    test('starts with digit is invalid', () {
      expect(TenantName('1invalid').isValid, isFalse);
    });

    test('single char is too short', () {
      expect(TenantName('a').isValid, isFalse);
    });

    test('64 chars is too long', () {
      expect(TenantName('a' * 64).isValid, isFalse);
    });

    test('63 chars is valid', () {
      expect(TenantName('a' * 63).isValid, isTrue);
    });

    test('spaces are invalid', () {
      expect(TenantName('my company').isValid, isFalse);
    });
  });
}
