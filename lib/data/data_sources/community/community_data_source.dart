import 'package:open_learning_smart_tv/data/models/requests/cms_wrapper_dto.dart';
import '../../models/responses/community/community_add_comment_dto.dart';
import '../../models/responses/community/community_posts_dto.dart';

abstract class CommunityDataSource {
  Future<CommunityPostsDto> cmsWrapperCommunityPosts(
      CmsWrapperDto body, String? path);
  Future<CommunityPostsDto> cmsWrapperCommunityPost(
      CmsWrapperPostDto body, String? path);
  Future<CommunityPostsDto> cmsWrapperSharedPost(
      CmsWrapperDto body, String? path);
  Future<CommunityPostsDto> cmsWrapperGetPostLikes(
      CmsWrapperDto body, String? path);
  Future<String> cmsWrapperLikePost(CmsWrapperDto body, String? path);
  Future<CommunityPostsDto> cmsWrapperGetPostComments(
      CmsWrapperDto body, String? path);
  Future<CommunityAddCommentModelDto> cmsWrapperAddPostComments(
      CmsWrapperAddDto body, String? path);
  Future<String> cmsWrapperUnlikePost(CmsWrapperDto body, String? path);
}
