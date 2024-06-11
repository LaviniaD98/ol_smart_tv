import 'package:open_learning_smart_tv/data/models/requests/auth_token_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/cognito/auth_token_response_dto.dart';

abstract class AuthDataSource {
  Future<AuthTokenResponseDto> authToken(
    String authorization,
    String url,
    String code,
    AuthTokenBodyDto authTokenBodyDto,
  );
}
