import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:open_learning_smart_tv/data/data_sources/session/session_data_source.dart';
import 'package:open_learning_smart_tv/data/models/responses/cognito/auth_token_qr_response_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/session_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/requests/initiative_body_dto.dart';
import '../../models/responses/session/check_session_dto.dart';

part 'session_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: SessionDataSource)
abstract class SessionDataSourceImpl implements SessionDataSource {
  @factoryMethod
  factory SessionDataSourceImpl(@Named(WebClientType.defaultClient) Dio dio) =
      _SessionDataSourceImpl;

  @override
  @POST('/sessions')
  Future<SessionDto> sessions({
    @Header('Authorization') String? authorization,
    @Header('AuthToken') String? authToken,
    @Header('RefreshToken') String? refreshToken,
  });

  @override
  @GET('/sessions/{sessionId}')
  Future<CheckSessionDto> checkSession({
    @Header('Authorization') String? authorization,
    @Path('sessionId') String? sessionId,
  });

  @override
  @POST('/sessions')
  Future<SessionDto> setInitiative(
      {@Header('Authorization') String? authorization,
      @Header('AuthToken') String? authToken,
      @Header('RefreshToken') String? refreshToken,
      @Body() required InitiativeBodyDto initiativeBodyDto});

  @override
  @POST('/sessions-qr/generate-qr/{corporateId}')
  Future<dynamic> generateQr({
    @Header('Authorization') String? authorization,
    @Path('corporateId') String? corporateId,
  });

  @override
  @GET('/sessions-qr/{uuid}/validate-qr')
  Future<AuthTokenQrResponseDto?> validateQr({
    @Header('Authorization') String? authorization,
    @Path('uuid') String? uuid,
  });

  @override
  @GET(
    '/sessions/user/externalId?corporateId={corporateId}&username={username}',
  )
  Future<dynamic> getExternalIdByUsername({
    @Header('Authorization') String? authorization,
    @Path('corporateId') String? corporateId,
    @Path('username') String? username,
  });
}
