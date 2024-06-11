import 'package:freezed_annotation/freezed_annotation.dart';

import 'learning_plans_dto.dart';

part 'goals_config_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class GoalsConfigDto {

  GoalsConfigDto(
      this.enabled,
      this.durationInMonths,
      this.learningPlans,
      );

  factory GoalsConfigDto.fromJson(Map<String, dynamic> json) =>
      _$GoalsConfigDtoFromJson(json);

  @JsonKey()
  final bool? enabled;
  @JsonKey()
  final int? durationInMonths;
  @JsonKey()
  final LearningPlansDto? learningPlans;
}