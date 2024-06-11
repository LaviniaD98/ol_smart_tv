import 'package:open_learning_smart_tv/data/data_sources/community/community_data_source.dart';
import 'package:open_learning_smart_tv/data/models/requests/cms_wrapper_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/community/community_add_comment.dart';
import 'package:open_learning_smart_tv/domain/entities/community/community_posts_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/community/community_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../models/failure.dart';
import '../../models/requests/cms_wrapper_body_dto.dart';

@LazySingleton(as: CommunityRepository)
class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityDataSource _communityDataSource;

  CommunityRepositoryImpl(this._communityDataSource);

  @override
  Future<Either<Failure, CommunityPostsModel>> getCommunityPosts(
      {int? page,
      int? pageSize,
      int? initiativeId,
      String? apiPath,
      List<String>? topics,
      List<String>? types}) {
    return catchFailure(() async {
      final String topicsFiltersArg =
          topics?.isNotEmpty == true ? "&topic=${topics?.join(',')}" : "";
      final String typesFiltersArg =
          types?.isNotEmpty == true ? "&content_type=${types?.join(',')}" : "";

      final res = await _communityDataSource.cmsWrapperCommunityPosts(
          CmsWrapperDto(
            body: null,
            method: "GET",
            endpoint:
                "/api/v1/fe_learner/community?page=$page&page_size=$pageSize&lang=it$typesFiltersArg$topicsFiltersArg",
            initiativeid: initiativeId,
            corporateid: null,
            userId: null,
          ),
          apiPath);
      return CommunityPostsModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, CommunityPostsModel>> getPostById(
      {int? discussionId, int? initiativeId, int? userId, String? apiPath}) {
    return catchFailure(() async {
      final res = await _communityDataSource.cmsWrapperCommunityPost(
          CmsWrapperPostDto(
            body: null,
            method: "GET",
            endpoint:
                "/api/v1/fe_learner/discussion?lang=it&discussion_id=$discussionId",
            initiativeid: initiativeId,
          ),
          apiPath);
      return CommunityPostsModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, CommunityPostsModel>> getSharedPostById(
      {int? postId, int? initiativeId, int? userId, String? apiPath}) {
    return catchFailure(() async {
      final res = await _communityDataSource.cmsWrapperSharedPost(
          CmsWrapperDto(
            method: "GET",
            endpoint: "/api/v1/fe_learner/post?post_id=$postId",
            initiativeid: initiativeId,
          ),
          apiPath);
      return CommunityPostsModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, CommunityPostsModel>> getPostLikes(
      {int? entityId, int? initiativeId, int? userId, String? apiPath}) {
    return catchFailure(() async {
      final res = await _communityDataSource.cmsWrapperGetPostLikes(
          CmsWrapperDto(
            method: "GET",
            endpoint: "/api/v1/fe_learner/likes?type=node&entity_id={entityId}"
                .replaceFirst('{entityId}', '$entityId'),
            initiativeid: initiativeId,
            userId: userId,
          ),
          apiPath);
      return CommunityPostsModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, CommunityPostsModel>> getPostComments(
      {int? entityId,
      int? initiativeId,
      int? page,
      int? pageSize,
      String? apiPath}) {
    return catchFailure(() async {
      final res = await _communityDataSource.cmsWrapperGetPostComments(
          CmsWrapperDto(
            method: "GET",
            endpoint:
                "/api/v1/fe_learner/comment?entity_id=$entityId&page=$page&page_size=$pageSize",
            initiativeid: initiativeId,
          ),
          apiPath);
      return CommunityPostsModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, CommunityAddCommentModel>> addPostComment(
      {int? entityId,
      int? initiativeId,
      String? message,
      String? ownerId,
      String? apiPath}) {
    return catchFailure(() async {
      final res = await _communityDataSource.cmsWrapperAddPostComments(
          CmsWrapperAddDto(
            body: CmsWrapperBodyAddDto(
                body: message, owner_id: int.parse(ownerId ?? "")),
            method: "POST",
            endpoint: "/api/v1/fe_learner/comment?entity_id=$entityId",
            initiativeid: initiativeId,
          ),
          apiPath);
      return CommunityAddCommentModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, CommunityAddCommentModel>> modifyPostComment(
      {int? commentId,
      int? initiativeId,
      String? message,
      String? ownerId,
      String? apiPath}) {
    return catchFailure(() async {
      final res = await _communityDataSource.cmsWrapperAddPostComments(
          CmsWrapperAddDto(
            body: CmsWrapperBodyAddDto(
                body: message, owner_id: int.parse(ownerId ?? "")),
            method: "PUT",
            endpoint: "/api/v1/fe_learner/comment?comment_id=$commentId",
            initiativeid: initiativeId,
          ),
          apiPath);
      return CommunityAddCommentModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, void>> deletePostComment(
      {int? commentId, int? initiativeId, String? ownerId, String? apiPath}) {
    return catchFailure(() async {
      await _communityDataSource.cmsWrapperAddPostComments(
          CmsWrapperAddDto(
            method: "DELETE",
            endpoint: "/api/v1/fe_learner/comment?comment_id=$commentId",
            initiativeid: initiativeId,
            userId: ownerId != null ? int.parse(ownerId) : null,
          ),
          apiPath);
    });
  }

  @override
  Future<Either<Failure, CommunityAddCommentModel>> addCommentAnswer(
      {int? commentId,
      int? initiativeId,
      String? message,
      String? ownerId,
      String? apiPath}) {
    return catchFailure(() async {
      final res = await _communityDataSource.cmsWrapperAddPostComments(
          CmsWrapperAddDto(
            body: CmsWrapperBodyAddDto(
                body: message, owner_id: int.parse(ownerId ?? "")),
            method: "POST",
            endpoint: "/api/v1/fe_learner/comment?comment_id=$commentId",
            initiativeid: initiativeId,
          ),
          apiPath);
      return CommunityAddCommentModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, CommunityPostsModel>> getPostAnswers(
      {int? commentId,
      int? initiativeId,
      int? page,
      int? pageSize,
      String? apiPath}) {
    return catchFailure(() async {
      final res = await _communityDataSource.cmsWrapperGetPostComments(
          CmsWrapperDto(
            method: "GET",
            endpoint:
                "/api/v1/fe_learner/comment?comment_id=$commentId&page=$page&page_size=$pageSize",
            initiativeid: initiativeId,
          ),
          apiPath);
      return CommunityPostsModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, String>> likePost(
      {int? entityId, int? initiativeId, int? userId, String? apiPath}) {
    return catchFailure(() async {
      final res = await _communityDataSource.cmsWrapperLikePost(
          CmsWrapperDto(
            body: CmsWrapperBodyDto(
                entityId: entityId.toString(), type: "node", userId: userId),
            method: "POST",
            endpoint: "/api/v1/fe_learner/likes",
            initiativeid: initiativeId,
            userId: userId,
          ),
          apiPath);
      return res;
    });
  }

  @override
  Future<Either<Failure, String>> unlikePost(
      {int? entityId, int? initiativeId, int? userId, String? apiPath}) {
    return catchFailure(() async {
      final res = await _communityDataSource.cmsWrapperLikePost(
          CmsWrapperDto(
            body: CmsWrapperBodyDto(
                entityId: entityId.toString(), type: "node", userId: userId),
            method: "DELETE",
            endpoint: "/api/v1/fe_learner/likes?type=node&entity_id=$entityId",
            initiativeid: initiativeId,
            userId: userId,
          ),
          apiPath);
      return res;
    });
  }
}
