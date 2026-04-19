import 'package:flutter/material.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tt = Theme.of(context).textTheme;

    return Row(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(l10n.orDivider, style: tt.bodySmall),
        ),
        const Spacer()
      ],
    );
  }
}
