import 'package:open_learning_smart_tv/data/models/requests/linkedin_request_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/web_view_player/linkedin_response_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/web_view_player/sessionid_response_dto.dart';
import '../../models/requests/sessionid_request_body_dto.dart';

abstract class WebPlayerDataSource {
  Future<SessionIdResponseDto> requestSessionId(
      String path, SessionIdRequestBodyDto param);

  Future<LinkedinResponseDto> requestLinkedinUrl(
      String path, LinkedinRequestBodyDto param);
}
