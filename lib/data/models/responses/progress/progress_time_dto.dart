import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_time_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ProgressTimeDto {

  ProgressTimeDto(
      this.hours,
      this.completedHours,
      );

  factory ProgressTimeDto.fromJson(Map<String, dynamic> json) =>
      _$ProgressTimeDtoFromJson(json);

  @JsonKey()
  final double? hours;
  @JsonKey()
  final double? completedHours;
}