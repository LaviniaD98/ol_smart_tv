import 'package:open_learning_smart_tv/data/data_sources/download/download_data_source.dart';
import 'package:open_learning_smart_tv/data/models/responses/download/download_object_info_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:retrofit/retrofit.dart';

part 'download_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: DownloadDataSource)
abstract class DownloadDataSourceImpl implements DownloadDataSource {
  @factoryMethod
  factory DownloadDataSourceImpl(
      @Named(WebClientType.dynamicUrlClient) Dio dio) = _DownloadDataSourceImpl;

  @override
  @GET('{path}')
  Future<DownloadObjectInfoDto> retrieveDownloadInfo(
    @Header('Accept') String accept,
    @Path('path') String path,
  );
}
