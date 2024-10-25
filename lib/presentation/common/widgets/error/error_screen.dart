import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';

import '../../../../remote_theming/labels/labels_manager.dart';
import '../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../theme/app_theme.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback? onReload;
  final String title;
  final String message;
  final Color? textColor;

  const ErrorScreen({
    super.key,
    required this.title,
    required this.message,
    this.onReload,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextTheme.dialogTitle(
                color: textColor ?? ColorManager().getColorTextPrimary()),
          ),
          const SizedBox(height: Dimens.spacingM),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextTheme.body(
                color: textColor ?? ColorManager().getColorTextPrimary()),
          ),
          if (onReload != null) ...[
            const SizedBox(height: Dimens.spacingXXL),
            OLButton(
              title: LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.retry),
              onPressed: onReload,
            ),
          ]
        ],
      ),
    );
  }
}
