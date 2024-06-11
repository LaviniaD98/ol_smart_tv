import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/repositories/detail/detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../entities/detail/detail_page_model.dart';
import '../../entities/generic/rating_model.dart';
import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetRatingUseCase {
  final DetailRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  GetRatingUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, RatingResponseModel>> call(
      DetailPageModel detailPageModel) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? idUser = userInfoModel?.user?.idUser;
    int? initiativeId = userInfoModel?.initiativeId;

    final corporateId = await _getStoredCorporateIdUseCase();

    final String path =
        "/social-rating/rating-statistics?corporate-id={corporateId}&domain-id={domainId}&learnerId={learnerId}&learning-object-id={learningObjectId}&learning-object-type={learningObjectType}"
            .replaceFirst('{learnerId}', '$idUser')
            .replaceFirst('{corporateId}', '${corporateId?.id}')
            .replaceFirst('{domainId}', '$initiativeId')
            .replaceFirst('{learningObjectType}',
                detailPageModel.learningObjectTypology.requestValue)
            .replaceFirst('{learningObjectId}', '${detailPageModel.id}');

    return await _repository.getRatingInfo(path);
  }
}
