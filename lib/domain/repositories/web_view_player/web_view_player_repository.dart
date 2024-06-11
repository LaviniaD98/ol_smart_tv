import 'package:open_learning_smart_tv/data/models/requests/linkedin_request_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/web_view_player/linkedin_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/web_view_player/sessionid_response_model.dart';
import 'package:dartz/dartz.dart';
import '../../../data/models/failure.dart';
import '../../../data/models/requests/sessionid_request_body_dto.dart';

abstract class WebViewPlayerRepository {
  Future<Either<Failure, SessionIdResponseModel>> requestSessionId(
      String path, SessionIdRequestBodyDto param);
  Future<Either<Failure, LinkedInResponseModel>> requestLinkedinUrl(
      String path, LinkedinRequestBodyDto param);
}
