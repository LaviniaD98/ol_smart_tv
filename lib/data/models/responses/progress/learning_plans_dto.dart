import 'package:freezed_annotation/freezed_annotation.dart';

import 'learning_plan_dto.dart';

part 'learning_plans_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LearningPlansDto {

  LearningPlansDto(
      this.starter,
      this.advanced,
      this.master,
      );

  factory LearningPlansDto.fromJson(Map<String, dynamic> json) =>
      _$LearningPlansDtoFromJson(json);

  @JsonKey()
  final LearningPlanDto? starter;
  @JsonKey()
  final LearningPlanDto? advanced;
  @JsonKey()
  final LearningPlanDto? master;
}