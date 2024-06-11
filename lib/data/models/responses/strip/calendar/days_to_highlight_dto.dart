import 'package:json_annotation/json_annotation.dart';

part 'days_to_highlight_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class DaysToHighlightDto {
  DaysToHighlightDto(
    this.day,
    this.areThereMandatoryLO,
    this.areThereLiveLO,
    this.areThereSmartSlots,
  );

  factory DaysToHighlightDto.fromJson(Map<String, dynamic> json) => _$DaysToHighlightDtoFromJson(json);

  @JsonKey(name: 'day')
  final int? day;
  @JsonKey(name: 'areThereMandatoryLO')
  final bool? areThereMandatoryLO;
  @JsonKey(name: 'areThereLiveLO')
  final bool? areThereLiveLO;
  @JsonKey(name: 'areThereSmartSlots')
  final bool? areThereSmartSlots;
}
