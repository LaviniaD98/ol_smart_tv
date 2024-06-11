
import '../../../data/models/responses/progress/progress_dto.dart';
import 'completed_time_model.dart';

class ProgressModel {
  ProgressModel({
    this.passedDays,
    this.completedTime,
    this.summary,
  });

  factory ProgressModel.fromResponse(ProgressDto? response) {
    return ProgressModel(
      passedDays: response?.passedDays,
      completedTime: CompletedTimeModel.fromResponse(response?.completedTime),
      summary: response?.summary,
    );
  }

  final int? passedDays;
  final CompletedTimeModel? completedTime;
  final GoalSummary? summary;
}