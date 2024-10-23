import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';

import '../../../../theme/app_theme.dart';
import 'dialog_page.dart';
import 'package:collection/collection.dart';

class OlAlertDialog extends StatefulWidget {
  final String title;
  final String message;
  final String actionLabel;
  final List<Widget>? actions;

  const OlAlertDialog._({
    required this.title,
    required this.message,
    required this.actionLabel,
    this.actions,
  });

  static Future<dynamic> show(
    BuildContext context, {
    required String title,
    required String message,
    required String actionLabel,
    List<Widget>? actions,
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
          actions: actions,
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
  State<OlAlertDialog> createState() => _OlAlertDialogState();
}

class _OlAlertDialogState extends State<OlAlertDialog> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.hViewPadding),
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient,
        borderRadius: BorderRadius.circular(Dimens.radiusDialog),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: AppTextTheme.dialogTitle(
                color: ColorManager().getColorTextPrimary()),
          ),
          const SizedBox(height: Dimens.spacingM),
          Text(
            widget.message,
            textAlign: TextAlign.center,
            style:
                AppTextTheme.body(color: ColorManager().getColorTextPrimary()),
          ),
          const SizedBox(height: Dimens.spacingXXL),
          if (widget.actions != null) ...[
            Row(
              children: [
                ...widget.actions!.mapIndexed(
                  (i, e) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: widget.actions!.length == 1 ? 0 : 16,
                      ),
                      child: e,
                    ),
                  ),
                )
              ],
            ),
          ] else ...[
            OLButton(
              focusNode: _focusNode,
              title: widget.actionLabel,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ],
      ),
    );
  }
}
