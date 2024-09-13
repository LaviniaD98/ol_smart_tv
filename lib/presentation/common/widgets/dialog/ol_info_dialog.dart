import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/dialog_page.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';

class OlOkInfoDialog extends StatelessWidget {
  final String title;
  final String message;
  final String okActionLabel;
  final String cancelActionLabel;
  final VoidCallback okCallback;

  const OlOkInfoDialog._({
    required this.title,
    required this.message,
    required this.okActionLabel,
    required this.cancelActionLabel,
    required this.okCallback,
  });

  static Future<dynamic> show(
    BuildContext context, {
    required String title,
    required String message,
    required String okActionLabel,
    required String cancelActionLabel,
    required VoidCallback okCallback,
    bool barrierDismissible = true,
  }) {
    return Navigator.of(context).push(
      DialogPage(
        barrierDismissible: barrierDismissible,
        builder: (context) => OlOkInfoDialog._(
          title: title,
          message: message,
          okActionLabel: okActionLabel,
          cancelActionLabel: cancelActionLabel,
          okCallback: okCallback,
        ),
      ).createRoute(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.spacingS),
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient,
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
          const Row(children: [
            // ElevatedButton(
            //   style: AppButtonStyle.red,
            //   onPressed: () {
            //     // context.pop();
            //     okCallback.call();
            //   },
            //   child: Text(
            //     okActionLabel,
            //     textAlign: TextAlign.center,
            //     maxLines: 1,
            //     style: AppTextTheme.button(),
            //   ),
            // ),
            Center(
              child: CircularProgressIndicator(),
            )
          ]),
        ],
      ),
    );
  }
}
