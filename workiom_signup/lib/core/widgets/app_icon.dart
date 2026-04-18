import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.assetPath, {
    super.key,
    this.size = 24,
    this.color,
    this.semanticsLabel,
  });

  final String assetPath;
  final double size;
  final Color? color;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final tintColor = color ?? Theme.of(context).colorScheme.onSurface;
    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(tintColor, BlendMode.srcIn),
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: semanticsLabel == null,
    );
  }
}
