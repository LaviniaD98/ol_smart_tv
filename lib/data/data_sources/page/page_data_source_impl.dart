import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/responses/page/page_dto.dart';
import 'page_data_source.dart';

part 'page_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: PageDataSource)
abstract class PageDataSourceImpl implements PageDataSource {
  @factoryMethod
  factory PageDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _PageDataSourceImpl;

  @override
  @GET('{path}')
  Future<PageDto> getPage(
    @Path('path') String path,
  );
}
