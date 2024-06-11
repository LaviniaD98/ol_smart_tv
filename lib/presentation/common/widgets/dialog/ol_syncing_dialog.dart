import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../theme/app_theme.dart';
import 'dialog_page.dart';

class OlSyncingDialog extends StatelessWidget {
  const OlSyncingDialog._();

  static Future<bool?> show(BuildContext context) {
    return context.pushNamed(
      DialogPage.routeName,
      extra: DialogPage(
        builder: (BuildContext context) => const OlSyncingDialog._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(Dimens.spacingL),
          decoration: BoxDecoration(
            gradient: AppTheme.backgroundGradient,
            borderRadius: BorderRadius.circular(Dimens.radiusDialog),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.sync_offline_data),
                textAlign: TextAlign.center,
                style: AppTextTheme.dialogTitle(
                    color: ColorManager().getColorTextPrimary()),
              ),
              const SizedBox(height: Dimens.spacingXXL),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
