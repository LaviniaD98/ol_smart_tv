import 'package:flutter/material.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../theme/app_theme.dart';

class OlCalendarLoading extends StatelessWidget {
  const OlCalendarLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('loading'),
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.download_agenda),
          textAlign: TextAlign.center,
          style: AppTextTheme.dialogTitle(color: ColorManager().getColorTextPrimary()),
        ),
        const SizedBox(height: Dimens.spacingXXL),
        const CircularProgressIndicator(),
      ],
    );
  }
}
