import 'package:open_learning_smart_tv/data/data_sources/menu/menu_data_source.dart';
import 'package:open_learning_smart_tv/data/models/responses/menu/menu_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:retrofit/retrofit.dart';

part 'menu_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: MenuDataSource)
abstract class MenuDataSourceImpl implements MenuDataSource {
  @factoryMethod
  factory MenuDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _MenuDataSourceImpl;

  @override
  @GET(
      '/learning-catalogue/{corporateId}/{initiativeId}/menuStructures?deviceType=MOBILE')
  Future<MenuDto> getMenu(
    @Path('corporateId') int corporateId,
    @Path('initiativeId') int initiativeId,
  );
}
