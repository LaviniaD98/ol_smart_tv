// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectStatisticsDto _$ObjectStatisticsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ObjectStatisticsDto',
      json,
      ($checkedConvert) {
        final val = ObjectStatisticsDto(
          $checkedConvert('learningObjectId', (v) => v as int?),
          $checkedConvert('parentId', (v) => v as int?),
          $checkedConvert('grandParentId', (v) => v as int?),
          $checkedConvert('learningObjectType', (v) => v as String?),
          $checkedConvert('averageRating', (v) => (v as num?)?.toDouble()),
          $checkedConvert('numberOfRatings', (v) => v as int?),
          $checkedConvert('numberOfFavourites', (v) => v as int?),
          $checkedConvert('numberOfComments', (v) => v as int?),
          $checkedConvert('shares', (v) => v as int?),
        );
        return val;
      },
    );
