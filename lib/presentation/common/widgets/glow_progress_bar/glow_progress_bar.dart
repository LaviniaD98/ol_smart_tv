import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/theme/glow/widget/glow_container.dart';
//import 'package:flutter_glow/flutter_glow.dart';

import '../../../../color_management/color_manager.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth * withFactor;
        return UnconstrainedBox(
          alignment: Alignment.centerLeft,
          child: Container(
            width: width,
            height: 7,
            decoration: BoxDecoration(
              color: ColorManager().getColorSystemPrimary01(),
              borderRadius: BorderRadius.circular(7),
            ),
            child: UnconstrainedBox(
              alignment: Alignment.centerLeft,
              child: GlowContainer(
                // duration: duration ?? Duration(milliseconds: 500),
                width: _calculatePercentage(width),
                height: 7,
                blurRadius: 5,
                spreadRadius: 0.6,
                glowColor: ColorManager().getColorSystemSecondary01(),
                color: ColorManager().getColorSystemSecondary01(),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        );
      },
    );
  }

  double _calculatePercentage(double width) {
    return (width * clampDouble(percentage, 0, 100) / 100);
  }
}
