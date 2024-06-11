import 'package:json_annotation/json_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../learning_object_dto.dart';

part 'training_mandatory_strip_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class TrainingMandatoryStripDto {

  TrainingMandatoryStripDto(this.items, this.metadata);

  factory TrainingMandatoryStripDto.fromJson(Map<String, dynamic> json) => _$TrainingMandatoryStripDtoFromJson(json);

  @JsonKey(name: "mandatoryLearningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}
