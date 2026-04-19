import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand
  static const primary = Color(0xFF4E86F7);
  static const primaryDisabled = Color(0xFFB5B5B5);
  static const arrowBox = Color(0xFFECECEC);

  // Text
  static const textPrimary = Color(0xFF0E0F12);
  static const textSecondary = Color(0xFF555555);
  static const textTertiary = Color(0xFF747474);
  static const textWarning = Color(0xFF373737);

  // Lines & surfaces
  static const surface = Color(0xFFFFFFFF);
  static const underline = Color(0xFFD6D6D6);
  static const strengthTrack = Color(0xFFF4F4F4);
  static const strengthWeak = Color(0xFFF5C044);
  static const strengthStrong = Color(0xFF5BD77E);
  static const iconMuted = Color(0xFFB7B7B7);

  // Semantic
  static const error = Color(0xFFEF4444);
  static const errorBanner = Color(0xFFD63B70);
  static const white = Color(0xFFFFFFFF);

  // Dark mode
  static const darkBackground = Color(0xFF0F0F1A);
  static const darkSurface = Color(0xFF1A1A2E);
  static const darkTextPrimary = Color(0xFFF5F5F7);
  static const darkTextSecondary = Color(0xFF9CA3AF);
  static const darkBorder = Color(0xFF2A2A3E);
}
