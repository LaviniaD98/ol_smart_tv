import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/session/check_session_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/session/session_repository.dart';

@lazySingleton
class CheckSessionUseCase {
  final SessionRepository _sessionRepository;
  CheckSessionUseCase(this._sessionRepository);
  Future<Either<Failure, CheckSessionModel>> call(
      CognitoUserSession session, String sessionId) {
    return _sessionRepository.checkSession(session, sessionId);
  }
}
