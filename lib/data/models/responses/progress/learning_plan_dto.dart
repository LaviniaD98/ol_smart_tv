import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_plan_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LearningPlanDto {

  LearningPlanDto(
      this.hoursPerMonth,
      );

  factory LearningPlanDto.fromJson(Map<String, dynamic> json) =>
      _$LearningPlanDtoFromJson(json);

  @JsonKey()
  final int? hoursPerMonth;
}