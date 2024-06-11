import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/repositories/session/session_repository.dart';

@lazySingleton
class CreateSessionUseCase {
  final SessionRepository _sessionRepository;
  CreateSessionUseCase(this._sessionRepository);
  Future<Either<Failure, String>> call(CognitoUserSession session) async {
    return await _sessionRepository.sessions(session);
  }
}
