// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rating_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRatingDto _$UserRatingDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UserRatingDto',
      json,
      ($checkedConvert) {
        final val = UserRatingDto(
          $checkedConvert('learnerId', (v) => v as int?),
          $checkedConvert('rating', (v) => v as int?),
          $checkedConvert('isFavouriteForLearner', (v) => v as int?),
          $checkedConvert('lastRated', (v) => v as String?),
        );
        return val;
      },
    );
