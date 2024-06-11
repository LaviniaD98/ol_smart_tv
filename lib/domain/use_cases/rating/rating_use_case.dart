import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/repositories/rating/rating_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/detail/detail_page_model.dart';
import '../../entities/rating/rating_model.dart';
import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class RatingUseCase {
  final RatingRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  RatingUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, RatingModel>> call(
      DetailPageModel detailPageModel, int rating) async {
    /// Get initiativeId
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? idUser = userInfoModel?.user?.idUser;
    int? initiativeId = userInfoModel?.initiativeId;

    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();

    String path =
        "social-rating/learner/{learnerId}/learning-object/{learningObjectId}/rating?corporate-id={corporateId}&domain-id={domainId}&learning-object-type={learningObjectType}"
            .replaceFirst('{learnerId}', '$idUser')
            .replaceFirst('{learningObjectId}', '${detailPageModel.id}')
            .replaceFirst('{corporateId}', '${corporateId?.id}')
            .replaceFirst('{domainId}', '$initiativeId')
            .replaceFirst('{learningObjectType}',
                detailPageModel.learningObjectTypology.requestValue);

    return await _repository.rateLearningObject(path, rating);
  }
}
