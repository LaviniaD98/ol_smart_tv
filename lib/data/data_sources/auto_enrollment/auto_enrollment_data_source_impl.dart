import 'package:open_learning_smart_tv/data/data_sources/auto_enrollment/auto_enrollment_data_source.dart';
import 'package:open_learning_smart_tv/data/models/responses/enrollment/enrollment_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import '../../../core/web_client_config/web_client_config.dart';
import '../../models/requests/enrollment_body_dto.dart';

part 'auto_enrollment_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: AutoEnrollmentDataSource)
abstract class AutoEnrollmentDataSourceImpl
    implements AutoEnrollmentDataSource {
  @factoryMethod
  factory AutoEnrollmentDataSourceImpl(
          @Named(WebClientType.authenticated) Dio dio) =
      _AutoEnrollmentDataSourceImpl;

  @override
  @POST('{path}')
  Future<EnrollmentResponseDto> enrollment(
      @Path('path') String path, @Body() List<EnrollmentDto> elist);
}
