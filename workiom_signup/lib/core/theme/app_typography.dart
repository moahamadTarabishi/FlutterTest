import 'package:flutter/material.dart';

abstract final class AppTypography {
  static const _family = 'Rubik';

  static TextTheme textTheme(
    Color onSurface,
    Color onSurfaceMuted,
  ) =>
      TextTheme(
        // Page titles — Rubik 22/w500
        headlineMedium: TextStyle(
          fontFamily: _family,
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: onSurface,
          height: 28 / 22,
          letterSpacing: 0.35,
        ),
        // Subtitles — Rubik 17/w400
        titleLarge: TextStyle(
          fontFamily: _family,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: onSurfaceMuted,
          height: 22 / 17,
          letterSpacing: -0.408,
        ),
        // Body / field input text — Rubik 15/w400
        bodyLarge: TextStyle(
          fontFamily: _family,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: onSurface,
          height: 24 / 15,
          letterSpacing: -0.24,
        ),
        // Placeholders / muted body — Rubik 15/w400
        bodyMedium: TextStyle(
          fontFamily: _family,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: onSurfaceMuted,
          height: 24 / 15,
          letterSpacing: -0.24,
        ),
        // Buttons & summary — Rubik 15/w500
        labelLarge: TextStyle(
          fontFamily: _family,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: onSurface,
          height: 21 / 15,
          letterSpacing: -0.32,
        ),
        // Rule lines, "Or", language — Rubik 12/w400
        bodySmall: TextStyle(
          fontFamily: _family,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: onSurfaceMuted,
          height: 16 / 12,
        ),
        // Terms/privacy footer — Rubik 13/w400
        labelMedium: TextStyle(
          fontFamily: _family,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: onSurfaceMuted,
          height: 18 / 13,
          letterSpacing: -0.078,
        ),
      );
}
