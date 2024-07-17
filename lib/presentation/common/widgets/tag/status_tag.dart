import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusTag extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final double radius;
  final double elevation;
  final double width;
  final double height;

  const StatusTag({
    super.key,
    required this.backgroundColor,
    required this.child,
    this.radius = 4.0,
    this.elevation = 0.0,
    this.width = 24.0,
    this.height = 24.0,
  });

  factory StatusTag.svg({
    Key? key,
    required Color backgroundColor,
    required String svgPath,
    Color? svgColor,
    double height = 24.0,
    double width = 24.0,
  }) {
    return StatusTag(
      key: key,
      backgroundColor: backgroundColor,
      height: height,
      width: width,
      child: SvgPicture.asset(
        colorFilter: ColorFilter.mode(
            svgColor ?? ColorManager().getColorBackgroundPrimary(),
            BlendMode.srcIn),
        svgPath,
        height: height,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width + 4.0,
      // height: height + 4.0,
      constraints: const BoxConstraints(maxHeight: 40),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 23),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: child,
      ),
    );
  }
}
