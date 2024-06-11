import 'package:open_learning_smart_tv/domain/entities/progress/progress_config_model.dart';

import '../../../data/models/responses/progress/progress_goals_config_dto.dart';
import 'goals_config_model.dart';

class ProgressGoalsConfigModel {
  ProgressGoalsConfigModel({
    this.enabled,
    this.yourProgress,
    this.yourGoals,
  });

  factory ProgressGoalsConfigModel.fromDto(ProgressGoalsConfigDto? dto) {
    return ProgressGoalsConfigModel(
      enabled: dto?.enabled,
      yourProgress: ProgressConfigModel.fromDto(dto?.yourProgress),
      yourGoals: GoalsConfigModel.fromDto(dto?.yourGoals),
    );
  }

  final bool? enabled;
  final ProgressConfigModel? yourProgress;
  final GoalsConfigModel? yourGoals;
}
