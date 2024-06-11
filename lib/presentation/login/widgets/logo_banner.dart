import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';

class LogoBanner extends StatelessWidget {
  const LogoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 34),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/app_logo.svg",
              width: 214,
              height: 32,
            ),
          ],
        ),
        const SizedBox(height: 28),
        const Divider(color: OLColors.divider, thickness: 1, height: 1)
      ],
    );
  }
}
