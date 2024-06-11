// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageDto _$LanguageDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'LanguageDto',
      json,
      ($checkedConvert) {
        final val = LanguageDto(
          $checkedConvert('id', (v) => v as String),
          $checkedConvert('label', (v) => v as String),
        );
        return val;
      },
    );
