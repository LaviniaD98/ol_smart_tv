import 'package:json_annotation/json_annotation.dart';

part 'uog_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class UogDto {
  UogDto(this.uog, this.uogDescription);

  factory UogDto.fromJson(Map<String, dynamic> json) => _$UogDtoFromJson(json);

  @JsonKey(name: "uog")
  final String? uog;
  @JsonKey(name: "uog_description")
  final String? uogDescription;
}
