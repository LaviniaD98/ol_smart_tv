import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_glow/flutter_glow.dart';

import '../../../../color_management/color_manager.dart';
import '../../../../theme/app_theme.dart';

class GlowProgressBar extends StatelessWidget {
  final double percentage;
  final Duration? duration;
  final double withFactor;

  const GlowProgressBar({
    super.key,
    required this.percentage,
    this.duration,
    this.withFactor = 1,
  }) : assert(withFactor <= 1, "withFactor error");

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth * withFactor;
      return UnconstrainedBox(
        alignment: Alignment.centerLeft,
        child: Container(
          width: width,
          height: Dimens.spacingXXS,
          decoration: BoxDecoration(
              color: ColorManager().getColorSystemPrimary01(),
              borderRadius: BorderRadius.circular(Dimens.spacingXXS / 2)),
          child: UnconstrainedBox(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: duration ?? Duration(milliseconds: 500),
              width: _calculatePercentage(width),
              height: Dimens.spacingXXS,
              //glowColor: ColorManager().getColorSystemSecondary01(),
              color: ColorManager().getColorSystemSecondary01(),
              //borderRadius: BorderRadius.circular(Dimens.spacingXXS / 2),
            ),
          ),
        ),
      );
    });
  }

  double _calculatePercentage(double width) {
    return (width * clampDouble(percentage, 0, 100) / 100);
  }
}
