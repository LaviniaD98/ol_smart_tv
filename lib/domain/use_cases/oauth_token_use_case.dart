import 'package:open_learning_smart_tv/data/models/requests/auth_token_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/cognito/auth_token_response_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/user/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

@lazySingleton
class OauthTokenUseCase {
  final AuthRepository _authRepository;
  OauthTokenUseCase(this._authRepository);
  Future<Either<Failure, AuthTokenResponseModel>> call(
      String code, String ssoPoolId, AuthTokenBodyDto authTokenBodyDto) {
    return _authRepository.authToken(
        "application/x-www-form-urlencoded", ssoPoolId, code, authTokenBodyDto);
  }
}
