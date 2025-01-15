import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../color_management/color_manager.dart';
import '../../../../remote_theming/labels/labels_manager.dart';
import '../../../../remote_theming/labels/remote_labels_keys.dart';

class DurationTag extends StatelessWidget {
  const DurationTag._({
    super.key,
    required this.label,
    this.color,
    this.textStyle,
    this.hidden = false,
    this.textOnly = false,
    this.iconSize = 16.0,
  });

  factory DurationTag.fromMinutes(
    int duration, {
    Key? key,
    Color? color,
    TextStyle? textStyle,
    bool? collapseDisplay,
    double? iconSize,
    bool? textOnly,
  }) {
    return DurationTag._(
      key: key,
      color: color,
      textOnly: textOnly ?? false,
      label: _getTime(duration, collapseDisplay),
      iconSize: iconSize ?? 16.0,
      textStyle: textStyle ??
          AppTextTheme.caption(
            weight: FontWeight.w700,
            color: ColorManager().getColorTextPrimary(),
          ),
      hidden: (duration == 0),
    );
  }

  final String label;
  final Color? color;
  final TextStyle? textStyle;
  final bool hidden;
  final bool textOnly;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    if (hidden) {
      return const SizedBox.shrink();
    }

    final badge = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          "assets/icons/time.svg",
          width: iconSize,
          height: iconSize,
          colorFilter: ColorFilter.mode(
            ColorManager().getColorTextPrimary(),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 8.0),
        Text(
          label,
          style: textStyle ??
              AppTextTheme.caption(
                weight: FontWeight.w700,
                size: 12,
                color: ColorManager().getColorTextPrimary(),
              ).copyWith(height: 1),
        ),
      ],
    );

    if (textOnly) {
      return badge;
    }
    return Container(
      decoration: BoxDecoration(
        color: color ??
            ColorManager().getColorTextPrimaryCta().withValues(alpha: .5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8.0,
      ),
      child: badge,
    );
  }

  static String _getTime(int duration, bool? collapseDisplay) {
    final int days = duration ~/ 1440;
    final String? daysLabel = switch (days) {
      0 => null,
      1 => LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.day_one)
          .replaceFirst('{{count}}', '$days'),
      _ => LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.day_other)
          .replaceFirst('{{count}}', '$days'),
    };

    final int hours = (duration - days * 1440) ~/ 60;
    final String? hoursLabel = switch (hours) {
      0 => null,
      1 => LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.count_hour)
          .replaceFirst('{{count}}', '$hours'),
      _ => LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.count_hours)
          .replaceFirst('{{count}}', '$hours'),
    };

    final int minutes = (duration - days * 1440 - hours * 60);
    final String? minutesLabel = switch (minutes) {
      0 => null,
      _ => LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.read_time)
          .replaceFirst('{{count}}', '$minutes'),
    };

    if (collapseDisplay == true) {
      if (daysLabel != null) {
        final moreLabel =
            (hoursLabel != null || minutesLabel != null) ? '...' : '';
        return '$daysLabel$moreLabel';
      }
      if (hoursLabel != null) {
        final moreLabel = (minutesLabel != null) ? '...' : '';
        return '$hoursLabel$moreLabel';
      }
      return minutesLabel ?? '';
    } else {
      return [
        if (daysLabel != null) daysLabel,
        if (hoursLabel != null) hoursLabel,
        if (minutesLabel != null) minutesLabel,
      ].join(' ');
    }
  }
}
