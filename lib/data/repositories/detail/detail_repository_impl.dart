import 'package:open_learning_smart_tv/data/data_sources/detail/detail_data_source.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/favourite_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/editions_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/rating_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/releated_learning_activity_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/tool_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/tool_url_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/detail/detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../../domain/entities/community/community_posts_model.dart';
import '../../../domain/entities/generic/teacher_detail_model.dart';
import '../../models/responses/community/community_posts_dto.dart';

@LazySingleton(as: DetailRepository)
class DetailRepositoryImpl implements DetailRepository {
  final DetailDataSource _detailDataSource;

  DetailRepositoryImpl(this._detailDataSource);

  @override
  Future<Either<Failure, DetailPageModel>> getDetailPage(String path) {
    return catchFailure(() async {
      final res = await _detailDataSource.getDetailPage(path);
      return DetailPageModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, ToolResponseModel>> getTools(String path) {
    return catchFailure(() async {
      final res = await _detailDataSource.getTools(path);
      return ToolResponseModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, ToolUrlModel>> getToolUrl({
    int? id,
    int? corporateId,
    int? initiativeId,
    int? learningObjectId,
  }) {
    return catchFailure(() async {
      final res = await _detailDataSource.getToolUrl(
        id: id,
        corporateId: corporateId,
        initiativeId: initiativeId,
        learningObjectId: learningObjectId,
      );
      return ToolUrlModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, ReleatedLearningActivityResponseModel>>
      getRelatedActivities(String path) {
    return catchFailure(() async {
      final res = await _detailDataSource.getRelatedActivities(path);
      return ReleatedLearningActivityResponseModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, EditionsModel>> getEditions(String path) {
    return catchFailure(() async {
      final res = await _detailDataSource.getEditions(path);
      return EditionsModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, FavouriteModel>> addLearningObjectToFavourites(
      String path) {
    return catchFailure(() async {
      final res = await _detailDataSource.addLearningObjectToFavourites(path);
      return FavouriteModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, void>> removeLearningObjectFromFavourites(
      String path) {
    return catchFailure(() async {
      await _detailDataSource.removeLearningObjectFromFavourites(path);
      return;
    });
  }

  @override
  Future<Either<Failure, RatingResponseModel>> getRatingInfo(String path) {
    return catchFailure(() async {
      final res = await _detailDataSource.getRatingInfo(path);
      return RatingResponseModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, CommunityPostsModel>> getSharedPosts({
    String? id,
    int? initiativeId,
    int? corporateId,
    int? page,
    int? pageSize,
  }) {
    return catchFailure(() async {
      final CommunityPostsDto res;
      if (page != null && pageSize != null) {
        res = await _detailDataSource.getSharedPosts(
          id: id,
          corporateId: corporateId,
          initiativeId: initiativeId,
          page: page,
          pageSize: pageSize,
        );
      } else {
        res = await _detailDataSource.getSharedPostsNoPaging(
          id: id,
          corporateId: corporateId,
          initiativeId: initiativeId,
        );
      }
      return CommunityPostsModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, TeacherDetailModel>> getTeachersDetails({
    int? teacherId,
    int? corporateId,
    int? initiativeId,
  }) {
    return catchFailure(() async {
      final res = await _detailDataSource.getTeacherDetail(
        teacherId: teacherId,
        corporateId: corporateId,
        initiativeId: initiativeId,
      );
      return TeacherDetailModel.fromDto(res);
    });
  }
}
