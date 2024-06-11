import 'package:json_annotation/json_annotation.dart';

part 'agenda_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class AgendaDto {
  AgendaDto(this.isBreak, this.item);

  factory AgendaDto.fromJson(Map<String, dynamic> json) => _$AgendaDtoFromJson(json);

  @JsonKey(name: "isBreak")
  final bool? isBreak;
  @JsonKey(name: "item")
  final String? item;
}
