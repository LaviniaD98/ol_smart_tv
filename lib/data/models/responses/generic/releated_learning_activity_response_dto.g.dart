// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'releated_learning_activity_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleatedLearningActivityResponseDto
    _$ReleatedLearningActivityResponseDtoFromJson(Map<String, dynamic> json) =>
        $checkedCreate(
          'ReleatedLearningActivityResponseDto',
          json,
          ($checkedConvert) {
            final val = ReleatedLearningActivityResponseDto(
              $checkedConvert(
                  'relatedLearningActivities',
                  (v) => (v as List<dynamic>?)
                      ?.map((e) =>
                          LearningObjectDto.fromJson(e as Map<String, dynamic>))
                      .toList()),
            );
            return val;
          },
        );
