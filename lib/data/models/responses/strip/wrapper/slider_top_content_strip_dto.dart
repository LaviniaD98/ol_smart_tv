import 'package:json_annotation/json_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../learning_object_dto.dart';

part 'slider_top_content_strip_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SliderTopContentStripDto {

  SliderTopContentStripDto(this.items, this.metadata);

  factory SliderTopContentStripDto.fromJson(Map<String, dynamic> json) => _$SliderTopContentStripDtoFromJson(json);

  @JsonKey(name: "mainLearningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}
