import 'package:flutter/material.dart';
import 'package:workiom_signup/core/theme/app_semantic_colors.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';

const Duration _kBarDuration = Duration(milliseconds: 220);
const Curve _kMotionCurve = Curves.easeOutCubic;

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
    final reduce = MediaQuery.disableAnimationsOf(context);
    final dur = reduce ? Duration.zero : _kBarDuration;

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
              color: sem.strengthTrack,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: fillFraction),
            duration: dur,
            curve: _kMotionCurve,
            builder: (ctx, value, _) => FractionallySizedBox(
              widthFactor: value,
              child: AnimatedContainer(
                duration: dur,
                curve: _kMotionCurve,
                decoration: BoxDecoration(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
