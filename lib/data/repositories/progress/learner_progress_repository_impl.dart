
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/progress/learner_goals.dart';
import '../../../domain/entities/progress/learner_progress.dart';
import '../../../domain/entities/progress/progress_goals_config_model.dart';
import '../../../domain/repositories/progress/learner_progress_repository.dart';
import '../../data_sources/progress/learner_progress_data_source.dart';
import '../../models/failure.dart';

@LazySingleton(as: LearnerProgressRepository)
class LearnerProgressRepositoryImpl implements LearnerProgressRepository {
  final LearnerProgressDataSource _learnerProgressSource;

  LearnerProgressRepositoryImpl(this._learnerProgressSource);

  @override
  Future<Either<Failure, LearnerProgressModel>> getLearnerProgress(String corporateId, String learnerId) {
    return catchFailure(() async {
      final res = await _learnerProgressSource.getLearnerProgress(corporateId, learnerId);
      return LearnerProgressModel.fromResponse(res);
    });
  }

  @override
  Future<Either<Failure, LearnerGoalsModel>> getLearnerGoals(String corporateId, String learnerId) {
    return catchFailure(() async {
      final res = await _learnerProgressSource.getLearnerGoals(corporateId, learnerId);
      return LearnerGoalsModel.fromResponse(res);
    });
  }

  @override
  Future<Either<Failure, ProgressGoalsConfigModel>> getProgressGoalsConfig(String? corporateId) {
    return catchFailure(() async {
      final res = await _learnerProgressSource.getProgressGoalsConfig(corporateId);
      return ProgressGoalsConfigModel.fromDto(res);
    });
  }
}