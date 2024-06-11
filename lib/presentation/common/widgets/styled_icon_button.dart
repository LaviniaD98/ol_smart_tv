import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';

class StyledIconButton extends StatelessWidget {
  const StyledIconButton({
    super.key,
    required this.svgPath,
    this.iconColor,
    this.backgroundColor,
    this.margin,
    this.size = Dimens.styledIconSize,
    this.radius = Dimens.radius,
    this.onTap,
  });

  final String svgPath;
  final Color? iconColor;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final double size;
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: size,
        height: size,
        margin: margin ?? EdgeInsets.zero,
        child: IconButton(
          onPressed: onTap,
          iconSize: 50,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
                const EdgeInsets.all(Dimens.spacingXXS)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
              backgroundColor ?? ColorManager().getColorBackgroundPrimary(),
            ),
          ),
          icon: Transform.scale(
            scale: 0.9999,
            child: SvgPicture.asset(
              svgPath,
              colorFilter: ColorFilter.mode(
                iconColor ?? ColorManager().getColorTextPrimaryCta(),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
