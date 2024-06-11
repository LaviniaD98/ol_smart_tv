import 'package:json_annotation/json_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../learning_object_dto.dart';

part 'vis_car_category_strip_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class VisCarCategoryStripDto {

  VisCarCategoryStripDto(this.items, this.metadata);

  factory VisCarCategoryStripDto.fromJson(Map<String, dynamic> json) => _$VisCarCategoryStripDtoFromJson(json);

  @JsonKey(name: "categoryLinkedLearningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}
