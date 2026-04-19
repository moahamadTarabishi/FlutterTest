import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workiom_signup/core/theme/app_colors.dart';
import 'package:workiom_signup/core/theme/app_semantic_colors.dart';
import 'package:workiom_signup/core/theme/app_typography.dart';

abstract final class AppTheme {
  static ThemeData light() => _base(
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onSurface: AppColors.textPrimary,
          onSurfaceVariant: AppColors.textSecondary,
          outline: AppColors.underline,
          error: AppColors.error,
          errorContainer: Color(0xFFFEE2E2),
          onErrorContainer: Color(0xFFB91C1C),
          surfaceTint: Colors.transparent,
        ),
        scaffoldBackgroundColor: AppColors.surface,
        semanticColors: AppSemanticColors.light,
      );

  static ThemeData dark() => _base(
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          onPrimary: AppColors.white,
          surface: AppColors.darkSurface,
          onSurface: AppColors.darkTextPrimary,
          onSurfaceVariant: AppColors.darkTextSecondary,
          outline: AppColors.darkBorder,
          error: AppColors.error,
          onError: AppColors.white,
          errorContainer: Color(0xFF3A1F22),
          onErrorContainer: Color(0xFFFCA5A5),
          surfaceTint: Colors.transparent,
        ),
        scaffoldBackgroundColor: AppColors.darkBackground,
        semanticColors: AppSemanticColors.dark,
      );

  static ThemeData _base({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required AppSemanticColors semanticColors,
  }) {
    final textTheme = AppTypography.textTheme(
      colorScheme.onSurface,
      colorScheme.onSurfaceVariant,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      textTheme: textTheme,
      extensions: [semanticColors],
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colorScheme.outline),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
        space: 1,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        isDense: true,
        contentPadding: const EdgeInsetsDirectional.only(bottom: 8, top: 8),
        hintStyle: textTheme.bodyMedium,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: semanticColors.inputUnderline),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: semanticColors.inputUnderline),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.surface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        systemOverlayStyle: colorScheme.brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
