import 'package:json_annotation/json_annotation.dart';

import 'days_to_show_dto.dart';

part 'smart_learning_slots_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SmartLearningSlotsDto {
  SmartLearningSlotsDto(
    this.id,
    this.objectType,
    this.daysToShow,
    this.startTime,
    this.endTime,
  );

  factory SmartLearningSlotsDto.fromJson(Map<String, dynamic> json) => _$SmartLearningSlotsDtoFromJson(json);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'objectType')
  final String? objectType;
  @JsonKey(name: 'daysToShow')
  final List<DaysToShowDto>? daysToShow;
  @JsonKey(name: 'startTime')
  final String? startTime;
  @JsonKey(name: 'endTime')
  final String? endTime;
}
