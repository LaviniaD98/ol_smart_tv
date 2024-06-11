import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../color_management/color_manager.dart';
import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../remote_theming/labels/remote_labels.dart';
import '../../../router/app_router.dart';
import '../../../theme/app_theme.dart';
import '../languages_page.dart';

class LanguagesButton extends StatelessWidget {
  const LanguagesButton({super.key, required this.onChanged});
  final VoidCallback onChanged;
  @override
  Widget build(BuildContext context) {
    return getIt<RemoteLabels>().enableMultiLanguages
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              final args = LanguagesPageArgs(onChanged: onChanged);
              context.pushNamed(LanguagesPage.routeName, extra: args);
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/globo.svg",
                  width: 16.0,
                  height: 16.0,
                ),
                const SizedBox(width: Dimens.spacingXS),
                Text(
                  getIt<RemoteLabels>().selectedLanguage.label,
                  style: AppTextTheme.body(
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
