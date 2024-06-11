import 'package:freezed_annotation/freezed_annotation.dart';

part 'completed_time_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CompletedTimeDto {

  CompletedTimeDto(
    this.hours,
    this.minutes,
  );

  factory CompletedTimeDto.fromJson(Map<String, dynamic> json) =>
      _$CompletedTimeDtoFromJson(json);

  @JsonKey(name: "hours")
  final int? hours;
  @JsonKey(name: "minutes")
  final int? minutes;

}