import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../theme/app_theme.dart';

class OlCalendarDone extends StatelessWidget {
  const OlCalendarDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Center(
            child: Text(
              LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.add_calendar_done),
              textAlign: TextAlign.center,
              style: AppTextTheme.dialogTitle(
                color: ColorManager().getColorTextPrimary(),
              ),
            ),
          ),
        ),
        const SizedBox(height: Dimens.spacingXXL),
        ElevatedButton(
          style: AppButtonStyle.red,
          onPressed: context.pop,
          child: Text(
            LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.ok),
            textAlign: TextAlign.center,
            maxLines: 1,
            style: AppTextTheme.button(),
          ),
        ),
      ],
    );
  }
}
