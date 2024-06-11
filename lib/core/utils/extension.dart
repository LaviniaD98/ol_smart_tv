import 'dart:io';

import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:flutter/material.dart';

import '../../color_management/color_manager.dart';
import '../../domain/entities/menu/route/menu_route.dart';
import '../../domain/entities/strip/row/strip_row.dart';
import '../../domain/enums/types.dart';

extension $Path on String {
  String get path => '/$this'.replaceAll(' ', '');

  String get capitalize {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension $List on List<int> {
  DateTime? get convertToDateTime {
    if (length != 3) return null;
    return DateTime(this[0], this[1], this[2]);
  }

  String? get convertToDateTimeString {
    if (length < 3) return null;
    return this[2].toString() +
        "/" +
        this[1].toString() +
        "/" +
        this[0].toString();
  }
}

extension $LocalNotificationType on LocalNotificationType {
  Color get color =>
      {
        LocalNotificationType.welcome:
            ColorManager().getColorSystemSecondary02(),
        LocalNotificationType.welcomenp:
            ColorManager().getColorSystemSecondary02(),
        LocalNotificationType.badge: ColorManager().getColorSystemSecondary02(),
        LocalNotificationType.enroll:
            ColorManager().getColorSystemSecondary02(),
        LocalNotificationType.suggest:
            ColorManager().getColorSystemSecondary02(),
        LocalNotificationType.livevent:
            ColorManager().getColorSystemSecondary02(),
        LocalNotificationType.decline:
            ColorManager().getColorSystemSecondary03(),
        LocalNotificationType.approvalrequest:
            ColorManager().getColorSystemSecondary03(),
        LocalNotificationType.reminder:
            ColorManager().getColorSystemSecondary03(),
        LocalNotificationType.learnrem:
            ColorManager().getColorSystemSecondary03(),
        LocalNotificationType.reset: ColorManager().getColorSystemSecondary03(),
      }[this] ??
      ColorManager().getColorSystemSecondary03();
}

extension $DateUtils on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

extension $IconStatus on IconStatus {
  Color get color =>
      {
        IconStatus.mandatory: ColorManager().getColorBorderAccent(),
        IconStatus.completed:
            ColorManager().getColorBackgroundSecondaryComplete(),
        IconStatus.expired: ColorManager().getColorBackgroundWarning(),
        IconStatus.suggestedAI:
            ColorManager().getColorBackgroundSecondaryComplete(),
        IconStatus.suggestedHR:
            ColorManager().getColorBackgroundSecondaryComplete(),
      }[this] ??
      Colors.transparent;
}

extension $StripRow on StripRow {
  String get label => labelMapping != null
      ? map(
          widgetCalendar: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          widgetContinueLearning: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          visForYou: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          sliderTopContentExplore: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          trainingMandatory: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          visCarSuggested: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          visCarTrainingTransversal: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          visCarBestRating: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          latestLearning: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          favourites: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          smartLearning: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          visCarCategory: (_) => _.title ?? '',
        )
      : title ?? '';
}

extension $MenuRoute on MenuRoute {
  String get label => labelMapping != null
      ? map(
          visForYou: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          visSearch: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          visExplore: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
          visCommunity: (_) =>
              LabelsManager().getRemoteStringFromString(_.labelMapping!),
        )
      : title ?? '';
}

extension IsoDuration on Duration {
  static const _hoursInDays = 24;
  static const _minutesInHours = 60;
  static const _secondsInMinutes = 60;

  String toIso8601String() {
    final days = inDays.toInt();
    final hours = (inHours % _hoursInDays).toInt();
    final minutes = (inMinutes % _minutesInHours).toInt();
    final seconds = (inSeconds % _secondsInMinutes);

    final String daysISO = days > 0 ? '${days}D' : '';
    final String hoursISO = hours > 0 ? '${hours}H' : '';
    final String minutesISO = minutes > 0 ? '${minutes}M' : '';
    final String secondsISO =
        seconds > 0 || (days <= 0 && hours <= 0 && minutes <= 0)
            ? '${seconds}S'
            : '';
    return 'P${daysISO}T$hoursISO$minutesISO$secondsISO';
  }
}

extension $LearningObjectTypology on LearningObjectTypology {
  String get requestValue =>
      {
        LearningObjectTypology.path: LearningObjectTypology.path.name,
        LearningObjectTypology.course: LearningObjectTypology.course.name,
      }[this] ??
      'activity';
}

const kTvSize = Size(1920, 1080);

final width = WidgetsBinding.instance.window.physicalSize.width;
final pixelRatio = WidgetsBinding.instance.window.devicePixelRatio;
final isScaled = MyPlatform.isAndroidTV && kTvSize.width * pixelRatio != width;

extension ScreenSizeExtension on BuildContext {
  MediaQueryData get _mediaQueryData => MediaQuery.of(this);
  Size get screenSize => isScaled ? kTvSize : _mediaQueryData.size;
}

class MyPlatform {
  static const tvMode = 'ON'; //String.fromEnvironment('TV_MODE');

  static bool get isTv => tvMode == 'ON';

  static bool get isIOS => !isTv && Platform.isIOS;

  static bool get isAndroid => !isTv && Platform.isAndroid;

  static bool get isTVOS => isTv && Platform.isIOS;

  static bool get isAndroidTV => isTv && Platform.isAndroid;
}
