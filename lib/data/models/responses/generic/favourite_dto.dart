import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class FavouriteDto {
  FavouriteDto(
      this.corporateId,
      this.domainId,
      this.learnerId,
      this.learningObjectId,
      this.parentId,
      this.grandParentId,
      this.learningObjectType,
      this.dateOfAdditionToFavourites);

  factory FavouriteDto.fromJson(Map<String, dynamic> json) =>
      _$FavouriteDtoFromJson(json);

  @JsonKey()
  final int? corporateId;
  @JsonKey()
  final int? domainId;
  @JsonKey()
  final int? learnerId;
  @JsonKey()
  final int? learningObjectId;
  @JsonKey()
  final int? parentId;
  @JsonKey()
  final int? grandParentId;
  @JsonKey(unknownEnumValue: LearningObjectType.unknown)
  final LearningObjectType? learningObjectType;
  @JsonKey()
  final String? dateOfAdditionToFavourites;
}
