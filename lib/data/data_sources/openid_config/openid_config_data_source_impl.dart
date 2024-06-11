import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../core/web_client_config/web_client_config.dart';
import '../../models/responses/openid_config/openid_config_dto.dart';
import 'openid_config_data_source.dart';

part 'openid_config_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: OpenidConfigDataSource)
abstract class OpenidConfigDataSourceImpl implements OpenidConfigDataSource {

  @factoryMethod
  factory OpenidConfigDataSourceImpl(@Named(WebClientType.defaultClient) Dio dio) =
  _OpenidConfigDataSourceImpl;
  
  @override
  @GET('{path}')
  Future<OpenidConfigDto> getOpenidConfig(
      @Path('path') String path
    );
}