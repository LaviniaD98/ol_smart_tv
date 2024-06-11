import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../theme/app_theme.dart';

class MultiselectChip<T> extends StatelessWidget {
  const MultiselectChip(
      this.item, {
        super.key,
        required this.onLabelBuilder,
        required this.onCancel,
      });

  final T item;
  final String Function(T type) onLabelBuilder;
  final void Function(T type) onCancel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingXS, vertical: Dimens.spacingXS),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.radius),
          color: ColorManager().getColorBackgroundSecondary(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth - (Dimens.spacingXS *2) - Dimens.spacingXXL - 12,
              ),
              child: Text(
                onLabelBuilder(item),
                style: AppTextTheme.body(color: ColorManager().getColorTextPrimaryAlternative()),
              ),
            ),
            const SizedBox(width: Dimens.spacingXXL),
            GestureDetector(
              onTap: () => onCancel(item),
              behavior: HitTestBehavior.translucent,
              child: SvgPicture.asset(
                "assets/icons/cross_alt.svg",
                width: 12.0,
                colorFilter: ColorFilter.mode(
                  ColorManager().getColorBackgroundPrimaryCta(),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
