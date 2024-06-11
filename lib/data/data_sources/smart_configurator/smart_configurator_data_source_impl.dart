import 'package:open_learning_smart_tv/data/data_sources/smart_configurator/smart_configurator_data_source.dart';
import 'package:open_learning_smart_tv/domain/entities/color_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../core/web_client_config/web_client_config.dart';
import '../../models/responses/smart_configurator/smart_configurator_dto.dart';

part 'smart_configurator_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: SmartConfiguratorDataSource)
abstract class SmartConfiguratorDataSourceImpl
    implements SmartConfiguratorDataSource {
  @factoryMethod
  factory SmartConfiguratorDataSourceImpl(
          @Named(WebClientType.authenticated) Dio dio) =
      _SmartConfiguratorDataSourceImpl;

  @override
  @GET('/smartconfigurator/configurations/{corporateId}/{initiativeId}')
  Future<SmartConfiguratorDto> getConfigurations({
    @Path('corporateId') String? corporateId,
    @Path('initiativeId') String? initiativeId,
  });

  @override
  @GET('/smartconfigurator/getColours/{initiativeId}')
  Future<List<ColorResponse>> getColours({
    @Path('initiativeId') String? initiativeId,
  });
}
