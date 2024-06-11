import 'package:json_annotation/json_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../learning_object_dto.dart';

part 'vis_car_best_rating_strip_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class VisCarBestRatingStripDto {

  VisCarBestRatingStripDto(this.items, this.metadata);

  factory VisCarBestRatingStripDto.fromJson(Map<String, dynamic> json) => _$VisCarBestRatingStripDtoFromJson(json);

  @JsonKey(name: "topRatedLearningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}
