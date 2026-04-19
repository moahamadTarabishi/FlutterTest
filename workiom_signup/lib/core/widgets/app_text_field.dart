import 'package:flutter/material.dart';
import 'package:workiom_signup/core/theme/app_semantic_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    required this.onChanged,
    super.key,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.suffix,
    this.suffixText,
    this.controller,
    this.autofocus = false,
    this.enabled = true,
    this.focusNode,
    this.onSubmitted,
    this.autofillHints,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.textCapitalization = TextCapitalization.none,
  });

  final String label;
  final ValueChanged<String> onChanged;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffix;
  final String? suffixText;
  final TextEditingController? controller;
  final bool autofocus;
  final bool enabled;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;
  final Iterable<String>? autofillHints;
  final bool autocorrect;
  final bool enableSuggestions;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final sem = Theme.of(context).extension<AppSemanticColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: tt.bodyLarge),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          enabled: enabled,
          autofocus: autofocus,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          focusNode: focusNode,
          onSubmitted: onSubmitted,
          autofillHints: autofillHints,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          textCapitalization: textCapitalization,
          style: tt.bodyLarge,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8),
                    child: prefixIcon,
                  )
                : null,
            prefixIconConstraints:
                prefixIcon != null ? const BoxConstraints() : null,
            suffixIcon: suffix,
            suffixIconConstraints:
                suffix != null ? const BoxConstraints() : null,
            suffixText: suffixText,
            suffixStyle: tt.bodyLarge?.copyWith(
              color: sem.textTertiary,
            ),
          ),
        ),
      ],
    );
  }
}
