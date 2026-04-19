import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workiom_signup/core/theme/cubit/theme_cubit.dart';

class AppThemeSwitcher extends StatelessWidget {
  const AppThemeSwitcher({super.key});

  static const _modes = <ThemeMode>[
    ThemeMode.system,
    ThemeMode.light,
    ThemeMode.dark,
  ];

  IconData _iconFor(ThemeMode mode) => switch (mode) {
        ThemeMode.light => Icons.light_mode_outlined,
        ThemeMode.dark => Icons.dark_mode_outlined,
        ThemeMode.system => Icons.brightness_auto_outlined,
      };

  Future<void> _showDropdown(BuildContext context) async {
    final cubit = context.read<ThemeCubit>();
    final cs = Theme.of(context).colorScheme;
    final current = cubit.state;
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    final selected = await showMenu<ThemeMode>(
      context: context,
      color: cs.surface,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + size.height + 4,
        offset.dx + size.width,
        0,
      ),
      items: _modes
          .map(
            (mode) => PopupMenuItem<ThemeMode>(
              value: mode,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _iconFor(mode),
                        size: 14,
                        color: mode == current
                            ? cs.primary
                            : cs.onSurface,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _labelFor(mode),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: mode == current
                                  ? cs.primary
                                  : cs.onSurface,
                              fontWeight: mode == current
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                  if (mode == current)
                    Icon(Icons.check, size: 14, color: cs.primary),
                ],
              ),
            ),
          )
          .toList(),
    );

    if (selected != null && selected != current) {
      await cubit.setMode(selected);
    }
  }

  String _labelFor(ThemeMode mode) => switch (mode) {
        ThemeMode.light => 'Light',
        ThemeMode.dark => 'Dark',
        ThemeMode.system => 'System',
      };

  @override
  Widget build(BuildContext context) {
    final mode = context.watch<ThemeCubit>().state;
    final cs = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: Icon(
        _iconFor(mode),
        size: 18,
        color: cs.onSurfaceVariant,
      ),
    );
  }
}
