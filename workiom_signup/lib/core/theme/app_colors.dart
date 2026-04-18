import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand
  static const brandPrimary = Color(0xFF4F6AF5);
  static const brandAccent = Color(0xFFFF7B54);

  // Light theme
  static const lightBackground = Color(0xFFFFFFFF);
  static const lightSurface = Color(0xFFF8F9FB);
  static const lightSurfaceField = Color(0xFFF3F4F6);
  static const lightTextPrimary = Color(0xFF111827);
  static const lightTextSecondary = Color(0xFF6B7280);
  static const lightBorder = Color(0xFFE5E7EB);

  // Dark theme
  static const darkBackground = Color(0xFF0F0F1A);
  static const darkSurface = Color(0xFF1A1A2E);
  static const darkSurfaceField = Color(0xFF252538);
  static const darkTextPrimary = Color(0xFFF5F5F7);
  static const darkTextSecondary = Color(0xFF9CA3AF);
  static const darkBorder = Color(0xFF2A2A3E);

  // Semantic (shared)
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const white = Color(0xFFFFFFFF);
}
