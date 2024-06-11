// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vis_car_category_strip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisCarCategoryStripDto _$VisCarCategoryStripDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'VisCarCategoryStripDto',
      json,
      ($checkedConvert) {
        final val = VisCarCategoryStripDto(
          $checkedConvert(
              'categoryLinkedLearningObjects',
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
      fieldKeyMap: const {'items': 'categoryLinkedLearningObjects'},
    );
