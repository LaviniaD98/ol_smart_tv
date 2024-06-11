import 'package:open_learning_smart_tv/data/models/responses/progress/progress_time_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'learner_progress_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LearnerProgressDto {
  LearnerProgressDto(
    this.mandatory,
    this.suggestedByManager,
    this.suggestedByAI,
    this.suggestedByHR,
    this.total,
  );

  factory LearnerProgressDto.fromJson(Map<String, dynamic> json) =>
      _$LearnerProgressDtoFromJson(json);

  @JsonKey()
  final ProgressTimeDto? mandatory;
  @JsonKey()
  final ProgressTimeDto? suggestedByManager;
  @JsonKey()
  final ProgressTimeDto? suggestedByAI;
  @JsonKey()
  final ProgressTimeDto? suggestedByHR;
  @JsonKey()
  final ProgressTimeDto? total;
}
