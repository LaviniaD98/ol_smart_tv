import 'package:open_learning_smart_tv/domain/entities/community/community_add_comment.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/failure.dart';
import '../../entities/user/user_info_model.dart';
import '../../repositories/community/community_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';

@lazySingleton
class EditCommentUseCase {
  final CommunityRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  EditCommentUseCase(this._repository, this._getSecureStoredUserInfoUseCase);

  Future<Either<Failure, CommunityAddCommentModel>> call({
    required int commentId,
    required String message,
    String? apiPath,
  }) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase();
    int? initiativeId = userInfoModel?.initiativeId;

    return await _repository.modifyPostComment(
      commentId: commentId,
      initiativeId: initiativeId,
      message: message,
      ownerId: userInfoModel?.user?.idUser.toString(),
      apiPath: apiPath,
    );
  }
}
