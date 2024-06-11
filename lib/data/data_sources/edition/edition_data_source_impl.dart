import 'package:open_learning_smart_tv/data/data_sources/edition/edition_data_source.dart';
import 'package:open_learning_smart_tv/data/models/requests/edition_patch_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/edition/edition_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import '../../../core/web_client_config/web_client_config.dart';

part 'edition_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: EditionDataSource)
abstract class EditionDataSourceImpl implements EditionDataSource {
  @factoryMethod
  factory EditionDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _EditionDataSourceImpl;

  @override
  @PATCH('{path}')
  Future<EditionResponseDto> register(
      @Path('path') String path, @Body() List<EditionPatchBodyDto> elist);
}
