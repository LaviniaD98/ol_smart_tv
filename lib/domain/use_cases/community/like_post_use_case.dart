import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/user/user_info_model.dart';
import '../../repositories/community/community_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';

@lazySingleton
class LikePostUseCase {
  final CommunityRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  LikePostUseCase(
      this._repository,
      this._getSecureStoredUserInfoUseCase
      );

  Future<Either<Failure, String>> call(int entityId, String? apiPath) async {
    /// Get initiativeId
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? userId = userInfoModel?.user?.idUser;
    int? initiativeId = userInfoModel?.initiativeId;

    return await _repository.likePost(
      entityId: entityId,
      initiativeId: initiativeId,
      userId: userId,
      apiPath: apiPath
    );
  }
}