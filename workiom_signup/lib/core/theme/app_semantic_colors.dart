import 'package:flutter/material.dart';
import 'package:workiom_signup/core/theme/app_colors.dart';

@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.primaryDisabled,
    required this.arrowBox,
    required this.textTertiary,
    required this.textWarning,
    required this.strengthTrack,
    required this.strengthWeak,
    required this.strengthStrong,
    required this.iconMuted,
    required this.ruleFailed,
    required this.inputUnderline,
    required this.googleButtonSurface,
    required this.googleButtonOnSurface,
    required this.errorBanner,
  });

  static const light = AppSemanticColors(
    primaryDisabled: AppColors.primaryDisabled,
    arrowBox: AppColors.arrowBox,
    textTertiary: AppColors.textTertiary,
    textWarning: AppColors.textWarning,
    strengthTrack: AppColors.strengthTrack,
    strengthWeak: AppColors.strengthWeak,
    strengthStrong: AppColors.strengthStrong,
    iconMuted: AppColors.iconMuted,
    ruleFailed: Color(0xFFFF776E),
    inputUnderline: AppColors.underline,
    googleButtonSurface: Color(0xFFFFFFFF),
    googleButtonOnSurface: Color(0xFF1F1F1F),
    errorBanner: AppColors.errorBanner,
  );

  static const dark = AppSemanticColors(
    primaryDisabled: Color(0xFF3A3A4E),
    arrowBox: Color(0xFF3A3A4A),
    textTertiary: Color(0xFF9CA3AF),
    textWarning: Color(0xFF9CA3AF),
    strengthTrack: Color(0xFF2A2A3E),
    strengthWeak: AppColors.strengthWeak,
    strengthStrong: AppColors.strengthStrong,
    iconMuted: Color(0xFF6B7280),
    ruleFailed: Color(0xFFFF776E),
    inputUnderline: Color(0xFF3F3F55),
    googleButtonSurface: Color(0xFFFFFFFF),
    googleButtonOnSurface: Color(0xFF1F1F1F),
    errorBanner: AppColors.errorBanner,
  );

  final Color primaryDisabled;
  final Color arrowBox;
  final Color textTertiary;
  final Color textWarning;
  final Color strengthTrack;
  final Color strengthWeak;
  final Color strengthStrong;
  final Color iconMuted;
  final Color ruleFailed;
  final Color inputUnderline;
  final Color googleButtonSurface;
  final Color googleButtonOnSurface;
  final Color errorBanner;

  @override
  AppSemanticColors copyWith({
    Color? primaryDisabled,
    Color? arrowBox,
    Color? textTertiary,
    Color? textWarning,
    Color? strengthTrack,
    Color? strengthWeak,
    Color? strengthStrong,
    Color? iconMuted,
    Color? ruleFailed,
    Color? inputUnderline,
    Color? googleButtonSurface,
    Color? googleButtonOnSurface,
    Color? errorBanner,
  }) =>
      AppSemanticColors(
        primaryDisabled: primaryDisabled ?? this.primaryDisabled,
        arrowBox: arrowBox ?? this.arrowBox,
        textTertiary: textTertiary ?? this.textTertiary,
        textWarning: textWarning ?? this.textWarning,
        strengthTrack: strengthTrack ?? this.strengthTrack,
        strengthWeak: strengthWeak ?? this.strengthWeak,
        strengthStrong: strengthStrong ?? this.strengthStrong,
        iconMuted: iconMuted ?? this.iconMuted,
        ruleFailed: ruleFailed ?? this.ruleFailed,
        inputUnderline: inputUnderline ?? this.inputUnderline,
        googleButtonSurface: googleButtonSurface ?? this.googleButtonSurface,
        googleButtonOnSurface:
            googleButtonOnSurface ?? this.googleButtonOnSurface,
        errorBanner: errorBanner ?? this.errorBanner,
      );

  @override
  AppSemanticColors lerp(AppSemanticColors? other, double t) {
    if (other == null) return this;
    return AppSemanticColors(
      primaryDisabled: Color.lerp(primaryDisabled, other.primaryDisabled, t)!,
      arrowBox: Color.lerp(arrowBox, other.arrowBox, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textWarning: Color.lerp(textWarning, other.textWarning, t)!,
      strengthTrack: Color.lerp(strengthTrack, other.strengthTrack, t)!,
      strengthWeak: Color.lerp(strengthWeak, other.strengthWeak, t)!,
      strengthStrong: Color.lerp(strengthStrong, other.strengthStrong, t)!,
      iconMuted: Color.lerp(iconMuted, other.iconMuted, t)!,
      ruleFailed: Color.lerp(ruleFailed, other.ruleFailed, t)!,
      inputUnderline: Color.lerp(inputUnderline, other.inputUnderline, t)!,
      googleButtonSurface:
          Color.lerp(googleButtonSurface, other.googleButtonSurface, t)!,
      googleButtonOnSurface:
          Color.lerp(googleButtonOnSurface, other.googleButtonOnSurface, t)!,
      errorBanner: Color.lerp(errorBanner, other.errorBanner, t)!,
    );
  }
}
