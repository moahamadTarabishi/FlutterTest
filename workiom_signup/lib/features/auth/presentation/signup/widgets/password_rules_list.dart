import 'package:flutter/material.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/theme/app_semantic_colors.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';
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
    final sem = Theme.of(context).extension<AppSemanticColors>()!;
    final tt = Theme.of(context).textTheme;
    final results = Password.ruleResults(input, policy);

    if (results.isEmpty) return const SizedBox.shrink();

    final allPassed = results.values.every((v) => v);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Summary row
        Row(
          children: [
            AppIcon(
              allPassed ? Assets.icons.icCheck : Assets.icons.icTypcnInfo,
              size: 14,
              color: allPassed ? sem.strengthStrong : sem.strengthWeak,
            ),
            const SizedBox(width: 8),
            Text(
              allPassed ? l10n.passwordStrong : l10n.passwordNotStrongEnough,
              style: tt.labelLarge?.copyWith(color: sem.textWarning),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Rule items
        ...results.entries.map((e) {
          final passed = e.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                AppIcon(
                  passed ? Assets.icons.icCheck : Assets.icons.icClose,
                  size: 12,
                  color: passed ? sem.strengthStrong : sem.ruleFailed,
                ),
                const SizedBox(width: 8),
                Text(
                  _ruleLabel(e.key, l10n, policy),
                  style: tt.bodySmall,
                ),
              ],
            ),
          );
        }),
      ],
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
