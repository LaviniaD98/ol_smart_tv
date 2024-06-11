import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../../data/models/requests/initiative_body_dto.dart';
import '../../entities/session/check_session_model.dart';

abstract class SessionRepository {
  Future<Either<Failure, CheckSessionModel>> checkSession(
      CognitoUserSession session, String sessionId);
  Future<Either<Failure, String>> sessions(CognitoUserSession session);
  Future<Either<Failure, String>> setInitiative(
      CognitoUserSession session, InitiativeBodyDto initiativeBodyDto);
}
