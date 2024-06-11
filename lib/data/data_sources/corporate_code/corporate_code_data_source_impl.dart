import 'package:open_learning_smart_tv/data/models/responses/corporate_code/corporate_code_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../core/web_client_config/web_client_config.dart';
import 'corporate_code_data_source.dart';

part 'corporate_code_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: CorporateCodeDataSource)
abstract class CorporateCodeDataSourceImpl implements CorporateCodeDataSource {
  @factoryMethod
  factory CorporateCodeDataSourceImpl(
          @Named(WebClientType.defaultClient) Dio dio) =
      _CorporateCodeDataSourceImpl;

  @override
  @GET('usermgmt/corporates/code/{corporate_code_disambiguation}')
  Future<CorporateCodeDto> getCorporateCode(
    @Path('corporate_code_disambiguation') String? disambiguationCode,
  );
}
