import 'package:open_learning_smart_tv/domain/entities/community/community_posts_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/user/user_info_model.dart';
import '../../repositories/detail/detail_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetSharedPostsUseCase {
  final DetailRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  GetSharedPostsUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, CommunityPostsModel>> call({
    required String id,
    int? page,
    int? pageSize,
  }) async {
    /// Get initiativeId
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? initiativeId = userInfoModel?.initiativeId;

    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();

    return await _repository.getSharedPosts(
      id: id,
      corporateId: corporateId?.id,
      initiativeId: initiativeId,
      page: page,
      pageSize: pageSize,
    );
  }
}
