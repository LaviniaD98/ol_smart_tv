import 'package:open_learning_smart_tv/domain/entities/community/community_posts_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../../remote_theming/config/config_manager.dart';
import '../../../remote_theming/config/remote_config_keys.dart';
import '../../entities/user/user_info_model.dart';
import '../../repositories/community/community_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';

@lazySingleton
class GetCommunityPostsUseCase {
  final CommunityRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  GetCommunityPostsUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
  );

  Future<Either<Failure, CommunityPostsModel>> call(int page, String? apiPath,
      List<String>? topics, List<String>? types) async {
    /// Get initiativeId
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? initiativeId = userInfoModel?.initiativeId;

    return await _repository.getCommunityPosts(
      page: page,
      pageSize:
          ConfigManager().getRemoteInt(RemoteConfigKeys.page_size_wall, 10),
      initiativeId: initiativeId,
      apiPath: apiPath,
      topics: topics,
      types: types,
    );
  }
}
