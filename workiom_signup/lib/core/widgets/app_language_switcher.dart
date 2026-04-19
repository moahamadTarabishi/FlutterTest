import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workiom_signup/core/gen/assets.gen.dart';
import 'package:workiom_signup/core/l10n/generated/app_localizations.dart';
import 'package:workiom_signup/core/l10n/locale_cubit.dart';
import 'package:workiom_signup/core/widgets/app_icon.dart';

class AppLanguageSwitcher extends StatelessWidget {
  const AppLanguageSwitcher({super.key});

  Future<void> _showDropdown(BuildContext context) async {
    final cubit = context.read<LocaleCubit>();
    final cs = Theme.of(context).colorScheme;
    final current = cubit.state.languageCode;
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    final selected = await showMenu<String>(
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
      items: [
        _buildItem(context, code: 'en', label: 'English', current: current),
        _buildItem(context, code: 'ar', label: 'العربية', current: current),
      ],
    );

    if (selected != null && selected != current) {
      cubit.setLocale(Locale(selected));
    }
  }

  PopupMenuItem<String> _buildItem(
    BuildContext context, {
    required String code,
    required String label,
    required String current,
  }) {
    final isSelected = code == current;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return PopupMenuItem<String>(
      value: code,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: tt.bodySmall?.copyWith(
              color: isSelected ? cs.primary : cs.onSurface,
              fontWeight:
                  isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          if (isSelected)
            Icon(
              Icons.check,
              size: 14,
              color: cs.primary,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final currentCode =
        context.watch<LocaleCubit>().state.languageCode;
    final label = currentCode == 'en' ? l10n.english : l10n.arabic;

    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(
            Assets.icons.icGlobe,
            size: 14,
            color: cs.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Text(label, style: tt.bodySmall),
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 1),
            child: AppIcon(
              Assets.icons.icChevronDown,
              size: 14,
              color: cs.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
