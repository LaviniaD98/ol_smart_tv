import 'package:freezed_annotation/freezed_annotation.dart';

import '../generic/metadata_dto.dart';
import '../strip/learning_object_dto.dart';

part 'search_results_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SearchResultsDto {
  SearchResultsDto(this.items, this.metadata);

  factory SearchResultsDto.fromJson(Map<String, dynamic> json) => _$SearchResultsDtoFromJson(json);

  @JsonKey(name: "learningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}