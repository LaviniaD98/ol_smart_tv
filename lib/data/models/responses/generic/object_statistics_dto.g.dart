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
          $checkedConvert('learningObjectId', (v) => (v as num?)?.toInt()),
          $checkedConvert('parentId', (v) => (v as num?)?.toInt()),
          $checkedConvert('grandParentId', (v) => (v as num?)?.toInt()),
          $checkedConvert('learningObjectType', (v) => v as String?),
          $checkedConvert('averageRating', (v) => (v as num?)?.toDouble()),
          $checkedConvert('numberOfRatings', (v) => (v as num?)?.toInt()),
          $checkedConvert('numberOfFavourites', (v) => (v as num?)?.toInt()),
          $checkedConvert('numberOfComments', (v) => (v as num?)?.toInt()),
          $checkedConvert('shares', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );
