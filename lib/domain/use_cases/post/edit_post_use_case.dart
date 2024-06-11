import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/data/models/requests/post/post_attachments_dto.dart';
import 'package:open_learning_smart_tv/data/models/requests/post/post_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/requests/post/post_link_dto.dart';
import 'package:open_learning_smart_tv/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/requests/post/post_request.dart';
import '../../entities/generic/post_link_model.dart';
import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';

@lazySingleton
class EditPostUseCase {
  final PostRepository _postRepository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  EditPostUseCase(this._postRepository, this._getSecureStoredUserInfoUseCase);

  Future<Either<Failure, void>> call({
    required String id,
    required String body,
    PostLinkModel? link,
  }) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase();
    int? userId = userInfoModel?.user?.idUser;
    int? initiativeId = userInfoModel?.initiativeId;

    final req = PostRequest(
      body: PostBodyDto(
        body: body,
        attachments: _setAttachment(link),
        langCode: 'it',
        postType: 'free',
      ),
      endpoint: '/api/v1/fe_learner/post?post_id=$id',
      method: 'PUT',
      userId: '$userId',
      xInitiativeId: '$initiativeId',
    );
    return _postRepository.csmWrapperPost(req);
  }

  PostAttachmentsDto? _setAttachment(PostLinkModel? link) {
    if (link != null) {
      return PostAttachmentsDto(
        link: [
          PostLinkDto(
            content: link.url,
            name: link.label,
          ),
        ],
      );
    }
    return null;
  }
}
