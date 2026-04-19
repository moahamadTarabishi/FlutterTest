import 'package:flutter/material.dart';
import 'package:workiom_signup/core/theme/app_semantic_colors.dart';

class ErrorBanner extends StatelessWidget {
  const ErrorBanner({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    final sem = Theme.of(context).extension<AppSemanticColors>()!;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: sem.errorBanner,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        child: Text(
          message,
          style: tt.bodyMedium?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
