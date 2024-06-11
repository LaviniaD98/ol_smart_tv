import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/styled_icon_button.dart';
import '../post/add_link/add_link_page.dart';
import '../post/post_page.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingL, vertical: Dimens.spacingM),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => context.pushNamed(PostPage.routeName),
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingM),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: ColorManager().getColorBackgroundSecondary(),
                  borderRadius: BorderRadius.circular(Dimens.radiusXXS),
                ),
                child: Text(
                  LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.post_add_button),
                  maxLines: 1,
                  style: AppTextTheme.body(color: ColorManager().getColorTextDisabled()),
                ),
              ),
            ),
          ),
          const SizedBox(width: Dimens.spacingXS),
          StyledIconButton(
            onTap: () async {
              context.pushNamed(
                PostLinkPage.routeName,
                extra: PostLinkPageArgs(
                  replace: true
                ),
              );
            },
            radius: Dimens.radiusXXS,
            size: 40.0,
            svgPath: 'assets/icons/link.svg',
            backgroundColor: ColorManager().getColorBackgroundPrimaryCta(),
            iconColor: ColorManager().getColorTextPrimaryAlternative(),
          ),
        ],
      ),
    );
  }
}
