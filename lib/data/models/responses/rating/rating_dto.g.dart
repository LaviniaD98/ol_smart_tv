// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingDto _$RatingDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'RatingDto',
      json,
      ($checkedConvert) {
        final val = RatingDto(
          $checkedConvert('corporateId', (v) => v as int?),
          $checkedConvert('domainId', (v) => v as int?),
          $checkedConvert('learnerId', (v) => v as int?),
          $checkedConvert('learningObjectId', (v) => v as int?),
          $checkedConvert('rating', (v) => v as int?),
          $checkedConvert('lastRated', (v) => v as String?),
          $checkedConvert('learningObjectType',
              (v) => $enumDecodeNullable(_$LearningObjectTypeEnumMap, v)),
        );
        return val;
      },
    );

const _$LearningObjectTypeEnumMap = {
  LearningObjectType.async: 'ASYNC',
  LearningObjectType.blended: 'BLENDED',
  LearningObjectType.physicalClass: 'DA_PHYSICAL_CLASS',
  LearningObjectType.virtualClass: 'DA_VIRTUAL_CLASS',
  LearningObjectType.sync: 'SYNC',
  LearningObjectType.unknown: 'unknown',
};
