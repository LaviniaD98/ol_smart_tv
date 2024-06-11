import 'package:open_learning_smart_tv/data/data_sources/web_player/web_player_data_source.dart';
import 'package:open_learning_smart_tv/data/models/requests/linkedin_request_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/web_view_player/linkedin_response_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/web_view_player/sessionid_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import '../../../core/web_client_config/web_client_config.dart';
import '../../models/requests/sessionid_request_body_dto.dart';
part 'web_player_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: WebPlayerDataSource)
abstract class WebPlayerDataSourceImpl implements WebPlayerDataSource {
  @factoryMethod
  factory WebPlayerDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _WebPlayerDataSourceImpl;

  @override
  @POST('{path}')
  Future<SessionIdResponseDto> requestSessionId(
      @Path('path') String path, @Body() SessionIdRequestBodyDto param);

  @override
  @POST('{path}')
  Future<LinkedinResponseDto> requestLinkedinUrl(
      @Path('path') String path, @Body() LinkedinRequestBodyDto param);
}
