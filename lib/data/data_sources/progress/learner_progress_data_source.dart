import '../../models/responses/progress/learner_goals_dto.dart';
import '../../models/responses/progress/learner_progress_dto.dart';
import '../../models/responses/progress/progress_goals_config_dto.dart';

abstract class LearnerProgressDataSource {
  Future<LearnerProgressDto> getLearnerProgress(String corporateId, String learnerId);
  Future<LearnerGoalsDto> getLearnerGoals(String corporateId, String learnerId);
  Future<ProgressGoalsConfigDto> getProgressGoalsConfig(String? corporateId);
}
