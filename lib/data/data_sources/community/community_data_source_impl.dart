import 'package:open_learning_smart_tv/data/models/responses/community/community_add_comment_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/community/community_posts_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../../core/web_client_config/web_client_config.dart';
import '../../models/requests/cms_wrapper_dto.dart';
import 'community_data_source.dart';

part 'community_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: CommunityDataSource)
abstract class CommunityDataSourceImpl implements CommunityDataSource {
  @factoryMethod
  factory CommunityDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _CommunityDataSourceImpl;

  @override
  @POST('{path}')
  Future<CommunityPostsDto> cmsWrapperCommunityPosts(
    @Body() CmsWrapperDto body,
    @Path() String? path,
  );

  @override
  @POST('{path}')
  Future<CommunityPostsDto> cmsWrapperCommunityPost(
    @Body() CmsWrapperPostDto body,
    @Path() String? path,
  );

  @override
  @POST('{path}')
  Future<CommunityPostsDto> cmsWrapperSharedPost(
    @Body() CmsWrapperDto body,
    @Path() String? path,
  );

  @override
  @POST('{path}')
  Future<CommunityPostsDto> cmsWrapperGetPostLikes(
    @Body() CmsWrapperDto body,
    @Path() String? path,
  );

  @override
  @POST('{path}')
  Future<CommunityPostsDto> cmsWrapperGetPostComments(
    @Body() CmsWrapperDto body,
    @Path() String? path,
  );

  @override
  @POST('{path}')
  Future<CommunityAddCommentModelDto> cmsWrapperAddPostComments(
    @Body() CmsWrapperAddDto body,
    @Path() String? path,
  );

  @override
  @POST('{path}')
  Future<String> cmsWrapperLikePost(
    @Body() CmsWrapperDto body,
    @Path() String? path,
  );

  @override
  @POST('{path}')
  Future<String> cmsWrapperUnlikePost(
    @Body() CmsWrapperDto body,
    @Path() String? path,
  );
}
