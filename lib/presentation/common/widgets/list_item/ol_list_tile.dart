import 'package:flutter/material.dart';

import '../../../../color_management/color_manager.dart';
import '../../../../theme/app_theme.dart';
import '../glow.dart';

class OlListTile extends StatelessWidget {
  const OlListTile({
    super.key,
    required this.label,
    this.onTap,
    this.isSelected = false,
    this.leading,
    this.trailing,
  });

  final String label;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Glow(
        glow: isSelected,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: Dimens.listItemHeight,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: 1,
              color: isSelected
                  ? ColorManager().getColorBorderAccent()
                  : ColorManager().getColorTextPrimary(),
            ),
            borderRadius: BorderRadius.circular(Dimens.radius),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.spacingXS,
            horizontal: Dimens.spacingL,
          ),
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: Dimens.spacingM),
              ],
              Expanded(
                child: Text(
                  label,
                  textAlign: TextAlign.start,
                  style: AppTextTheme.subtitle(
                    color: isSelected
                        ? ColorManager().getColorSystemSecondary01()
                        : ColorManager().getColorTextPrimary(),
                  ),
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: Dimens.spacingM),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
