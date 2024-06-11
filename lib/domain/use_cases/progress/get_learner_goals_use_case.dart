import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/repositories/progress/learner_progress_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/progress/learner_goals.dart';
import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetLearnerGoalsUseCase {
  final LearnerProgressRepository _repository;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  GetLearnerGoalsUseCase(
    this._repository,
    this._getStoredCorporateIdUseCase,
    this._getSecureStoredUserInfoUseCase,
  );

  Future<Either<Failure, LearnerGoalsModel>> call() async {
    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();

    /// Get userID
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();

    return await _repository.getLearnerGoals(
        '${corporateId?.id}', '${userInfoModel?.user?.idUser}');
  }
}
