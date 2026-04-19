import 'package:flutter/material.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';

class TermsPrivacyFooter extends StatelessWidget {
  const TermsPrivacyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tt = Theme.of(context).textTheme;
    final base = tt.labelMedium;
    final link = base?.copyWith(
      decoration: TextDecoration.underline,
      decorationColor: base.color,
    );

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Text.rich(
      TextSpan(
        style: base,
        children: [
          TextSpan(text: '${l10n.bySigningUp} '),
          TextSpan(text: l10n.termsOfService, style: link),
          TextSpan(text: ' ${l10n.and} '),
          TextSpan(text: l10n.privacyPolicy, style: link),
        ],
      ),
      textAlign: TextAlign.center,
    )
    );
  }
}
