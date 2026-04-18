import 'package:flutter/material.dart';
import 'package:workiom_signup/core/theme/app_colors.dart';
import 'package:workiom_signup/core/theme/app_typography.dart';

abstract final class AppTheme {
  static ThemeData light() => _base(
        colorScheme: const ColorScheme.light(
          primary: AppColors.brandPrimary,
          onPrimary: AppColors.white,
          secondary: AppColors.brandAccent,
          surface: AppColors.lightSurface,
          onSurface: AppColors.lightTextPrimary,
          onSurfaceVariant: AppColors.lightTextSecondary,
          outline: AppColors.lightBorder,
          surfaceContainerHighest: AppColors.lightBorder,
          error: AppColors.error,
          onError: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.lightBackground,
      );

  static ThemeData dark() => _base(
        colorScheme: const ColorScheme.dark(
          primary: AppColors.brandPrimary,
          onPrimary: AppColors.white,
          secondary: AppColors.brandAccent,
          surface: AppColors.darkSurface,
          onSurface: AppColors.darkTextPrimary,
          onSurfaceVariant: AppColors.darkTextSecondary,
          outline: AppColors.darkBorder,
          surfaceContainerHighest: AppColors.darkBorder,
          error: AppColors.error,
          onError: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.darkBackground,
      );

  static ThemeData _base({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
  }) =>
      ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: AppTypography.textTheme(
          colorScheme.onSurface,
          colorScheme.onSurfaceVariant,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colorScheme.surface,
          contentPadding: const EdgeInsetsDirectional.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorScheme.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorScheme.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorScheme.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorScheme.error, width: 1.5),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            disabledBackgroundColor: colorScheme.outline,
            disabledForegroundColor: colorScheme.onSurfaceVariant,
            elevation: 0,
            textStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(color: colorScheme.outline),
            foregroundColor: colorScheme.onSurface,
            textStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: scaffoldBackgroundColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
          iconTheme: IconThemeData(color: colorScheme.onSurface),
        ),
      );
}
