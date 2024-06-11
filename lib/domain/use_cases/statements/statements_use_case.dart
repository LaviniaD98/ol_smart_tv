import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/data/models/requests/statements_body_dto.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/domain/repositories/statements/statements_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../core/env/env.dart';
import '../../../data/models/failure.dart';
import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class StatementsUseCase {
  final Env env;
  final StatementsRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  String jwtToken = "";

  StatementsUseCase(
    this.env,
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, List<String>>> call(
      {required LearningObjectTypology learningObjectTypology,
      required String loId,
      required String title,
      required String description,
      required bool completed,
      required Duration duration,
      required String? tentativeId,
      String? pathId,
      String? stored}) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    final corporateModel = await _getStoredCorporateIdUseCase();

    String courseId = "null";
    String activityId = "null";
    String loTypology = learningObjectTypology.requestValue.toLowerCase();

    switch (loTypology) {
      case 'activity':
        activityId = loId.toString();
        loTypology = learningObjectTypology.requestValue.capitalize;
        break;
      case 'course':
        courseId = loId.toString();
        break;
    }

    // Es. https://api.openlearning-test.digitedacademy.net/xapi/1/statements
    String path = "xapi/{corporateId}/statements"
        .replaceFirst("{corporateId}", '${corporateModel?.id}');

    Actor actor = Actor(
        mbox: "mailto:" + userInfoModel!.user!.email!,
        name: userInfoModel.user?.externalId ?? "",
        objectType: "Agent"); // Solo e sempre Agent ???

    var uuid = Uuid();
    String registrationGUID = userInfoModel.sessionId ?? uuid.v4();
    String statementGUID = uuid.v4();

    Context cntx =
        Context(contextActivities: {}, registration: registrationGUID);

    Definition def =
        Definition(description: {"it-IT": description}, name: {"it-IT": title});

    // "id": "https://test-openlearning-learningobject.s3.eu-south-1.amazonaws.com/{corporateId}/{initiativeId}/{pathId}/{courseId}/{activityId}"
    // Es. da web: "https://test-openlearning-learningobject.s3.eu-south-1.amazonaws.com/1/279/null/null/1100"

    String thost = env.trackingIdUrl;

    String urlId = thost +
        "{corporateId}/{userId}/{pathId}/{courseId}/{activityId}/{tentativeId}"
            .replaceFirst("{corporateId}", '${corporateModel?.id}')
            .replaceFirst("{userId}", '${userInfoModel.user?.idUser}')
            .replaceFirst("{pathId}", pathId ?? 'null')
            .replaceFirst("{courseId}", courseId)
            .replaceFirst("{activityId}", activityId)
            .replaceFirst("{tentativeId}", '$tentativeId');

    StatementsObject obj = StatementsObject(
      definition: def,
      id: urlId,
      objectType: loTypology,
    );

    Result? result = null;
    Verb? verb;

    if (completed == false) {
      verb = Verb(display: {
        "en-US": "initialized",
        "it-IT": "ha inizializzato"
      }, id: "http://adlnet.gov/expapi/verbs/initialized" // Sempre questo url???
          );
    } else {
      verb = Verb(
          display: {"en-US": "completed", "it-IT": "ha completato"},
          id: "http://adlnet.gov/expapi/verbs/completed" // Sempre questo url???
          );
      Result(
          completion: true,
          duration: duration.toString(),
          score: Score(scaled: 1),
          success: true);
    }

    StatementsDto sDto;
    final dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.mss'Z'");
    String timestamp = dateFormat.format(DateTime.now().toUtc());
    if (result != null) {
      //timestamp: timestamp, stored: stored
      sDto = StatementsDto(
          actor: actor,
          context: cntx,
          id: statementGUID,
          object: obj,
          result: result,
          verb: verb,
          version: "1.0.0",
          timestamp: timestamp,
          stored: stored);
    } else {
      //timestamp: timestamp, stored: stored
      sDto = StatementsDto(
          actor: actor,
          context: cntx,
          id: statementGUID,
          object: obj,
          verb: verb,
          version: "1.0.0",
          timestamp: timestamp,
          stored: stored);
    }

    return await _repository.statements(path, sDto);
  }
}

String formatDurationISO8601(int hours, int minutes, int seconds) {
  return 'PT${hours}H${minutes}M${seconds}S';
}
