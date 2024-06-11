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
          $checkedConvert('totalNumberOfPages', (v) => v as int?),
          $checkedConvert('totalNumberOfElements', (v) => v as int?),
          $checkedConvert(
              'learnerObjectList',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      LearnerObjectDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
