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
  );

  static const dark = AppSemanticColors(
    primaryDisabled: AppColors.primaryDisabled,
    arrowBox: Color(0xFF3A3A4A),
    textTertiary: Color(0xFF9CA3AF),
    textWarning: Color(0xFF9CA3AF),
    strengthTrack: Color(0xFF2A2A3E),
    strengthWeak: AppColors.strengthWeak,
    strengthStrong: AppColors.strengthStrong,
    iconMuted: Color(0xFF6B7280),
    ruleFailed: Color(0xFFFF776E),
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
    );
  }
}
