import 'package:json_annotation/json_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../learning_object_dto.dart';

part 'favourites_strip_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class FavouritesStripDto {

  FavouritesStripDto(this.items, this.metadata);

  factory FavouritesStripDto.fromJson(Map<String, dynamic> json) => _$FavouritesStripDtoFromJson(json);

  @JsonKey(name: "favouriteLearningObjects")
  final List<LearningObjectDto>? items;

  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
}
