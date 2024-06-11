import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightRoundedIcon extends StatelessWidget {
  final Color bkColor;
  final Color borderColor;
  final IconData icon;
  final Color iconColor;
  final double borderSize;
  final double radius;
  final double elev;

  RightRoundedIcon({
    required this.bkColor,
    required this.borderColor,
    required this.icon,
    required this.iconColor,
    this.borderSize = 1,
    this.radius = 4.0,
    this.elev = 2.0
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: elev,
        color: bkColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(radius),bottomRight: Radius.circular(radius)),
            side: BorderSide(width: borderSize, color: borderColor)),
        child: Center(
          child:
          Padding(padding: const EdgeInsets.all(4), child:
          Icon(icon, size: 16, color: iconColor,)
          ),
        ));
  }
}