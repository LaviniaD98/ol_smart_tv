// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_strip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouritesStripDto _$FavouritesStripDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FavouritesStripDto',
      json,
      ($checkedConvert) {
        final val = FavouritesStripDto(
          $checkedConvert(
              'favouriteLearningObjects',
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
      fieldKeyMap: const {'items': 'favouriteLearningObjects'},
    );
