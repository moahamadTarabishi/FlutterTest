import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    required this.onChanged,
    super.key,
    this.errorText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.suffix,
    this.autofocus = false,
    this.enabled = true,
  });

  final String label;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final bool autofocus;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      autofocus: autofocus,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        suffix: suffix,
      ),
    );
  }
}
