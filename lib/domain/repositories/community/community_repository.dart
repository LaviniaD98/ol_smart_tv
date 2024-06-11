import 'package:open_learning_smart_tv/domain/entities/community/community_posts_model.dart';
import 'package:dartz/dartz.dart';
import '../../../data/models/failure.dart';
import '../../entities/community/community_add_comment.dart';

abstract class CommunityRepository {
  Future<Either<Failure, CommunityPostsModel>> getCommunityPosts(
      {int? page,
      int? pageSize,
      int? initiativeId,
      String? apiPath,
      List<String>? topics,
      List<String>? types});
  Future<Either<Failure, CommunityPostsModel>> getPostById(
      {int? discussionId, int? initiativeId, int? userId, String? apiPath});
  Future<Either<Failure, CommunityPostsModel>> getSharedPostById(
      {int? postId, int? initiativeId, int? userId, String? apiPath});
  Future<Either<Failure, CommunityPostsModel>> getPostLikes(
      {int? entityId,
      int? initiativeId,
      int? userId,
      required String? apiPath});
  Future<Either<Failure, CommunityPostsModel>> getPostComments(
      {int? entityId,
      int? initiativeId,
      int? page,
      int? pageSize,
      String? apiPath});
  Future<Either<Failure, CommunityAddCommentModel>> addPostComment(
      {int? entityId,
      int? initiativeId,
      String? message,
      String? ownerId,
      String? apiPath});
  Future<Either<Failure, CommunityAddCommentModel>> modifyPostComment(
      {int? commentId,
      int? initiativeId,
      String? message,
      String? ownerId,
      String? apiPath});
  Future<Either<Failure, void>> deletePostComment(
      {int? commentId, int? initiativeId, String? ownerId, String? apiPath});
  Future<Either<Failure, CommunityAddCommentModel>> addCommentAnswer(
      {int? commentId,
      int? initiativeId,
      String? message,
      String? ownerId,
      String? apiPath});
  Future<Either<Failure, CommunityPostsModel>> getPostAnswers(
      {int? commentId,
      int? initiativeId,
      int? page,
      int? pageSize,
      String? apiPath});
  Future<Either<Failure, String>> likePost(
      {int? entityId,
      int? initiativeId,
      int? userId,
      required String? apiPath});
  Future<Either<Failure, String>> unlikePost(
      {int? entityId,
      int? initiativeId,
      int? userId,
      required String? apiPath});
}
