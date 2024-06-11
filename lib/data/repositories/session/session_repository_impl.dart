import 'package:open_learning_smart_tv/data/data_sources/session/session_data_source.dart';
import 'package:open_learning_smart_tv/data/models/requests/initiative_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/session/check_session_model.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/repositories/session/session_repository.dart';

@LazySingleton(as: SessionRepository)
class SessionRepositoryImpl implements SessionRepository {
  final SessionDataSource _sessionDataSource;
  SessionRepositoryImpl(this._sessionDataSource);

  @override
  Future<Either<Failure, String>> sessions(CognitoUserSession session) {
    return catchFailure(() async {
      final res = await _sessionDataSource.sessions(
        authorization: session.idToken.jwtToken,
        authToken: session.accessToken.jwtToken,
        refreshToken: session.refreshToken?.token,
      );
      return res.sessionId;
    });
  }

  @override
  Future<Either<Failure, CheckSessionModel>> checkSession(
      CognitoUserSession session, String sessionId) {
    return catchFailure(() async {
      final res = await _sessionDataSource.checkSession(
        authorization: session.accessToken.jwtToken,
        sessionId: sessionId,
      );
      return CheckSessionModel.fromResponse(res);
    });
  }

  @override
  Future<Either<Failure, String>> setInitiative(
      CognitoUserSession session, InitiativeBodyDto initiativeBodyDto) {
    return catchFailure(() async {
      final res = await _sessionDataSource.setInitiative(
        authorization: session.idToken.jwtToken,
        authToken: session.accessToken.jwtToken,
        refreshToken: session.refreshToken?.token,
        initiativeBodyDto: initiativeBodyDto,
      );
      return res.sessionId;
    });
  }
}
