import 'package:flutter/material.dart';

abstract final class AppTypography {
  static const _family = 'Inter';

  static TextTheme textTheme(Color onSurface, Color onSurfaceMuted) => TextTheme(
        displayLarge: TextStyle(
          fontFamily: _family,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: onSurface,
          height: 1.2,
        ),
        titleLarge: TextStyle(
          fontFamily: _family,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: onSurface,
          height: 1.3,
        ),
        bodyLarge: TextStyle(
          fontFamily: _family,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: onSurface,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontFamily: _family,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: onSurfaceMuted,
          height: 1.5,
        ),
        labelLarge: TextStyle(
          fontFamily: _family,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: onSurface,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontFamily: _family,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: onSurfaceMuted,
          height: 1.4,
        ),
      );
}
