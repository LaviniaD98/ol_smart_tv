import 'package:json_annotation/json_annotation.dart';

part 'language_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LanguageDto {
  LanguageDto(this.id, this.label);

  factory LanguageDto.fromJson(Map<String, dynamic> json) =>
      _$LanguageDtoFromJson(json);

  @JsonKey()
  final String id;

  @JsonKey()
  final String label;
}
