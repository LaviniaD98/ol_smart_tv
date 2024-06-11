// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_results_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultsDto _$SearchResultsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchResultsDto',
      json,
      ($checkedConvert) {
        final val = SearchResultsDto(
          $checkedConvert(
              'learningObjects',
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
      fieldKeyMap: const {'items': 'learningObjects'},
    );
