import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/repositories/detail/detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../entities/user/user_info_model.dart';
import '../../enums/types.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class RemoveFavouritesUseCase {
  final DetailRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  RemoveFavouritesUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, void>> call({
    required LearningObjectTypology learningObjectTypology,
    int? id,
    String? parentId,
    String? grandParentId,
  }) async {
    /// Get initiativeId
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? idUser = userInfoModel?.user?.idUser;
    int? initiativeId = userInfoModel?.initiativeId;

    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();
    String path =
        "favourites/learner/{learnerId}/learning-object/{learningObjectId}/favourite?corporate-id={corporateId}&domain-id={domainId}&learning-object-type={learningObjectType}&parentId={parentId}&grandParentId={grandParentId}"
            .replaceFirst('{learnerId}', '$idUser')
            .replaceFirst('{learningObjectId}', '$id')
            .replaceFirst('{corporateId}', '${corporateId?.id}')
            .replaceFirst('{domainId}', '$initiativeId')
            .replaceFirst(
                '{learningObjectType}', learningObjectTypology.requestValue)
            .replaceFirst('{parentId}', parentId ?? '')
            .replaceFirst('{grandParentId}', grandParentId ?? '');
    return await _repository.removeLearningObjectFromFavourites(path);
  }
}
