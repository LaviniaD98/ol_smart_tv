import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class GoalDto {

  GoalDto(
    this.plan,
    this.hoursPerMonth,
    this.durationInDays,
    this.totalHours,
  );

  factory GoalDto.fromJson(Map<String, dynamic> json) =>
      _$GoalDtoFromJson(json);

  @JsonKey(name: "plan")
  final String? plan;
  @JsonKey(name: "hoursPerMonth")
  final int? hoursPerMonth;
  @JsonKey(name: "durationInDays")
  final int? durationInDays;
  @JsonKey(name: "totalHours")
  final int? totalHours;
}