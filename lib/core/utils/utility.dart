import 'package:intl/intl.dart';

import '../../domain/entities/community/attachments_model.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';

String formatPostDate(DateTime? datetime) {
  if (datetime == null) return '--';

  final dateDifference = DateTime.now().difference(datetime);

  if (dateDifference.inHours < 1) {
    return LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.now);
  } else if (dateDifference.inHours < 2) {
    return LabelsManager()
        .getRemoteStringFromLabelKeys(RemoteLabelKeys.hour_ago)
        .replaceFirst('{{count}}', '${dateDifference.inHours}');
  }
  if (dateDifference.inHours < 24) {
    return LabelsManager()
        .getRemoteStringFromLabelKeys(RemoteLabelKeys.hours_ago)
        .replaceFirst('{{count}}', '${dateDifference.inHours}');
  }
  if (dateDifference.inHours < 48) {
    return LabelsManager()
        .getRemoteStringFromLabelKeys(RemoteLabelKeys.day_ago)
        .replaceFirst('{{count}}', '${dateDifference.inDays}');
  }
  if (dateDifference.inHours < 168) {
    return LabelsManager()
        .getRemoteStringFromLabelKeys(RemoteLabelKeys.days_ago)
        .replaceFirst('{{count}}', '${dateDifference.inDays}');
  }
  if (dateDifference.inHours < 336) {
    return LabelsManager()
        .getRemoteStringFromLabelKeys(RemoteLabelKeys.week_ago)
        .replaceFirst('{{count}}', '${dateDifference.inDays ~/ 7}');
  }
  return DateFormat("dd/MM/yyyy").format(datetime);
}

String formatReadingTime(String? body, AttachmentsModel? attachments) {
  int videoDuration = 0;
  final duration = attachments?.brightcove?.duration;
  if (duration != null && duration.isNotEmpty) {
    videoDuration += int.parse(attachments!.brightcove!.duration!);
  }
  final bodyLength = (RegExp('[\\w-]+').allMatches(body ?? '').length) ~/ 2;
  final totalLength = bodyLength + videoDuration;

  return switch (totalLength) {
    < 60 => //Seconds
      LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.sec)
          .replaceFirst('{{count}}', '$totalLength'),
    < (60 * 60) => //Minutes
      "${(totalLength / 60.0).round()} ${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.min)}",
    < (60 * 60) * 2 => //Hour
      LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.hour_one)
          .replaceFirst('{{count}}', '1'),
    _ => //Hours
      LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.hour_other)
          .replaceFirst(
              '{{count}}', '${(totalLength / (60.0 * 60.0)).round()}'),
  };
}

String convertMinutesToHours(int duration) {
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
    1 => LabelsManager()
        .getRemoteStringFromLabelKeys(RemoteLabelKeys.minutes_one)
        .replaceFirst('{{count}}', '$minutes'),
    _ => LabelsManager()
        .getRemoteStringFromLabelKeys(RemoteLabelKeys.minutes_other)
        .replaceFirst('{{count}}', '$minutes'),
  };

  return [
    if (daysLabel != null) daysLabel,
    if (hoursLabel != null) hoursLabel,
    if (minutesLabel != null) minutesLabel,
  ].join(' ');
}
