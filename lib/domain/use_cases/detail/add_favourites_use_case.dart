import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/favourite_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/detail/detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class AddFavouritesUseCase {
  final DetailRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  AddFavouritesUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, FavouriteModel>> call({
    required LearningObjectModel model,
    String? parentId,
    String? grandParentId,
  }) async {
    /// Get initiativeId
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? idUser = userInfoModel?.user?.idUser;
    int? initiativeId = userInfoModel?.initiativeId;

    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();

    String parId =
        (parentId != null && parentId.toLowerCase() != "null") ? parentId : "";
    String gparId =
        (grandParentId != null && grandParentId.toLowerCase() != "null")
            ? grandParentId
            : "";

    String path =
        "favourites/learner/{learnerId}/learning-object/{learningObjectId}/favourite?corporate-id={corporateId}&domain-id={domainId}&learning-object-type={learningObjectType}&parentId={parentId}&grandParentId={grandParentId}"
            .replaceFirst('{learnerId}', '$idUser')
            .replaceFirst('{learningObjectId}', '${model.id}')
            .replaceFirst('{corporateId}', '${corporateId?.id}')
            .replaceFirst('{domainId}', '$initiativeId')
            .replaceFirst('{learningObjectType}',
                model.learningObjectTypology.requestValue)
            .replaceFirst('{parentId}', parId)
            .replaceFirst('{grandParentId}', gparId);
    return await _repository.addLearningObjectToFavourites(path);
  }
}
