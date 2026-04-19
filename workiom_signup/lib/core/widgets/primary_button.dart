import 'package:flutter/material.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/theme/app_colors.dart';
import 'package:workiom_signup/core/theme/app_semantic_colors.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.fillColor,
    this.labelColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? fillColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final sem = Theme.of(context).extension<AppSemanticColors>()!;
    final tt = Theme.of(context).textTheme;

    final isEnabled = onPressed != null && !isLoading;
    final bgColor = fillColor ?? (isEnabled ? cs.primary : sem.primaryDisabled);
    final textColor = labelColor ?? AppColors.white;

    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            if (isLoading)
              Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: textColor,
                  ),
                ),
              )
            else
              Center(
                child: Text(
                  label,
                  style: tt.labelLarge?.copyWith(color: textColor),
                ),
              ),
            PositionedDirectional(
              end: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: AppIcon(
                  Assets.icons.icReturnArrow,
                  size: 16
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
