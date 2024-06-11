import 'package:open_learning_smart_tv/domain/entities/community/community_posts_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/failure.dart';
import '../../entities/user/user_info_model.dart';
import '../../repositories/community/community_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';

@lazySingleton
class GetSharedPostUseCase {
  final CommunityRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  GetSharedPostUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
  );

  Future<Either<Failure, CommunityPostsModel>> call(
      int postId, String? apiPath) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? initiativeId = userInfoModel?.initiativeId;
    int? userId = userInfoModel?.user?.idUser;

    return await _repository.getSharedPostById(
      postId: postId,
      initiativeId: initiativeId,
      userId: userId,
      apiPath: apiPath,
    );
  }
}
