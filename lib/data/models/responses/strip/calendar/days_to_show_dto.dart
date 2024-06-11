import 'package:json_annotation/json_annotation.dart';

part 'days_to_show_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class DaysToShowDto {
  DaysToShowDto(this.dayIndex, this.dayToShow);

  factory DaysToShowDto.fromJson(Map<String, dynamic> json) => _$DaysToShowDtoFromJson(json);

  @JsonKey(name: "dayIndex")
  final int? dayIndex;
  @JsonKey(name: "dayToShow")
  final List<int>? dayToShow;
}
