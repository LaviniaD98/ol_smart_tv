import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:open_learning_smart_tv/data/data_sources/user/user_data_source.dart';
import 'package:open_learning_smart_tv/data/models/responses/self/self_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'user_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: UserDataSource)
abstract class UserDataSourceImpl implements UserDataSource {
  @factoryMethod
  factory UserDataSourceImpl(@Named(WebClientType.defaultClient) Dio dio) =
      _UserDataSourceImpl;

  @override
  @GET('/usermgmt/users/self')
  Future<SelfDto> self({
    @Header('Authorization') String? authorization,
    @Header('X-Ada-Session-Token') String? sessionId,
  });

  @override
  @PUT('/usermgmt/users/self/privacyconsent')
  Future<void> setPrivacyConsent({
    @Header('Authorization') String? authorization,
    @Header('X-Ada-Session-Token') String? sessionId,
  });
}
