import 'dart:ui';

import 'package:flutter/material.dart';

class Glow extends StatelessWidget {
  static const _sigma = 3.0;

  const Glow({
    super.key,
    this.glow = true,
    this.sigmaY,
    this.sigmaX,
    required this.child,
  });

  final bool glow;
  final double? sigmaY;
  final double? sigmaX;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if(glow) {
      return ClipRRect(
        child: Center(
          child: Stack(
            children: [
              child,
              BackdropFilter(
                blendMode: BlendMode.srcOver,
                filter: ImageFilter.blur(
                  sigmaY: sigmaY ?? _sigma,
                  sigmaX: sigmaX ?? _sigma,
                  tileMode: TileMode.decal,
                ),
                child: child,
              ),
            ],
          ),
        ),
      );
    }
    return child;
  }
}
