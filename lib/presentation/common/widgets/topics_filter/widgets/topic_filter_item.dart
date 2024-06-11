import 'package:flutter/material.dart';
// import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/glow.dart';

class TopicFilterItem extends StatelessWidget {
  static const _iconSize = 24.0;

  final String? label;
  final String? path;
  final VoidCallback onTap;
  final bool isSelected;
  final EdgeInsets? padding;

  const TopicFilterItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    this.label,
    this.path,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Glow(
              glow: isSelected,
              child: path != null && path!.isNotEmpty
                  ? SvgPicture.network(
                      path!,
                      height: _iconSize,
                      width: _iconSize,
                      colorFilter:
                          ColorFilter.mode(_color(isSelected), BlendMode.srcIn),
                      semanticsLabel: label,
                    )
                  : const SizedBox(
                      height: _iconSize,
                      width: _iconSize,
                    ),
            ),
            const SizedBox(height: Dimens.spacingXS),
            Text(
              label ?? 'Unknown',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: AppTextTheme.bottomNavigation(
                color: _color(isSelected),
              ),
            ),
            const SizedBox(height: Dimens.spacingXXS),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: isSelected ? 1.0 : 0.0,
              child: Container(
                height: 2,
                //  glowColor: ColorManager().getColorSystemSecondary01(),
                color: ColorManager().getColorSystemSecondary01(),
                //borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _color(bool isSelected) => isSelected
      ? ColorManager().getColorSystemSecondary01()
      : ColorManager().getColorTextPrimary();
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
          width:
              (MediaQuery.of(context).size.width / Dimens.learningCardRatio) *
                  .3,
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
