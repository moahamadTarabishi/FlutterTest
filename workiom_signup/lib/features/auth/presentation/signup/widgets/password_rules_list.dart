import 'package:flutter/material.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/features/auth/domain/entities/password_policy.dart';
import 'package:workiom_signup/features/auth/domain/value_objects/password.dart';

class PasswordRulesList extends StatelessWidget {
  const PasswordRulesList({
    required this.input,
    required this.policy,
    super.key,
  });

  final String input;
  final PasswordPolicy policy;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final results = Password.ruleResults(input, policy);

    if (results.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: results.entries.map((e) {
        final passed = e.value;
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            children: [
              Icon(
                passed ? Icons.check_circle : Icons.radio_button_unchecked,
                size: 16,
                color: passed ? cs.primary : cs.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Text(
                _ruleLabel(e.key, l10n, policy),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: passed ? cs.onSurface : cs.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _ruleLabel(
    PasswordRule rule,
    AppLocalizations l10n,
    PasswordPolicy policy,
  ) =>
      switch (rule) {
        PasswordRule.minLength =>
          l10n.passwordRuleMinLength(policy.requiredLength),
        PasswordRule.uppercase => l10n.passwordRuleUppercase,
        PasswordRule.lowercase => l10n.passwordRuleLowercase,
        PasswordRule.digit => l10n.passwordRuleDigit,
        PasswordRule.special => l10n.passwordRuleSpecial,
      };
}
