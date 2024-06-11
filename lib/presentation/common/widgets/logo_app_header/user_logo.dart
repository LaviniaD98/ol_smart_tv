import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../profile/profile_page.dart';

class UserLogo extends StatelessWidget {
  final String? userImageUrl;
  final String? name;
  final String? surname;
  final double size;
  final bool navigation;

  const UserLogo({
    super.key,
    this.userImageUrl,
    this.name = '',
    this.surname = '',
    this.navigation = false,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedUsername =
        ((name?.isNotEmpty == true ? name![0] : '') +
                (surname?.isNotEmpty == true ? surname![0] : ''))
            .toUpperCase();

    return InkWell(
      onTap: navigation ? () => context.goNamed(ProfilePage.routeName) : null,
      child: SizedBox(
          height: size,
          width: size,
          child: ClipOval(
            child: userImageUrl != null && userImageUrl!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: userImageUrl!,
                    fit: BoxFit.cover,
                    errorWidget: (context, object, stackTrace) {
                      return _placeholder(formattedUsername);
                    },
                  )
                : _placeholder(formattedUsername),
          )),
    );
  }

  Widget _placeholder(String label) {
    return CircleAvatar(
        backgroundColor: ColorManager().getColorTextPrimary(),
        child: Text(
          label,
          style: AppTextTheme.caption(
              color: ColorManager().getColorTextPrimaryAlternative()),
        ));
  }
}
