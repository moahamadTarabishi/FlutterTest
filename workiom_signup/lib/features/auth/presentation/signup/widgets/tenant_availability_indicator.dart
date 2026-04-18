import 'package:flutter/material.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
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
    final tt = Theme.of(context).textTheme;

    return switch (availability) {
      TenantAvailability.unknown => const SizedBox.shrink(),
      TenantAvailability.checking => Row(
          children: [
            const SizedBox(
              height: 14,
              width: 14,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 8),
            Text(
              l10n.tenantChecking,
              style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
        ),
      TenantAvailability.available => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, size: 16, color: cs.primary),
                const SizedBox(width: 8),
                Text(
                  l10n.tenantAvailable,
                  style:
                      tt.bodySmall?.copyWith(color: cs.primary),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              l10n.tenantAvailableHint(tenantName),
              style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
        ),
      TenantAvailability.taken => Row(
          children: [
            Icon(Icons.cancel, size: 16, color: cs.error),
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
