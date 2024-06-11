import 'package:json_annotation/json_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../learning_object_dto.dart';

part 'smart_learning_strip_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SmartLearningStripDto {

  SmartLearningStripDto(this.items, this.metadata);

  factory SmartLearningStripDto.fromJson(Map<String, dynamic> json) => _$SmartLearningStripDtoFromJson(json);

  @JsonKey(name: "smartLearningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}
