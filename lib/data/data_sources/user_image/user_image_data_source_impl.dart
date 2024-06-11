import 'package:open_learning_smart_tv/data/data_sources/user_image/user_image_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../core/web_client_config/web_client_config.dart';

part 'user_image_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: UserImageDataSource)
abstract class UserImageDataSourceImpl implements UserImageDataSource {
  @factoryMethod
  factory UserImageDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _UserImageDataSourceImpl;

  @override
  @GET('/mediamanager/userprofile/{userId}/image')
  Future<String> getUserImage(@Path('userId') int? userId);
}
