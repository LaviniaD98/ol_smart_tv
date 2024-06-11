import 'package:open_learning_smart_tv/data/models/responses/progress/progress_config_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'goals_config_dto.dart';

part 'progress_goals_config_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ProgressGoalsConfigDto {
  ProgressGoalsConfigDto(
    this.enabled,
    this.yourProgress,
    this.yourGoals,
  );

  factory ProgressGoalsConfigDto.fromJson(Map<String, dynamic> json) =>
      _$ProgressGoalsConfigDtoFromJson(json);

  @JsonKey()
  final bool? enabled;
  @JsonKey()
  final ProgressConfigDto? yourProgress;
  @JsonKey()
  final GoalsConfigDto? yourGoals;
}
