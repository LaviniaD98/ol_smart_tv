import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class IconText extends StatelessWidget {
  final Color bkColor;
  final String text;
  final Color textColor;
  final IconData icon;
  final double iconSize;

  IconText(
      {required this.bkColor,
      required this.text,
      required this.textColor,
      required this.icon,
      this.iconSize = 16});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(children: [
      Icon(icon, size: iconSize, color: textColor),
      Padding(padding: EdgeInsets.only(right: 4.0)),
      Expanded(
          child: AutoSizeText(text,
              minFontSize: 10,
              maxFontSize: 12,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: textColor, fontWeight: FontWeight.normal)))
    ]));
  }
}
