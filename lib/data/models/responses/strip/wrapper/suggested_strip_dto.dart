
import 'package:json_annotation/json_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../learning_object_dto.dart';

part 'suggested_strip_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SuggestedStripDto {

  SuggestedStripDto(this.items, this.metadata);

  factory SuggestedStripDto.fromJson(Map<String, dynamic> json) => _$SuggestedStripDtoFromJson(json);

  @JsonKey(name: "suggestedLearningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}
