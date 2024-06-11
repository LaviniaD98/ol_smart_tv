import 'package:open_learning_smart_tv/domain/entities/progress/progress_model.dart';

import '../../../data/models/responses/progress/learner_goals_dto.dart';
import 'goal_model.dart';

class LearnerGoalsModel {
  LearnerGoalsModel({
    this.goal,
    this.progress,
  });

  factory LearnerGoalsModel.fromResponse(LearnerGoalsDto? response) {
    return LearnerGoalsModel(
      goal: GoalModel.fromResponse(response?.goal),
      progress: ProgressModel.fromResponse(response?.progress),
    );
  }

  final GoalModel? goal;
  final ProgressModel? progress;
}
