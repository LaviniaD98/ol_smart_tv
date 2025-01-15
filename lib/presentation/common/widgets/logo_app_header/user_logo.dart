import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../profile/profile_page.dart';

class UserLogo extends StatelessWidget {
  final String? userImageUrl;
  final String? name;
  final String? surname;
  final double size;
  final bool navigation;
  final double radius;
  final bool isSelected;
  final bool hasFocus;
  final Color? bgColor;

  const UserLogo({
    super.key,
    this.userImageUrl,
    this.name = '',
    this.surname = '',
    this.navigation = false,
    this.size = 32,
    this.radius = 16,
    this.isSelected = false,
    this.hasFocus = false,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedUsername =
        ((name?.isNotEmpty == true ? name![0] : '') +
                (surname?.isNotEmpty == true ? surname![0] : ''))
            .toUpperCase();

    return InkWell(
      onTap: navigation ? () => Nav.push(context, screen: ProfilePage()) : null,
      child: Container(
        height: size,
        width: size,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: isSelected || hasFocus
                ? OLColors.accentVariantA
                : Colors.transparent,
            width: 3,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: userImageUrl != null && userImageUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: userImageUrl!,
                maxWidthDiskCache: 300,
                memCacheWidth: 300,
                fit: BoxFit.cover,
                errorWidget: (context, object, stackTrace) {
                  return _placeholder(formattedUsername);
                },
              )
            : _placeholder(formattedUsername),
      ),
    );
  }

  Widget _placeholder(String label) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? ColorManager().getColorTextPrimary(),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Builder(
        builder: (context) {
          if (label.isEmpty) {
            return const Icon(
              Icons.person,
              color: Colors.black,
            );
          }
          return Text(
            label,
            style: AppTextTheme.caption(
                color: ColorManager().getColorTextPrimaryAlternative()),
          );
        },
      ),
    );
  }
}
