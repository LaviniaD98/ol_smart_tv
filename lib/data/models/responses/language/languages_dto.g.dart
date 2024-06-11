// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'languages_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguagesDto _$LanguagesDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LanguagesDto',
      json,
      ($checkedConvert) {
        final val = LanguagesDto(
          $checkedConvert('id', (v) => v as String?),
          $checkedConvert('enable_multilanguage', (v) => v as bool),
          $checkedConvert('primary_language',
              (v) => LanguageDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'secondary_languages',
              (v) => (v as List<dynamic>)
                  .map((e) => LanguageDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'enableMultilanguage': 'enable_multilanguage',
        'primaryLanguage': 'primary_language',
        'secondaryLanguages': 'secondary_languages'
      },
    );
