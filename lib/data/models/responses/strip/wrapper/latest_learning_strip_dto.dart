import 'package:json_annotation/json_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../learning_object_dto.dart';

part 'latest_learning_strip_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LatestLearningStripDto {

  LatestLearningStripDto(this.items, this.metadata);

  factory LatestLearningStripDto.fromJson(Map<String, dynamic> json) => _$LatestLearningStripDtoFromJson(json);

  @JsonKey(name: "latestLearningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}
