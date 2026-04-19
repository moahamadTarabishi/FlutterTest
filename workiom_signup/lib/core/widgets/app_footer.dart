import 'package:flutter/material.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.stayOrganized,
          style: tt.bodyMedium,
        ),
        const SizedBox(width: 6),
        AppIcon(Assets.icons.icWorkiom, color: cs.primary),
        Text(
          'workiom',
          style: tt.bodyLarge?.copyWith(
            color: cs.primary,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}
