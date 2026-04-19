import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/theme/app_semantic_colors.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final sem = Theme.of(context).extension<AppSemanticColors>()!;
    final tt = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {}, // stub
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: sem.googleButtonSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: cs.outline),
              ),
            ),
            Align(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.icons.icGoogle,
                    width: 18,
                    height: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.continueWithGoogle,
                    style: tt.labelLarge?.copyWith(
                      color: sem.googleButtonOnSurface,
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              end: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: AppIcon(
                  Assets.icons.icArrowRight,
                  size: 16,
                  color: sem.googleButtonOnSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
