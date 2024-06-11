import 'package:open_learning_smart_tv/core/env/env.dart';
import 'package:open_learning_smart_tv/domain/entities/web_view_player/sessionid_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/failure.dart';
import '../../../data/models/requests/sessionid_request_body_dto.dart';
import '../../entities/user/user_info_model.dart';
import '../../repositories/web_view_player/web_view_player_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';
import '../smart_configurator/get_stored_smart_configuration_use_case.dart';

@lazySingleton
class WebViewPlayerUseCase {
  final WebViewPlayerRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;
  final GetStoredSmartConfigurationUseCase _getStoredSmartConfigurationUseCase;
  final Env env;

  WebViewPlayerUseCase(
      this._repository,
      this._getSecureStoredUserInfoUseCase,
      this._getStoredCorporateIdUseCase,
      this._getStoredSmartConfigurationUseCase,
      this.env);

  Future<Either<Failure, SessionIdResponseModel>> call(
      LearningObjectModel model, String jwtToken, String sessionId) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? idUser = userInfoModel?.user?.idUser;
    int? initiativeId = userInfoModel?.initiativeId;
    final corporateId = await _getStoredCorporateIdUseCase();

    String loTypology = model.learningObjectTypology.apiValue;

    String iframeSrc = model.link ?? "";
    int activityId = model.id;
    String path =
        model.learningObjectTypology == LearningObjectTypology.linkedin
            ? "linkedIn/sessions"
            : "scorm-lib/input";

    final SCORMTracker =
        await _getStoredSmartConfigurationUseCase.getSCORMTracker();
    final XAPITracker =
        await _getStoredSmartConfigurationUseCase.getXAPITracker();

    String? sessionId = userInfoModel?.sessionId;

    SessionIdRequestBodyDto sidDto = SessionIdRequestBodyDto(
      courseId: null,
      learnerId: idUser,
      learnerName: userInfoModel?.user?.name,
      tokenJwt: jwtToken,
      iframeSrc: iframeSrc,
      userEmail: userInfoModel?.user?.email,
      userName: userInfoModel?.user?.externalId,
      corporateId: corporateId?.id,
      initiativeId: initiativeId,
      pathId: null,
      activityId: activityId,
      LO_type: loTypology,
      domain: "domain",
      objectDescription: "objectDescription",
      objectName: "objectName",
      viteSCORMTracker: SCORMTracker,
      viteXAPITracker: XAPITracker,
      linkedInLOId: iframeSrc,
      loType: loTypology,
      sessionId: sessionId,
      tentativeId: model.tentativeId,
      trackOnClick: model.trackOnClick,
      surveyId: model.surveyId,
    );
    return await _repository.requestSessionId(path, sidDto);
  }
}
