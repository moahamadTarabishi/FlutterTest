import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workiom_signup/core/storage/secure_storage.dart';
import 'package:workiom_signup/core/theme/cubit/theme_cubit.dart';

class _MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  late _MockSecureStorage mockStorage;

  setUp(() {
    mockStorage = _MockSecureStorage();
  });

  group('ThemeCubit — initial state', () {
    test('starts with ThemeMode.system before hydration completes', () async {
      when(() => mockStorage.readThemeMode())
          .thenAnswer((_) async => null);
      final cubit = ThemeCubit(mockStorage);
      expect(cubit.state, ThemeMode.system);
      await cubit.close();
    });

    blocTest<ThemeCubit, ThemeMode>(
      'emits persisted mode after hydration when storage has a value',
      build: () {
        when(() => mockStorage.readThemeMode())
            .thenAnswer((_) async => 'dark');
        return ThemeCubit(mockStorage);
      },
      act: (_) {},
      wait: const Duration(milliseconds: 50),
      expect: () => [ThemeMode.dark],
    );

    blocTest<ThemeCubit, ThemeMode>(
      'emits nothing extra when storage returns null',
      build: () {
        when(() => mockStorage.readThemeMode())
            .thenAnswer((_) async => null);
        return ThemeCubit(mockStorage);
      },
      act: (_) {},
      wait: const Duration(milliseconds: 50),
      expect: () => <ThemeMode>[],
    );

    blocTest<ThemeCubit, ThemeMode>(
      'falls back to ThemeMode.system for unknown stored value',
      build: () {
        when(() => mockStorage.readThemeMode())
            .thenAnswer((_) async => 'unknown_value');
        return ThemeCubit(mockStorage);
      },
      act: (_) {},
      wait: const Duration(milliseconds: 50),
      expect: () => [ThemeMode.system],
    );
  });

  group('ThemeCubit — setMode', () {
    blocTest<ThemeCubit, ThemeMode>(
      'emits ThemeMode.dark and persists when setMode(dark) called',
      build: () {
        when(() => mockStorage.readThemeMode())
            .thenAnswer((_) async => null);
        when(
          () => mockStorage.writeThemeMode('dark'),
        ).thenAnswer((_) async {});
        return ThemeCubit(mockStorage);
      },
      act: (cubit) => cubit.setMode(ThemeMode.dark),
      wait: const Duration(milliseconds: 50),
      expect: () => [ThemeMode.dark],
      verify: (_) =>
          verify(() => mockStorage.writeThemeMode('dark')).called(1),
    );

    blocTest<ThemeCubit, ThemeMode>(
      'emits ThemeMode.light and persists when setMode(light) called',
      build: () {
        when(() => mockStorage.readThemeMode())
            .thenAnswer((_) async => null);
        when(
          () => mockStorage.writeThemeMode('light'),
        ).thenAnswer((_) async {});
        return ThemeCubit(mockStorage);
      },
      act: (cubit) => cubit.setMode(ThemeMode.light),
      wait: const Duration(milliseconds: 50),
      expect: () => [ThemeMode.light],
      verify: (_) =>
          verify(() => mockStorage.writeThemeMode('light')).called(1),
    );

    blocTest<ThemeCubit, ThemeMode>(
      'emits ThemeMode.system and persists when setMode(system) called',
      build: () {
        when(() => mockStorage.readThemeMode())
            .thenAnswer((_) async => 'dark');
        when(
          () => mockStorage.writeThemeMode('system'),
        ).thenAnswer((_) async {});
        return ThemeCubit(mockStorage);
      },
      seed: () => ThemeMode.dark,
      act: (cubit) => cubit.setMode(ThemeMode.system),
      wait: const Duration(milliseconds: 50),
      expect: () => [ThemeMode.system],
      verify: (_) =>
          verify(() => mockStorage.writeThemeMode('system')).called(1),
    );
  });
}
