import 'package:flutter/material.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../theme/app_theme.dart';


class CommunityFilterItem extends StatelessWidget {
  final String? label;
  final VoidCallback onTap;
  final bool isSelected;
  final EdgeInsets? padding;

  const CommunityFilterItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    this.label,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: isSelected
                ? ColorManager().getColorBorderAccent()
                : ColorManager().getColorSystemPrimary01()
              ),
              borderRadius: BorderRadius.circular(Dimens.radiusImage)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(Dimens.spacingXS, Dimens.spacingXXS, Dimens.spacingXS, Dimens.spacingXXS),
            child: Text(
              label?.toUpperCase() ?? "",
              style: AppTextTheme.caption(
                weight: FontWeight.bold,
                color: isSelected
                  ? ColorManager().getColorSystemSecondary01()
                  : ColorManager().getColorTextPrimary()
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopicFilterItemShimmer extends StatelessWidget {

  static const _iconSize = 24.0;

  const TopicFilterItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: _iconSize,
          height: _iconSize,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        const SizedBox(height: Dimens.spacingXS),
        Container(
          width: (MediaQuery.of(context).size.width/Dimens.learningCardRatio) * .3,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ],
    );
  }
}
