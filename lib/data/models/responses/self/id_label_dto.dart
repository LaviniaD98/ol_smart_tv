import 'package:json_annotation/json_annotation.dart';

part 'id_label_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class IdLabelDto {
  IdLabelDto(this.id, this.label);

  factory IdLabelDto.fromJson(Map<String, dynamic> json) => _$IdLabelDtoFromJson(json);

  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "label")
  final String? label;
}
