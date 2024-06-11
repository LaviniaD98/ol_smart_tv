import 'package:open_learning_smart_tv/data/models/responses/generic/object_statistics_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/user_rating_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'learner_object_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LearnerObjectDto {
  LearnerObjectDto(
    this.objectStatistics,
    this.userRating,
  );

  factory LearnerObjectDto.fromJson(Map<String, dynamic> json) =>
      _$LearnerObjectDtoFromJson(json);

  @JsonKey()
  final ObjectStatisticsDto? objectStatistics;
  @JsonKey()
  final UserRatingDto? userRating;
}
