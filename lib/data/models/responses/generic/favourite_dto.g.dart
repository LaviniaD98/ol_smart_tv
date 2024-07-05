// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteDto _$FavouriteDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FavouriteDto',
      json,
      ($checkedConvert) {
        final val = FavouriteDto(
          $checkedConvert('corporateId', (v) => (v as num?)?.toInt()),
          $checkedConvert('domainId', (v) => (v as num?)?.toInt()),
          $checkedConvert('learnerId', (v) => (v as num?)?.toInt()),
          $checkedConvert('learningObjectId', (v) => (v as num?)?.toInt()),
          $checkedConvert('parentId', (v) => (v as num?)?.toInt()),
          $checkedConvert('grandParentId', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'learningObjectType',
              (v) => $enumDecodeNullable(_$LearningObjectTypeEnumMap, v,
                  unknownValue: LearningObjectType.unknown)),
          $checkedConvert('dateOfAdditionToFavourites', (v) => v as String?),
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
