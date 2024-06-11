import 'package:json_annotation/json_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../learning_object_dto.dart';

part 'vis_car_training_transversal_strip_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class VisCarTrainingTransversalStripDto {

  VisCarTrainingTransversalStripDto(this.items, this.metadata);

  factory VisCarTrainingTransversalStripDto.fromJson(Map<String, dynamic> json) => _$VisCarTrainingTransversalStripDtoFromJson(json);

  @JsonKey(name: "otherLearningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}
