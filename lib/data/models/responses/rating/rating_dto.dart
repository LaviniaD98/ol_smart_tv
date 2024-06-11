import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class RatingDto {
  RatingDto(
    this.corporateId,
    this.domainId,
    this.learnerId,
    this.learningObjectId,
    this.rating,
    this.lastRated,
    this.learningObjectType,
  );

  factory RatingDto.fromJson(Map<String, dynamic> json) =>
      _$RatingDtoFromJson(json);

  @JsonKey()
  final int? corporateId;
  @JsonKey()
  final int? domainId;
  @JsonKey()
  final int? learnerId;
  @JsonKey()
  final int? learningObjectId;
  @JsonKey()
  final int? rating;
  @JsonKey()
  final String? lastRated;
  @JsonKey()
  final LearningObjectType? learningObjectType;
}
