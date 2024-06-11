// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecm_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmCategoryDto _$EcmCategoryDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'EcmCategoryDto',
      json,
      ($checkedConvert) {
        final val = EcmCategoryDto(
          $checkedConvert('id', (v) => v as int),
          $checkedConvert('label', (v) => v as String),
        );
        return val;
      },
    );
