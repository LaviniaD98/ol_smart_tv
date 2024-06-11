import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/failure.dart';
import '../../entities/user/user_info_model.dart';
import '../../repositories/community/community_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';

@lazySingleton
class DeleteCommentUseCase {
  final CommunityRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  DeleteCommentUseCase(
      this._repository,
      this._getSecureStoredUserInfoUseCase
      );

  Future<Either<Failure, void>> call(int commentId, {String? apiPath}) async {
    return catchFailure(() async {
      UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase();
      int? initiativeId = userInfoModel?.initiativeId;

      await _repository.deletePostComment(
          commentId: commentId,
          initiativeId: initiativeId,
          ownerId: userInfoModel?.user?.idUser.toString(),
          apiPath: apiPath,
      );
    });
  }
}