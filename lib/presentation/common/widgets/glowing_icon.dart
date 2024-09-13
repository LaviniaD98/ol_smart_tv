// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/color_processing.dart';

class GlowingIcon extends StatelessWidget {
  const GlowingIcon(this.iconData, this.iconColor, this.size,
      [this.neonFactor = 0.5, this.brightness = 0.7]);

  final IconData iconData;
  final Color iconColor;
  final double neonFactor;
  final double brightness;
  final double size;

  @override
  Widget build(BuildContext context) {
    var neoncolor = calculateNeonEquivalent(iconColor, neonFactor, brightness);

    return Icon(
      iconData,
      color: neoncolor,
      //glowColor: neoncolor,
      size: size,
      //blurRadius: 7,
      //offset: Offset(0, 0),
    );
  }
}
