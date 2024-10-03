import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.bkColor,
    required this.text,
    required this.textColor,
    this.icon,
    this.image,
    this.iconSize = 16,
    this.textStyle,
  });
  final Color bkColor;
  final String text;
  final String? image;
  final Color textColor;
  final IconData? icon;
  final double iconSize;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: iconSize, color: textColor),
        ] else if (image != null) ...[
          SvgPicture.asset(
            image!,
            width: iconSize,
            height: iconSize,
            colorFilter: ColorFilter.mode(
              textColor,
              BlendMode.srcIn,
            ),
          ),
        ],
        const SizedBox(width: 8),
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: textStyle ??
              TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
        ),
      ],
    );
  }
}
