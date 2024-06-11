import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../color_management/color_manager.dart';
import '../../../remote_theming/labels/labels_manager.dart';
import '../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../theme/app_theme.dart';

class OnScrollError extends StatelessWidget {
  final PagingController controller;
  const OnScrollError(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.spacingL),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(Dimens.radiusCard),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
              textAlign: TextAlign.start,
              style: AppTextTheme.body(),
            ),
          ),
          const SizedBox(width: Dimens.spacingL),
          InkWell(
            onTap: () => controller.retryLastFailedRequest(),
            child: Text(
              LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.retry),
              style: AppTextTheme.caption(
                color: ColorManager().getColorTextPrimaryCta(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
