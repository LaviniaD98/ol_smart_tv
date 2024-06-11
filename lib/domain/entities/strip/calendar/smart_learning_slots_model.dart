import 'package:open_learning_smart_tv/data/models/responses/strip/calendar/smart_learning_slots_dto.dart';

import 'days_to_show_model.dart';

class SmartLearningSlotsModel {
  SmartLearningSlotsModel({
    required this.id,
    required this.daysToShow,
    this.objectType,
    this.date,
    this.startTime,
    this.endTime,
  });

  factory SmartLearningSlotsModel.fromDto(SmartLearningSlotsDto dto) {
    final days =
        dto.daysToShow?.map((e) => DaysToShowModel.fromDto(e)).toList() ?? [];
    final date = days.first.dayToShow;
    final startTime = _timeFormat(dto.startTime);
    final endTime = _timeFormat(dto.endTime);
    final start = date
        ?.add(Duration(hours: startTime?.$1 ?? 0, minutes: startTime?.$2 ?? 0));
    final end =
        date?.add(Duration(hours: endTime?.$1 ?? 0, minutes: endTime?.$2 ?? 0));

    return SmartLearningSlotsModel(
      id: dto.id,
      objectType: dto.objectType,
      daysToShow: days,
      date: date,
      startTime: start,
      endTime: end,
    );
  }

  final int id;
  final String? objectType;
  final List<DaysToShowModel> daysToShow;
  final DateTime? date;
  final DateTime? startTime;
  final DateTime? endTime;

  static (int, int)? _timeFormat(String? value) {
    if (value == null) return null;
    final hours = value.split(':').first;
    final minutes = value.split(':').last;
    return (int.parse(hours), int.parse(minutes));
  }
}
