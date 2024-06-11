import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/data/models/requests/initiative_body_dto.dart';
import 'package:open_learning_smart_tv/domain/repositories/session/session_repository.dart';

@lazySingleton
class SetInitiativeUseCase {
  final SessionRepository _sessionRepository;
  SetInitiativeUseCase(this._sessionRepository);
  Future<Either<Failure, String>> call(
      CognitoUserSession session, InitiativeBodyDto initiativeBodyDto) async {
    return await _sessionRepository.setInitiative(session, initiativeBodyDto);
  }
}
