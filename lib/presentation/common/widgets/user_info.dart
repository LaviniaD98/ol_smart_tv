import 'package:flutter/material.dart';
import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';
import '../../../core/utils/extension.dart';
import 'logo_app_header/user_logo.dart';

class UserInfo extends StatelessWidget {
  static const _imageSize = 40.0;

  const UserInfo({
    super.key,
    this.imageSize = _imageSize,
    this.name,
    this.lastName,
    this.imageUrl,
  });

  final String? name;
  final String? lastName;
  final String? imageUrl;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserLogo(
          size: imageSize,
          userImageUrl: imageUrl,
          name: name ?? '',
          surname: lastName ?? '',
        ),
        const SizedBox(width: Dimens.spacingM),
        Expanded(
          child: Text(
            '${name?.capitalize ?? ''} ${lastName?.capitalize ?? ''}',
            style: AppTextTheme.subtitle(
              color: ColorManager().getColorTextPrimary(),
              weight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
