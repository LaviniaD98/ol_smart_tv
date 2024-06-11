import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../../core/web_client_config/web_client_config.dart';
import '../../models/requests/download_ics_request_dto.dart';
import 'download_ics_data_source.dart';

part 'download_ics_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: DownloadIcsDataSource)
abstract class DownloadIcsDataSourceImpl implements DownloadIcsDataSource {
  @factoryMethod
  factory DownloadIcsDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
    _DownloadIcsDataSourceImpl;

  @override
  @POST('/learning-catalogue/{corporateId}/{initiativeId}/downloadIcs')
  Future<HttpResponse<String>> downloadEvents({
    @Body() DownloadIcsRequestDto? body,
    @Path('corporateId') String? corporateId,
    @Path('initiativeId') String? initiativeId,
  });
}