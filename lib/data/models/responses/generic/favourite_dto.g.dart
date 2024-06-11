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
          $checkedConvert('corporateId', (v) => v as int?),
          $checkedConvert('domainId', (v) => v as int?),
          $checkedConvert('learnerId', (v) => v as int?),
          $checkedConvert('learningObjectId', (v) => v as int?),
          $checkedConvert('parentId', (v) => v as int?),
          $checkedConvert('grandParentId', (v) => v as int?),
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
