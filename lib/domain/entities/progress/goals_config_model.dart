import '../../../data/models/responses/progress/goals_config_dto.dart';
import 'learning_plans_model.dart';

class GoalsConfigModel {

  GoalsConfigModel({
    this.enabled,
    this.durationInMonths,
    this.learningPlans,
  });

  factory GoalsConfigModel.fromDto(GoalsConfigDto? dto) {
    return GoalsConfigModel(
      enabled: dto?.enabled,
      durationInMonths: dto?.durationInMonths,
      learningPlans: LearningPlansModel.fromDto(dto?.learningPlans),
    );
  }

  final bool? enabled;
  final int? durationInMonths;
  final LearningPlansModel? learningPlans;
}