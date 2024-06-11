import 'package:open_learning_smart_tv/data/models/responses/search/suggestion_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suggestions_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SuggestionsDto {
  SuggestionsDto(this.results);

  factory SuggestionsDto.fromJson(Map<String, dynamic> json) =>
      _$SuggestionsDtoFromJson(json);

  @JsonKey(name: "results")
  final List<SuggestionDto> results;
}
