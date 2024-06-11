import 'package:open_learning_smart_tv/data/data_sources/assets/app_resource_data_source.dart';
import 'package:open_learning_smart_tv/data/models/responses/assets/app_resource_get_file_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../core/web_client_config/web_client_config.dart';

part 'app_resource_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: AppResourceDataSource)
abstract class AppResourceDataSourceImpl implements AppResourceDataSource {
  @factoryMethod
  factory AppResourceDataSourceImpl(
      @Named(WebClientType.authenticated) Dio dio) = _AppResourceDataSourceImpl;

  @override
  @GET('/mediamanager/appresource/')
  Future<AppResourceGetFileDto> getFile({
    @Query('corporateId') String? corporateId,
    @Query('fileName') String? fileName,
  });
}
