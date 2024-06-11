import 'package:open_learning_smart_tv/data/models/responses/generic/detail_page_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/editions_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/favourite_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/releated_learning_activity_response_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/tool_response_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/tool_url_dto.dart';
import '../../models/responses/community/community_posts_dto.dart';
import '../../models/responses/generic/rating_dto.dart';
import '../../models/responses/generic/teacher_detail_dto.dart';

abstract class DetailDataSource {
  Future<DetailPageDto> getDetailPage(String path);
  Future<ToolResponseDto> getTools(String path);
  Future<ToolUrlDto> getToolUrl({
    int? id,
    int? corporateId,
    int? initiativeId,
    int? learningObjectId,
  });
  Future<ReleatedLearningActivityResponseDto> getRelatedActivities(String path);
  Future<EditionsDto> getEditions(String path);
  Future<FavouriteDto> addLearningObjectToFavourites(String path);
  Future<void> removeLearningObjectFromFavourites(String path);
  Future<RatingDto> getRatingInfo(String path);
  Future<CommunityPostsDto> getSharedPosts({
    String? id,
    int? initiativeId,
    int? corporateId,
    int? page,
    int? pageSize,
  });
  Future<CommunityPostsDto> getSharedPostsNoPaging({
    String? id,
    int? initiativeId,
    int? corporateId,
  });
  Future<TeacherDetailDto> getTeacherDetail({
    int? teacherId,
    int? corporateId,
    int? initiativeId,
  });
}
