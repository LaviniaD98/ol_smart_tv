import 'package:open_learning_smart_tv/data/models/responses/generic/learner_object_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'rating_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class RatingDto {
  RatingDto(this.corporateId, this.domainId, this.totalNumberOfPages,
      this.totalNumberOfElements, this.learnerObjectList);

  factory RatingDto.fromJson(Map<String, dynamic> json) =>
      _$RatingDtoFromJson(json);

  @JsonKey()
  final int? corporateId;
  @JsonKey()
  final int? domainId;
  @JsonKey()
  final int? totalNumberOfPages;
  @JsonKey()
  final int? totalNumberOfElements;
  @JsonKey()
  final List<LearnerObjectDto>? learnerObjectList;
}
