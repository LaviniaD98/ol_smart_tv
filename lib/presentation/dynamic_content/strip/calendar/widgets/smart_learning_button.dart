import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';

class SmartLearningButton extends StatelessWidget {
  static const _iconSize = 24.0;
  const SmartLearningButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: onTap != null ? 1 : .3,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          height: Dimens.buttonHeight,
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.spacingXS,
            horizontal: Dimens.spacingM,
          ),
          decoration: BoxDecoration(
            color: ColorManager().getColorBackgroundPrimaryLighter(),
            borderRadius: BorderRadius.circular(Dimens.radius),
            border:
                Border.all(width: 1, color: ColorManager().getColorBorderTag()),
          ),
          child: Row(
            children: [
              SizedBox.square(
                dimension: _iconSize,
                child: SvgPicture.asset(
                  'assets/icons/creative_writing.svg',
                  width: _iconSize,
                  height: _iconSize,
                  colorFilter: ColorFilter.mode(
                      ColorManager().getColorSystemSecondary04(),
                      BlendMode.srcIn),
                ),
              ),
              VerticalDivider(
                width: Dimens.spacingXXXL,
                color: ColorManager().getColorBorderTag(),
              ),
              Expanded(
                child: Text(
                  LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.smart_learning_button),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.subtitle(
                      weight: FontWeight.w700,
                      color: ColorManager().getColorTextPrimary()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
