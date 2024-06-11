import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';

class DialogPage<T> extends Page<T> {
  static String routeName = 'dialog';

  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final WidgetBuilder builder;
  final EdgeInsets? insetPadding;

  const DialogPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    this.insetPadding,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        builder: (context) => Dialog(
          insetPadding: insetPadding ?? const EdgeInsets.all(Dimens.spacingL),
          child: builder(context),
        ),
        anchorPoint: anchorPoint,
        barrierColor: barrierColor ??
            ColorManager().getColorBackgroundDrawerWidget().withOpacity(.5),
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        themes: themes,
      );
}
