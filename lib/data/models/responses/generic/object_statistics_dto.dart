import 'package:freezed_annotation/freezed_annotation.dart';
part 'object_statistics_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ObjectStatisticsDto {
  ObjectStatisticsDto(
      this.learningObjectId,
      this.parentId,
      this.grandParentId,
      this.learningObjectType,
      this.averageRating,
      this.numberOfRatings,
      this.numberOfFavourites,
      this.numberOfComments,
      this.shares
      );

  factory ObjectStatisticsDto.fromJson(Map<String, dynamic> json) =>
      _$ObjectStatisticsDtoFromJson(json);

  @JsonKey()
  final int? learningObjectId;
  @JsonKey()
  final int? parentId;
  @JsonKey()
  final int? grandParentId;
  @JsonKey()
  final String? learningObjectType;
  @JsonKey()
  final double? averageRating;
  @JsonKey()
  final int? numberOfRatings;
  @JsonKey()
  final int? numberOfFavourites;
  @JsonKey()
  final int? numberOfComments;
  @JsonKey()
  final int? shares;

}