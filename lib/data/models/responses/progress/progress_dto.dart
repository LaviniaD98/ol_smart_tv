import 'package:freezed_annotation/freezed_annotation.dart';

import 'completed_time_dto.dart';

part 'progress_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ProgressDto {

  ProgressDto(
    this.passedDays,
    this.completedTime,
    this.summary
  );

  factory ProgressDto.fromJson(Map<String, dynamic> json) =>
      _$ProgressDtoFromJson(json);

  @JsonKey(name: "passedDays")
  final int? passedDays;
  @JsonKey(name: "completedTime")
  final CompletedTimeDto? completedTime;
  @JsonKey()
  final GoalSummary? summary;
}

enum GoalSummary{
  @JsonValue("ALMOST_THERE")  almostThere,
  @JsonValue("GOAL_ACHIEVED") goalAchieved,
  @JsonValue("GOAL_NOT_ACHIEVED") goalNotAchieved,
  @JsonValue("ON_LINE") onLine,
  @JsonValue("UNDER_LINE") underLine,
  @JsonValue("UNKNOWN") unknown,
}