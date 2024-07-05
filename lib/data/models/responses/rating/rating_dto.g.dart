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
          $checkedConvert('corporateId', (v) => (v as num?)?.toInt()),
          $checkedConvert('domainId', (v) => (v as num?)?.toInt()),
          $checkedConvert('learnerId', (v) => (v as num?)?.toInt()),
          $checkedConvert('learningObjectId', (v) => (v as num?)?.toInt()),
          $checkedConvert('rating', (v) => (v as num?)?.toInt()),
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
