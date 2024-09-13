import 'package:flutter/cupertino.dart';

Color calculateNeonEquivalent(
    Color baseColor, double neonFactor, double brightnessFactor) {
  neonFactor = neonFactor.clamp(0.0, 1.0);
  HSLColor hsl = HSLColor.fromColor(baseColor);

  hsl = HSLColor.fromAHSL(
    baseColor.alpha / 255.0,
    hsl.hue,
    (hsl.saturation + neonFactor).clamp(0.0, 1.0),
    (hsl.lightness + neonFactor).clamp(0.0, 1.0),
  );

  hsl = HSLColor.fromAHSL(
    hsl.alpha,
    hsl.hue,
    hsl.saturation,
    (hsl.lightness * brightnessFactor).clamp(0.0, 1.0),
  );

  return hsl.toColor();
}
