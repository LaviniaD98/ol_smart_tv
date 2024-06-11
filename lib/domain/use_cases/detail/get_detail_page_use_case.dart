import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/domain/repositories/detail/detail_repository.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetDetailPageUseCase {
  final DetailRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  GetDetailPageUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, DetailPageModel>> call(
      DetailPageArgs args, LearningObjectTypology typology) async {
    return await callDetailPage(
        args.id,
        (args.parent?.id != null ? args.parent!.id!.toString() : ""),
        (args.grandParentId != null ? args.grandParentId! : ""),
        typology);
  }

  Future<Either<Failure, DetailPageModel>> callDetailPage(
      String id,
      String parentId,
      String grandParentId,
      LearningObjectTypology typology) async {
    /// Get initiativeId
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? initiativeId = userInfoModel?.initiativeId;

    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();
    String path = "";
    switch (typology) {
      case LearningObjectTypology.course:
        String rootId = parentId;
        path =
            "/learning-catalogue/{corporateId}/{initiativeId}/courses/{courseId}?onlyLearningActivity=false&rootId=$rootId&courseId="
                .replaceFirst('{corporateId}', '${corporateId?.id}')
                .replaceFirst('{initiativeId}', '$initiativeId')
                .replaceFirst(
                  '{courseId}',
                  id,
                );
      case LearningObjectTypology.path:
        path =
            "/learning-catalogue/{corporateId}/{initiativeId}/roots/{rootId}?onlyLearningActivity=false"
                .replaceFirst('{corporateId}', '${corporateId?.id}')
                .replaceFirst('{initiativeId}', '$initiativeId')
                .replaceFirst(
                  '{rootId}',
                  id,
                );
      default:
        String rootId = grandParentId;
        String courseId = parentId;
        path =
            "/learning-catalogue/{corporateId}/{initiativeId}/learningActivities/{courseId}?onlyLearningActivity=false&rootId=$rootId&courseId=$courseId"
                .replaceFirst('{corporateId}', '${corporateId?.id}')
                .replaceFirst('{initiativeId}', '$initiativeId')
                .replaceFirst(
                  '{courseId}',
                  id,
                );
    }
    return await _repository.getDetailPage(path);
  }
}
