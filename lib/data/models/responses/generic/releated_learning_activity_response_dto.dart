import 'package:open_learning_smart_tv/data/models/responses/strip/learning_object_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'releated_learning_activity_response_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ReleatedLearningActivityResponseDto {
  ReleatedLearningActivityResponseDto(this.relatedLearningActivities);

  factory ReleatedLearningActivityResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$ReleatedLearningActivityResponseDtoFromJson(json);

  @JsonKey(name: "relatedLearningActivities")
  final List<LearningObjectDto>? relatedLearningActivities;
}
