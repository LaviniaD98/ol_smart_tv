import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/dialog_page.dart';
import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';

class OlOkCancelDialog extends StatelessWidget {
  final String title;
  final String message;
  final String okActionLabel;
  final String cancelActionLabel;
  final VoidCallback? okCallback;
  final VoidCallback? cancelCallback;

  const OlOkCancelDialog._({
    required this.title,
    required this.message,
    required this.okActionLabel,
    required this.cancelActionLabel,
    this.okCallback,
    this.cancelCallback,
  });

  static Future<dynamic> show(
    BuildContext context, {
    required String title,
    required String message,
    required String okActionLabel,
    required String cancelActionLabel,
    VoidCallback? okCallback,
    VoidCallback? cancelCallback,
    bool barrierDismissible = true,
  }) {
    return Navigator.of(context).push(
      DialogPage(
        barrierDismissible: barrierDismissible,
        builder: (context) => OlOkCancelDialog._(
          title: title,
          message: message,
          okActionLabel: okActionLabel,
          cancelActionLabel: cancelActionLabel,
          okCallback: okCallback,
          cancelCallback: cancelCallback,
        ),
      ).createRoute(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.spacingS),
      decoration: BoxDecoration(
        gradient: AppTheme.apppBackgroundGradient,
        borderRadius: BorderRadius.circular(Dimens.radiusDialog),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            OutlinedButton(
              style: AppButtonStyle.trasparent,
              onPressed: () {
                Navigator.of(context).pop(false);
                cancelCallback?.call();
              },
              child: Text(
                cancelActionLabel,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: AppTextTheme.button(),
              ),
            ),
            const SizedBox(width: Dimens.spacingS),
            ElevatedButton(
              style: AppButtonStyle.red,
              onPressed: () {
                Navigator.of(context).pop(true);
                okCallback?.call();
              },
              child: Text(
                okActionLabel,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: AppTextTheme.button(),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
