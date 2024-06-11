import 'package:open_learning_smart_tv/domain/entities/community/community_posts_model.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/favourite_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/editions_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/releated_learning_activity_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/tool_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/tool_url_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';
import '../../entities/generic/rating_model.dart';
import '../../entities/generic/teacher_detail_model.dart';

abstract class DetailRepository {
  Future<Either<Failure, DetailPageModel>> getDetailPage(String path);
  Future<Either<Failure, ToolResponseModel>> getTools(String path);
  Future<Either<Failure, ToolUrlModel>> getToolUrl({
    int? id,
    int? corporateId,
    int? initiativeId,
    int? learningObjectId,
  });
  Future<Either<Failure, ReleatedLearningActivityResponseModel>>
      getRelatedActivities(String path);
  Future<Either<Failure, EditionsModel>> getEditions(String path);
  Future<Either<Failure, FavouriteModel>> addLearningObjectToFavourites(
      String path);
  Future<Either<Failure, void>> removeLearningObjectFromFavourites(String path);
  Future<Either<Failure, RatingResponseModel>> getRatingInfo(String path);
  Future<Either<Failure, CommunityPostsModel>> getSharedPosts({
    String id,
    int? corporateId,
    int? initiativeId,
    int? page,
    int? pageSize,
  });
  Future<Either<Failure, TeacherDetailModel>> getTeachersDetails({
    int? teacherId,
    int? corporateId,
    int? initiativeId,
  });
}
