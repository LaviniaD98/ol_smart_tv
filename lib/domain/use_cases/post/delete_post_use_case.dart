import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/requests/post/delete_post_request.dart';
import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';

@lazySingleton
class DeletePostUseCase {
  final PostRepository _postRepository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  DeletePostUseCase(this._postRepository, this._getSecureStoredUserInfoUseCase);

  Future<Either<Failure, void>> call(String id) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase();
    int? userId = userInfoModel?.user?.idUser;
    int? initiativeId = userInfoModel?.initiativeId;

    final req = DeletePostRequest(
      endpoint: '/api/v1/fe_learner/post?post_id=$id',
      method: 'DELETE',
      userId: '$userId',
      xInitiativeId: '$initiativeId',
      xModeratorFlag: false,
    );
    return _postRepository.csmWrapperPost(req);
  }
}
