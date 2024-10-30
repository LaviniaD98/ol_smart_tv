import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';

import '../../../../theme/app_theme.dart';
import 'dialog_page.dart';
import 'package:collection/collection.dart';

class OlAlertDialog extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String message;
  final String actionLabel;
  final List<Widget>? actions;
  final bool actionsHidden;
  final double? minHeight;
  final double? minWidth;
  final Color? color;

  const OlAlertDialog._({
    required this.title,
    required this.message,
    required this.actionLabel,
    this.subtitle,
    this.actions,
    this.actionsHidden = false,
    this.minHeight,
    this.minWidth,
    this.color,
  });

  static Future<dynamic> show(
    BuildContext context, {
    required String title,
    required String message,
    required String actionLabel,
    List<Widget>? actions,
    bool barrierDismissible = true,
    bool actionsHidden = false,
    double? minHeight,
    double? minWidth,
    String? subtitle,
    Color? color,
  }) async {
    Navigator.of(context).push(
      DialogPage(
        barrierDismissible: barrierDismissible,
        builder: (context) => OlAlertDialog._(
          title: title,
          message: message,
          actionLabel: actionLabel,
          actions: actions,
          actionsHidden: actionsHidden,
          minHeight: minHeight,
          minWidth: minWidth,
          subtitle: subtitle,
          color: color,
        ),
      ).createRoute(context),
    );
  }

  static Future<dynamic> showDetails(
    BuildContext context, {
    required String title,
    required String message,
    required String actionLabel,
    List<Widget>? actions,
    bool barrierDismissible = true,
    bool actionsHidden = false,
    double? minHeight,
    String? subtitle,
    Color? color,
  }) async {
    Navigator.of(context).push(
      DialogPage(
        barrierDismissible: barrierDismissible,
        backgroundColor: color,
        builder: (context) => OlAlertDialog._(
          title: title,
          message: message,
          actionLabel: actionLabel,
          actions: actions,
          actionsHidden: actionsHidden,
          minHeight: minHeight,
          minWidth: 900,
          subtitle: subtitle,
          color: color,
        ),
      ).createRoute(context),
    );
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
      constraints: const BoxConstraints().copyWith(
        minHeight: widget.minHeight,
        minWidth: widget.minWidth ?? 500,
        maxWidth: widget.minWidth ?? 500,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: AppTextTheme.dialogTitle(
                color: ColorManager().getColorTextPrimary(),
              ).copyWith(fontSize: 32),
            ),
            const SizedBox(height: Dimens.spacingM),
            if (widget.subtitle != null &&
                widget.subtitle?.isNotEmpty == true) ...[
              Text(
                widget.subtitle!,
                textAlign: TextAlign.center,
                style: AppTextTheme.title(
                  color: ColorManager().getColorTextPrimaryCta(),
                  size: 24,
                ),
              ),
            ],
            const SizedBox(height: Dimens.spacingM),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: AppTextTheme.body(
                  color: ColorManager().getColorTextPrimary()),
            ),
            const SizedBox(height: Dimens.spacingXXL),
            if (widget.actionsHidden == false) ...[
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
          ],
        ),
      ),
    );
  }
}
