import 'package:open_learning_smart_tv/data/models/responses/progress/progress_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'goal_dto.dart';

part 'learner_goals_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LearnerGoalsDto {
  LearnerGoalsDto(
    this.goal,
    this.progress,
  );

  factory LearnerGoalsDto.fromJson(Map<String, dynamic> json) =>
      _$LearnerGoalsDtoFromJson(json);

  @JsonKey()
  final GoalDto? goal;
  @JsonKey()
  final ProgressDto? progress;
}
