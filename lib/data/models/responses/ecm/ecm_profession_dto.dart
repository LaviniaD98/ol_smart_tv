import 'package:json_annotation/json_annotation.dart';

part 'ecm_profession_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class EcmProfessionDto {
  EcmProfessionDto(this.id, this.identifier, this.name);

  factory EcmProfessionDto.fromJson(Map<String, dynamic> json) => _$EcmProfessionDtoFromJson(json);

  @JsonKey()
  final int id;
  @JsonKey()
  final String? identifier;
  @JsonKey()
  final String name;
}
