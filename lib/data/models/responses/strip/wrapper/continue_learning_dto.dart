
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../learning_object_dto.dart';

part 'continue_learning_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ContinueLearningDto {
  ContinueLearningDto(this.items, this.metadata);

  factory ContinueLearningDto.fromJson(Map<String, dynamic> json) => _$ContinueLearningDtoFromJson(json);

  @JsonKey(name: "onGoingLearningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}