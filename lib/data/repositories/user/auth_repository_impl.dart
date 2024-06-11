import 'package:open_learning_smart_tv/data/data_sources/user/auth_data_source.dart';
import 'package:open_learning_smart_tv/data/models/requests/auth_token_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/cognito/auth_token_response_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/user/auth_repository.dart';
import 'package:open_learning_smart_tv/domain/use_cases/openid_config/get_stored_openid_config_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;
  final GetStoredOpenidConfigUseCase _getStoredOpenidConfigUseCase;

  AuthRepositoryImpl(this._authDataSource, this._getStoredOpenidConfigUseCase);

  @override
  Future<Either<Failure, AuthTokenResponseModel>> authToken(
    String authorization,
    String ssoPoolId,
    String code,
    AuthTokenBodyDto authTokenBodyDto,
  ) async {
    var openidConfig = await _getStoredOpenidConfigUseCase();

    var url = openidConfig?.tokenEndpoint;
    return catchFailure(() async {
      final res = await _authDataSource.authToken(
        authorization,
        url ?? "",
        code,
        authTokenBodyDto,
      );
      return AuthTokenResponseModel.fromResponse(res);
    });
  }
}
