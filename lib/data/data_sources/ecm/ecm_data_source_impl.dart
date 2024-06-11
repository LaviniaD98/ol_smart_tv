import 'package:open_learning_smart_tv/data/models/requests/ecm/ecm_register_request.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/responses/ecm/ecm_disciplines_dto.dart';
import '../../models/responses/ecm/ecm_professions_dto.dart';
import 'ecm_data_source.dart';

part 'ecm_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: EcmDataSource)
abstract class EcmDataSourceImpl implements EcmDataSource {
  @factoryMethod
  factory EcmDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _EcmDataSourceImpl;

  @override
  @GET('/learning-catalogue/ecm/professions?page={page}&page_size={pageSize}')
  Future<EcmProfessionsDto> getProfessions(
    @Path('page') int page,
    @Path('pageSize') int pageSize,
  );

  @override
  @GET(
      '/learning-catalogue/ecm/professions/disciplines?page={page}&page_size={pageSize}&profession_ids={professionIds}')
  Future<EcmDisciplinesDto> getDiscipline(
    @Path('page') int page,
    @Path('pageSize') int pageSize,
    @Path('professionIds') String professionIds,
  );

  @override
  @POST('/ecmRegistration')
  Future<void> register(
    @Body() EcmRegisterRequest request,
  );
}
