import 'package:flutter/material.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../theme/app_theme.dart';

class OlCalendarAlert extends StatelessWidget {
  const OlCalendarAlert({
    super.key,
    required this.title,
    required this.message,
    required this.actionLabel,
    required this.callback,
  });

  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextTheme.dialogTitle(
              color: ColorManager().getColorTextPrimary()),
        ),
        const SizedBox(height: Dimens.spacingM),
        Text(
          message,
          textAlign: TextAlign.center,
          style:
          AppTextTheme.body(color: ColorManager().getColorTextPrimary()),
        ),
        const SizedBox(height: Dimens.spacingXXL),
        ElevatedButton(
          style: AppButtonStyle.red,
          onPressed: callback,
          child: Text(
            actionLabel,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: AppTextTheme.button(),
          ),
        ),
      ],
    );
  }
}
