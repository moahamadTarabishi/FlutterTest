import 'package:flutter/material.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/theme/app_semantic_colors.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';
import 'package:workiom_signup/features/auth/presentation/signup/bloc/signup_bloc.dart';

class TenantAvailabilityIndicator extends StatelessWidget {
  const TenantAvailabilityIndicator({
    required this.availability,
    required this.tenantName,
    super.key,
  });

  final TenantAvailability availability;
  final String tenantName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final sem = Theme.of(context).extension<AppSemanticColors>()!;
    final tt = Theme.of(context).textTheme;

    return switch (availability) {
      TenantAvailability.unknown => const SizedBox.shrink(),
      TenantAvailability.checking => Row(
          children: [
            SizedBox(
              height: 14,
              width: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: cs.primary,
              ),
            ),
            const SizedBox(width: 8),
            Text(l10n.tenantChecking, style: tt.bodySmall),
          ],
        ),
      TenantAvailability.available => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppIcon(
                  Assets.icons.icCheck,
                  size: 16,
                  color: sem.strengthStrong,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.tenantAvailable,
                  style: tt.bodySmall?.copyWith(color: sem.strengthStrong),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              l10n.tenantAvailableHint(tenantName),
              style: tt.bodySmall,
            ),
          ],
        ),
      TenantAvailability.taken => Row(
          children: [
            AppIcon(Assets.icons.icClose, size: 16, color: sem.ruleFailed),
            const SizedBox(width: 8),
            Text(
              l10n.tenantTaken,
              style: tt.bodySmall?.copyWith(color: cs.error),
            ),
          ],
        ),
    };
  }
}
