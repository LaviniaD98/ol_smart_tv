import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/community/community_posts_model.dart';
import '../../repositories/community/community_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';

@lazySingleton
class GetCommentsUseCase {
  final CommunityRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  GetCommentsUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase
  );

  Future<Either<Failure, CommunityPostsModel>> call({
    required int entityId,
    required int page,
    required int pageSize,
    String? apiPath,
  }) async {
    /// Get initiativeId
    final initiativeId = (await _getSecureStoredUserInfoUseCase())?.initiativeId;

    return await _repository.getPostComments(
      entityId: entityId,
      initiativeId: initiativeId,
      page: page,
      pageSize: pageSize,
      apiPath: apiPath,
    );
  }
}
