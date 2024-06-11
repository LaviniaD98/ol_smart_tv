import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/start_resume/start_resume_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/failure.dart';
import '../../entities/detail/detail_page_model.dart';
import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class StartResumeUseCase {
  final StartResumeRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  StartResumeUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, LearningObjectModel>> call(
      int loId, String parentId) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? initiativeId = userInfoModel?.initiativeId;
    final corporateId = await _getStoredCorporateIdUseCase();

    // https://api.openlearning-test.digitedacademy.net
    // /learning-catalogue/1/182/learningObjects/330/startOrResume?parentId=343
    // /learning-catalogue/{corporateId}/{initiativeId}/learningObjects/{learningObjectId}/startOrResume
    String path =
        "/learning-catalogue/{corporateId}/{initiativeId}/learningObjects/{learningObjectId}/startOrResume?parentId={parentId}"
            .replaceFirst('{corporateId}', '${corporateId?.id}')
            .replaceFirst('{initiativeId}', '$initiativeId')
            .replaceFirst('{learningObjectId}', '${loId}')
            .replaceFirst('{parentId}', '${parentId}');

    return await _repository.startResume(path);
  }
}
