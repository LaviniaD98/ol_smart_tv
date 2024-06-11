import 'package:open_learning_smart_tv/data/models/requests/auth_token_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/cognito/auth_token_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthTokenResponseModel>> authToken(
    String authorization,
    String ssoPoolId,
    String code,
    AuthTokenBodyDto authTokenBodyDto,
  );
}
