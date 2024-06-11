import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';

import '../../../../theme/app_theme.dart';
import 'dialog_page.dart';

class OlAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String actionLabel;

  const OlAlertDialog._({
    required this.title,
    required this.message,
    required this.actionLabel,
  });

  static Future<dynamic> show(
    BuildContext context, {
    required String title,
    required String message,
    required String actionLabel,
    bool barrierDismissible = true,
  }) async {
    // return Navigator.of(context).restorablePush(
    //   (context, arguments) {
    //     return DialogPage(
    //       barrierDismissible: barrierDismissible,
    //       builder: (context) => OlAlertDialog._(
    //         title: title,
    //         message: message,
    //         actionLabel: actionLabel,
    //       ),
    //     ).createRoute(context);
    //   },
    // );

    Navigator.of(context).push(
      DialogPage(
        barrierDismissible: barrierDismissible,
        builder: (context) => OlAlertDialog._(
          title: title,
          message: message,
          actionLabel: actionLabel,
        ),
      ).createRoute(context),
    );

    // context.pushNamed(
    //   DialogPage.routeName,
    //   extra: DialogPage(
    //     barrierDismissible: barrierDismissible,
    //     builder: (context) => OlAlertDialog._(
    //       title: title,
    //       message: message,
    //       actionLabel: actionLabel,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.spacingL),
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
          ElevatedButton(
            style: AppButtonStyle.red,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              actionLabel,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: AppTextTheme.button(),
            ),
          ),
        ],
      ),
    );
  }
}
