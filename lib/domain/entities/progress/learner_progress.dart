import 'package:open_learning_smart_tv/domain/entities/progress/progress_time_model.dart';

import '../../../data/models/responses/progress/learner_progress_dto.dart';

class LearnerProgressModel {
  LearnerProgressModel({
    this.mandatory,
    this.suggestedByManager,
    this.suggestedByAI,
    this.suggestedByHR,
    this.total,
  });

  factory LearnerProgressModel.fromResponse(LearnerProgressDto response) {
    return LearnerProgressModel(
      mandatory: response.mandatory != null
          ? ProgressTimeModel.fromResponse(response.mandatory)
          : null,
      suggestedByManager: response.suggestedByManager != null
          ? ProgressTimeModel.fromResponse(response.suggestedByManager)
          : null,
      suggestedByAI: response.suggestedByAI != null
          ? ProgressTimeModel.fromResponse(response.suggestedByAI)
          : null,
      suggestedByHR: response.suggestedByHR != null
          ? ProgressTimeModel.fromResponse(response.suggestedByHR)
          : null,
      total: response.total != null
          ? ProgressTimeModel.fromResponse(response.total)
          : null,
    );
  }

  final ProgressTimeModel? mandatory;
  final ProgressTimeModel? suggestedByManager;
  final ProgressTimeModel? suggestedByAI;
  final ProgressTimeModel? suggestedByHR;
  final ProgressTimeModel? total;
}
