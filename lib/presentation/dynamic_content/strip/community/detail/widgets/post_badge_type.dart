import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../theme/app_theme.dart';

class PostBadgeType extends StatelessWidget {
  const PostBadgeType(this.type, {super.key});
  final PostType type;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: Row(
        children: [
          SvgPicture.asset(
            switch (type) {
              PostType.POST => "assets/icons/post.svg",
              PostType.TALK => "assets/icons/talk.svg",
              PostType.SHARED => "assets/icons/share.svg",
            },
            colorFilter: ColorFilter.mode(
              ColorManager().getColorSystemPrimary01(),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: Dimens.spacingXS),
          Text(
            switch (type) {
              PostType.POST => LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.post),
              PostType.TALK => LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.talk),
              PostType.SHARED => LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.shared),
            },
            style: AppTextTheme.button(
              size: 12,
              color: ColorManager().getColorTextPrimary(),
            ),
          )
        ],
      ),
    );
  }
}
