// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionsDto _$SuggestionsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SuggestionsDto',
      json,
      ($checkedConvert) {
        final val = SuggestionsDto(
          $checkedConvert(
              'results',
              (v) => (v as List<dynamic>)
                  .map((e) => SuggestionDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
