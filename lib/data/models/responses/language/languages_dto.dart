import 'package:json_annotation/json_annotation.dart';

import 'language_dto.dart';

part 'languages_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LanguagesDto {
  LanguagesDto(
    this.id,
    this.enableMultilanguage,
    this.primaryLanguage,
    this.secondaryLanguages,
  );

  factory LanguagesDto.fromJson(Map<String, dynamic> json) =>
      _$LanguagesDtoFromJson(json);

  @JsonKey()
  final String? id;

  @JsonKey(name: 'enable_multilanguage')
  final bool enableMultilanguage;

  @JsonKey(name: 'primary_language')
  final LanguageDto primaryLanguage;

  @JsonKey(name: 'secondary_languages')
  final List<LanguageDto> secondaryLanguages;
}
