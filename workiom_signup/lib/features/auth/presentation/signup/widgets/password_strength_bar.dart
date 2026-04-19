import 'package:flutter/material.dart';
import 'package:workiom_signup/core/theme/app_colors.dart';
import 'package:workiom_signup/core/theme/app_semantic_colors.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';

class PasswordStrengthBar extends StatelessWidget {
  const PasswordStrengthBar({
    required this.input,
    required this.policy,
    super.key,
  });

  final String input;
  final PasswordPolicy policy;

  @override
  Widget build(BuildContext context) {
    final sem = Theme.of(context).extension<AppSemanticColors>()!;
    final results = Password.ruleResults(input, policy);
    final total = results.length;
    final passed = results.values.where((v) => v).length;

    Color fillColor;
    double fillFraction;

    if (passed == 0) {
      fillFraction = 0;
      fillColor = sem.strengthWeak;
    } else if (passed < total) {
      fillFraction = passed / total;
      fillColor = sem.strengthWeak;
    } else {
      fillFraction = 1;
      fillColor = sem.strengthStrong;
    }

    return SizedBox(
      height: 7,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.strengthTrack,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          if (fillFraction > 0)
            FractionallySizedBox(
              widthFactor: fillFraction,
              child: Container(
                decoration: BoxDecoration(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
