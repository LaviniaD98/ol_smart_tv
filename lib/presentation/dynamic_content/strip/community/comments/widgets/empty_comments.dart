import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../theme/app_theme.dart';

class EmptyComments extends StatelessWidget {
  const EmptyComments({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.spacingM,
          vertical: Dimens.spacingL,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.community_empty_comments_title),
              textAlign: TextAlign.center,
              style: AppTextTheme.body(
                weight: FontWeight.bold,
                color: ColorManager().getColorTextPrimary(),
              ),
            ),
            const SizedBox(height: Dimens.spacingXXXS),
            Text(
              LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.community_empty_comments_subtitle),
              textAlign: TextAlign.center,
              style: AppTextTheme.caption(
                color: ColorManager().getColorTextDisabled(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
