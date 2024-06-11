import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/data/models/requests/statements_body_dto.dart';
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
class StopCommunityTrackingUseCase {
  final Env env;
  final StatementsRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  StopCommunityTrackingUseCase(
    this.env,
    this._getStoredCorporateIdUseCase,
    this._repository,
    this._getSecureStoredUserInfoUseCase,
  );

  Future<Either<Failure, List<String>>> call(DateTime startTime) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    final corporateModel = await _getStoredCorporateIdUseCase();
    int? initiativeId = userInfoModel?.initiativeId;

    String path = 'xapi/${corporateModel?.id}/statements';

    var uuid = const Uuid();
    String registrationUID = userInfoModel?.sessionId ?? uuid.v4();

    Context context =
        Context(contextActivities: {}, registration: registrationUID);

    final dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.mss'Z'");
    String timestamp = dateFormat.format(DateTime.now().toUtc());

    return await _repository.statements(
      path,
      StatementsDto(
        actor: Actor(
          mbox: "mailto:${userInfoModel?.user?.email}",
          name: userInfoModel?.user?.externalId ?? "",
          objectType: "Agent",
        ),
        context: context,
        object: StatementsObject(
          id: '${env.trackingIdUrl}/${corporateModel?.id}/${userInfoModel?.user?.idUser}/null/null/$initiativeId',
          objectType: 'Activity',
        ),
        verb: Verb(
          display: {"en-US": "experienced"},
          id: "https://adlnet.gov/exapi/verbs/experience",
        ),
        version: "1.0.0",
        timestamp: timestamp,
        result: Result(
          duration: DateTime.now().difference(startTime).toIso8601String(),
        ),
      ),
    );
  }
}
