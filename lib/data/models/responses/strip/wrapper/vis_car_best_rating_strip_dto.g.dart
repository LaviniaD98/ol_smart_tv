// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vis_car_best_rating_strip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisCarBestRatingStripDto _$VisCarBestRatingStripDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'VisCarBestRatingStripDto',
      json,
      ($checkedConvert) {
        final val = VisCarBestRatingStripDto(
          $checkedConvert(
              'topRatedLearningObjects',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      LearningObjectDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'metadata',
              (v) => v == null
                  ? null
                  : MetadataDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'items': 'topRatedLearningObjects'},
    );
