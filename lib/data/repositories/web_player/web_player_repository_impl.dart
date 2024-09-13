import 'package:open_learning_smart_tv/data/data_sources/web_player/web_player_data_source.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/data/models/requests/linkedin_request_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/web_view_player/linkedin_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/web_view_player/sessionid_response_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/web_view_player/web_view_player_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../models/requests/sessionid_request_body_dto.dart';

@LazySingleton(as: WebViewPlayerRepository)
class WebPlayerRepositoryImpl implements WebViewPlayerRepository {
  final WebPlayerDataSource _wpDataSource;

  WebPlayerRepositoryImpl(this._wpDataSource);

  @override
  Future<Either<Failure, SessionIdResponseModel>> requestSessionId(
      String path, SessionIdRequestBodyDto param) {
    return catchFailure(() async {
      final res = await _wpDataSource.requestSessionId(path, param);

      return SessionIdResponseModel.fromResponse(res);
    });
  }

  @override
  Future<Either<Failure, LinkedInResponseModel>> requestLinkedinUrl(
      String path, LinkedinRequestBodyDto param) {
    return catchFailure(() async {
      final res = await _wpDataSource.requestLinkedinUrl(path, param);

      return LinkedInResponseModel.fromResponse(res);
    });
  }
}
