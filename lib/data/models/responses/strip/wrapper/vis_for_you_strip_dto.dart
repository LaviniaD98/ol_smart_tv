import 'package:json_annotation/json_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../learning_object_dto.dart';

part 'vis_for_you_strip_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class VisForStripDto {

  VisForStripDto(this.items, this.metadata);

  factory VisForStripDto.fromJson(Map<String, dynamic> json) => _$VisForStripDtoFromJson(json);

  @JsonKey(name: "forYouLearningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}
