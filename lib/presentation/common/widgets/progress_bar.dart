import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:flutter_glow/flutter_glow.dart';


class CustomProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  const CustomProgressBar({
    super.key,
    required this.width,
    required this.height,
    required this.progress,
    this.backgroundColor = Colors.white,
    this.progressColor = Colors.lightGreenAccent,
  });

  @override
  Widget build(BuildContext context) {
    var glowbarPos = width * clampDouble(progress, 0, 100) / 100;
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            // offset: Offset(0, 0),
            // blurRadius: 4,
            width: width,
            height: height,
            //glowColor: Colors.white,
            color: Colors.white,
            // borderRadius: const BorderRadius.all(
            //   Radius.circular(1),
            // ),
          ),
          Container(
            // offset: Offset(0, 0),
            // blurRadius: 4,
            width: glowbarPos,
            height: height,
            //glowColor: progressColor,
            color: progressColor,
            // borderRadius: const BorderRadius.all(
            //   Radius.circular(1),
            // ),
          ),
        ],
      ),
    );
  }
}