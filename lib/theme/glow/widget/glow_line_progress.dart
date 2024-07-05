import 'package:flutter/material.dart';

import 'package:open_learning_smart_tv/theme/glow/widget/glow_container.dart';

class GlowLineProgress extends StatelessWidget {
  const GlowLineProgress({
    super.key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
    this.glowColor,
    this.offset,
    this.spreadRadius,
    this.blurRadius,
  });

  final double? value;
  final Color? backgroundColor;
  final Animation<Color>? valueColor;
  final String? semanticsLabel;
  final String? semanticsValue;

  //glow properties
  final Color? glowColor;
  final Offset? offset;
  final double? spreadRadius;
  final double? blurRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GlowContainer(
      glowColor:
          glowColor ?? valueColor as Color? ?? theme.colorScheme.secondary,
      offset: offset,
      spreadRadius: spreadRadius,
      blurRadius: blurRadius,
      child: LinearProgressIndicator(
        key: key,
        value: value,
        backgroundColor: backgroundColor,
        valueColor: valueColor,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
      ),
    );
  }
}
