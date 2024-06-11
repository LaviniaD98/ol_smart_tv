import 'package:open_learning_smart_tv/data/models/responses/generic/detail_page_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/editions_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/favourite_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/rating_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/releated_learning_activity_response_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/tool_response_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/tool_url_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/responses/community/community_posts_dto.dart';
import '../../models/responses/generic/teacher_detail_dto.dart';
import 'detail_data_source.dart';

part 'detail_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: DetailDataSource)
abstract class DetailDataSourceImpl implements DetailDataSource {
  @factoryMethod
  factory DetailDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _DetailDataSourceImpl;

  @override
  @GET('{path}')
  Future<DetailPageDto> getDetailPage(
    @Path('path') String path,
  );

  @override
  @GET('{path}')
  Future<ToolResponseDto> getTools(
    @Path('path') String path,
  );

  @override
  @GET(
      '/learning-catalogue/{corporateId}/{initiativeId}/learningObjects/{learningObjectId}/tools/{id}')
  Future<ToolUrlDto> getToolUrl({
    @Path('id') int? id,
    @Path('corporateId') int? corporateId,
    @Path('initiativeId') int? initiativeId,
    @Path('learningObjectId') int? learningObjectId,
  });

  @override
  @GET('{path}')
  Future<ReleatedLearningActivityResponseDto> getRelatedActivities(
    @Path('path') String path,
  );

  @override
  @GET('{path}')
  Future<EditionsDto> getEditions(
    @Path('path') String path,
  );

  @override
  @POST('{path}')
  Future<FavouriteDto> addLearningObjectToFavourites(
    @Path('path') String path,
  );

  @override
  @DELETE('{path}')
  Future<void> removeLearningObjectFromFavourites(
    @Path('path') String path,
  );

  @override
  @GET('{path}')
  Future<RatingDto> getRatingInfo(
    @Path('path') String path,
  );

  @override
  @GET(
      '/sharedPost/{id}?initiativeId={initiativeId}&corporateId={corporateId}&page={page}&page_size={pageSize}')
  Future<CommunityPostsDto> getSharedPosts({
    @Path('id') String? id,
    @Path('initiativeId') int? initiativeId,
    @Path('corporateId') int? corporateId,
    @Path('page') int? page,
    @Path('pageSize') int? pageSize,
  });

  @override
  @GET('/sharedPost/{id}?initiativeId={initiativeId}&corporateId={corporateId}')
  Future<CommunityPostsDto> getSharedPostsNoPaging({
    @Path('id') String? id,
    @Path('initiativeId') int? initiativeId,
    @Path('corporateId') int? corporateId,
  });

  @override
  @GET('/learning-catalogue/{corporateId}/{initiativeId}/teachers/{teacherId}')
  Future<TeacherDetailDto> getTeacherDetail({
    @Path('teacherId') int? teacherId,
    @Path('corporateId') int? corporateId,
    @Path('initiativeId') int? initiativeId,
  });
}
