import 'package:json_annotation/json_annotation.dart';

part 'slot_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SlotDto {
  SlotDto(
    this.id,
    this.startDate,
    this.endDate,
  );

  factory SlotDto.fromJson(Map<String, dynamic> json) => _$SlotDtoFromJson(json);

  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "start_date")
  final String startDate;
  @JsonKey(name: "end_date")
  final String endDate;
}
