import 'package:open_learning_smart_tv/data/data_sources/post/post_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/requests/post/cms_post_request.dart';

part 'post_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: PostDataSource)
abstract class PostDataSourceImpl implements PostDataSource {
  @factoryMethod
  factory PostDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _PostDataSourceImpl;

  @override
  @POST('/cmswrapper')
  Future<void> csmWrapperPost(@Body() CmsPostRequest request);
}
