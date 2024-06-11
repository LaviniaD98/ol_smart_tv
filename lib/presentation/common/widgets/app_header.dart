import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.title,
    this.trailing,
  });

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Dimens.appBarHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.spacingL,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextTheme.title(
                  color: ColorManager().getColorTextPrimary()),
            ),
            const Spacer(),
            if (trailing != null) ...[
              const SizedBox(width: Dimens.spacingM),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
