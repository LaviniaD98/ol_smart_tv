import 'dart:convert';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/repositories/statements/statements_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/env/env.dart';
import '../../../data/models/failure.dart';
import '../../../data/models/requests/statements_body_dto.dart';
import '../../entities/statements/xapi_state_model.dart';
import '../../entities/user/user_info_model.dart';
import '../../enums/types.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetStateUseCase {
  final Env env;
  final StatementsRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  GetStateUseCase(
    this.env,
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, XapiStateModel>> call(
    LearningObjectTypology learningObjectTypology,
    String loId,
    String? tentativeId,
  ) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    final corporateModel = await _getStoredCorporateIdUseCase();

    String thost = env.trackingIdUrl;

    String pathId = "null";
    String courseId = "null";
    String activityId = "null";

    switch (learningObjectTypology.requestValue.toLowerCase()) {
      case 'activity':
        activityId = loId.toString();
      case 'course':
        courseId = loId.toString();
    }

    String urlId = thost +
        "{corporateId}/{userId}/{pathId}/{courseId}/{activityId}/{tentativeId}"
            .replaceFirst("{corporateId}", '${corporateModel?.id}')
            .replaceFirst("{userId}", '${userInfoModel?.user?.idUser}')
            .replaceFirst("{pathId}", pathId)
            .replaceFirst("{courseId}", courseId)
            .replaceFirst("{activityId}", activityId)
            .replaceFirst("{tentativeId}", '$tentativeId');

    String? sessionId = userInfoModel?.sessionId;
    String registrationGUID = sessionId!; // uuid.v4();

    Actor actor = Actor(
        mbox: "mailto:" + userInfoModel!.user!.email!,
        name: userInfoModel.user?.externalId ?? "",
        objectType: "Agent");

    String agent = jsonEncode(actor);
    String path =
        "xapi/{corporateId}/activities/state?stateId={stateId}&activityId={activityId}&agent={agent}&registration={registration}"
            .replaceFirst("{corporateId}", '${corporateModel?.id}')
            .replaceFirst("{stateId}", 'bookmarking-data')
            .replaceFirst("{activityId}", urlId)
            .replaceFirst("{agent}", Uri.encodeComponent(agent))
            .replaceFirst("{registration}", registrationGUID);

    return await _repository.getState(path);
  }
}
