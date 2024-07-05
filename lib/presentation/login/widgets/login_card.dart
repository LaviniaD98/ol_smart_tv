import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import '../../../theme/app_theme.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    this.borderRadius,
    this.padding,
    this.showBack = false,
    this.gradient = AppColors.greyGradient,
    this.trailing,
    required this.title,
    required this.description,
    required this.child,
  });

  final String title;
  final String description;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final bool showBack;
  final Widget? trailing;
  final Widget child;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(Dimens.hPadding),
      width: 887,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        color: OLColors.backgroundPrimary.withOpacity(0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _backButton(context),
          Text(
            title,
            textAlign: TextAlign.start,
            style: AppTextTheme.title(
              color: ColorManager().getColorTextPrimaryCta(),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            textAlign: TextAlign.start,
            style: AppTextTheme.subtitle(
              color: ColorManager().getColorTextPrimary(),
            ).copyWith(height: 1.2),
          ),
          const SizedBox(height: 32.0),
          child,
        ],
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    if (Navigator.of(context).canPop() && showBack) {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: context.pop,
              child: SvgPicture.asset("assets/icons/back_arrow.svg"),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.back),
                textAlign: TextAlign.start,
                style: AppTextTheme.caption(
                  color: ColorManager().getColorTextPrimary(),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
