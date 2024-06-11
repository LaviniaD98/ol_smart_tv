import 'package:open_learning_smart_tv/data/data_sources/user/auth_data_source.dart';
import 'package:open_learning_smart_tv/data/models/requests/auth_token_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/cognito/auth_token_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: AuthDataSource)
abstract class AuthDataSourceImpl implements AuthDataSource {
  @factoryMethod
  factory AuthDataSourceImpl(@Named(WebClientType.cognitoAuthClient) Dio dio) =
      _AuthDataSourceImpl;

  @override
  @POST('{url}')
  Future<AuthTokenResponseDto> authToken(
      @Header('Content-Type') String authorization,
      @Path('url') String url,
      String code,
      @Body() AuthTokenBodyDto authTokenBodyDto);
}
