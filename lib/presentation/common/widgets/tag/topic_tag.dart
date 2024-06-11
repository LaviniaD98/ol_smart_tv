import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';

class TopicTag extends StatelessWidget {
  final String label;
  final EdgeInsets? margin;
  final BoxFit? boxFit;
  final Color? color;
  final BoxConstraints? constraints;

  const TopicTag({
    super.key,
    required this.label,
    this.margin,
    this.boxFit,
    this.constraints,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final child = Container(
      margin: margin,
      constraints: constraints,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: ColorManager().getColorSystemPrimary01()),
          borderRadius: BorderRadius.circular(Dimens.radiusImage)),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8.0,
      ),
      child: Text(
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        label.toUpperCase(),
        style: AppTextTheme.caption(
            weight: FontWeight.w700,
            color: ColorManager().getColorTextPrimary()),
      ),
    );
    if (boxFit != null) {
      return FittedBox(
        fit: boxFit!,
        child: child,
      );
    }
    return child;
  }
}
