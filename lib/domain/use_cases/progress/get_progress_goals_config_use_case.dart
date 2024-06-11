import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/repositories/progress/learner_progress_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/progress/progress_goals_config_model.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetProgressGoalsConfigUseCase {
  final LearnerProgressRepository _repository;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  GetProgressGoalsConfigUseCase(
    this._repository,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, ProgressGoalsConfigModel>> call() async {
    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();

    return await _repository.getProgressGoalsConfig('${corporateId?.id}');
  }
}
