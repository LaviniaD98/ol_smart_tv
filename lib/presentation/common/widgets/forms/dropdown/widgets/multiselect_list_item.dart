import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../theme/app_theme.dart';

class MultiselectListItem<T> extends StatelessWidget {
  const MultiselectListItem(
      this.item, {
        super.key,
        required this.isSelected,
        required this.onLabelBuilder,
      });

  final T item;
  final bool isSelected;
  final String Function(T type) onLabelBuilder;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 40.0
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              onLabelBuilder(item),
              style: AppTextTheme.body(
                color: ColorManager().getColorTextPrimaryAlternative(),
                // weight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(left: Dimens.spacingXL),
              child: SizedBox.square(
                dimension: 20.0,
                child: AnimatedOpacity(
                  opacity: isSelected ? 1 : 0,
                  duration: const Duration(milliseconds: 120),
                  child: SvgPicture.asset(
                    'assets/icons/checkbox_tick.svg',
                    colorFilter: ColorFilter.mode(
                      ColorManager().getColorSystemPrimary02(),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
