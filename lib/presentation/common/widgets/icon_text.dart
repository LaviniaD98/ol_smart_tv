import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.bkColor,
    required this.text,
    required this.textColor,
    required this.icon,
    this.iconSize = 16,
  });
  final Color bkColor;
  final String text;
  final Color textColor;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: iconSize, color: textColor),
        const Padding(padding: EdgeInsets.only(right: 4.0)),
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
