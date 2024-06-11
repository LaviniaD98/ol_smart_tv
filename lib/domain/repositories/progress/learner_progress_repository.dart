import 'package:open_learning_smart_tv/domain/entities/progress/learner_progress.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';
import '../../entities/progress/learner_goals.dart';
import '../../entities/progress/progress_goals_config_model.dart';

abstract class LearnerProgressRepository {
  Future<Either<Failure, LearnerProgressModel>> getLearnerProgress(
      String corporateId, String learnerId);
  Future<Either<Failure, LearnerGoalsModel>> getLearnerGoals(
      String corporateId, String learnerId);
  Future<Either<Failure, ProgressGoalsConfigModel>> getProgressGoalsConfig(
      String? corporateId);
}
