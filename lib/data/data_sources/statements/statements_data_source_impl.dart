import 'package:open_learning_smart_tv/data/data_sources/statements/statements_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import '../../../core/web_client_config/web_client_config.dart';
import '../../models/requests/statements_body_dto.dart';
import '../../models/requests/xapi_body_dto.dart';
import '../../models/responses/statements/xapi_state_results_dto.dart';

part 'statements_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: StatementsDataSource)
abstract class StatementsDataSourceImpl implements StatementsDataSource {
  @factoryMethod
  factory StatementsDataSourceImpl(
      @Named(WebClientType.authenticated) Dio dio) = _StatementsDataSourceImpl;

  @override
  @POST('{path}')
  Future<List<String>> statements(
      /*@Header('X-Amz-Date') amzDate,
      @Header('X-Amz-SignedHeaders') signedHeader,
      @Header('X-Amz-Expires') amzExpires,
      @Header('X-Amz-Credential') amzCredentials,*/
      @Header('X-Experience-Api-Version') xapiVer,
      @Path('path') String path,
      @Body() StatementsDto statObj);

  @override
  @POST('{path}')
  Future<XapiStateResultsDto> setState(
      @Header('X-Experience-Api-Version') xapiVer,
      @Path('path') String path,
      @Body() XapiBodyDto stateDto);

  @override
  @GET('{path}')
  Future<XapiStateResultsDto> getState(
      @Header('X-Experience-Api-Version') xapiVer, @Path('path') String path);
}
