import 'package:open_learning_smart_tv/core/env/env.dart';
import 'package:open_learning_smart_tv/data/models/requests/linkedin_request_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/web_view_player/linkedin_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/failure.dart';
import '../../entities/user/user_info_model.dart';
import '../../repositories/web_view_player/web_view_player_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';
//import '../smart_configurator/get_stored_smart_configuration_use_case.dart';

@lazySingleton
class WebViewPlayerLinkedinUseCase {
  final WebViewPlayerRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;
  //final GetStoredSmartConfigurationUseCase _getStoredSmartConfigurationUseCase;
  final Env env;

  WebViewPlayerLinkedinUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
    //this._getStoredSmartConfigurationUseCase,
    this.env,
  );

  Future<Either<Failure, LinkedInResponseModel>> call(
      LearningObjectModel detailPageModel,
      String jwtToken,
      String sessionId) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? idUser = userInfoModel?.user?.idUser;
    int? initiativeId = userInfoModel?.initiativeId;
    final corporateId = await _getStoredCorporateIdUseCase();

    String loTypology = detailPageModel.learningObjectTypology.apiValue;

    String iframeSrc = detailPageModel.link ?? "";
    int activityId = detailPageModel.id;
    //int pathId = 0;
    String path = detailPageModel.learningObjectTypology ==
            LearningObjectTypology.linkedin
        ? "xapi/linkedIn/sessions"
        : "scorm-lib/input";

    // final SCORMTracker =
    //     await _getStoredSmartConfigurationUseCase.getSCORMTracker();
    // final XAPITracker =
    //     await _getStoredSmartConfigurationUseCase.getXAPITracker();

    String? sessionId = userInfoModel?.sessionId;

    LinkedinRequestBodyDto sidDto = LinkedinRequestBodyDto(
        null,
        idUser,
        userInfoModel?.user?.name,
        sessionId,
        iframeSrc,
        userInfoModel?.user?.email,
        userInfoModel?.user?.externalId, // username?
        corporateId?.id,
        initiativeId,
        null,
        activityId,
        loTypology,
        "domain",
        "objectDescription",
        "objectName");
    return await _repository.requestLinkedinUrl(path, sidDto);
  }
}
