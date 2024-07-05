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
          $checkedConvert('totalNumberOfPages', (v) => (v as num?)?.toInt()),
          $checkedConvert('totalNumberOfElements', (v) => (v as num?)?.toInt()),
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
