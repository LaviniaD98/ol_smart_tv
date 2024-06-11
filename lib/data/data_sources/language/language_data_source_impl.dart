import 'package:open_learning_smart_tv/data/data_sources/language/language_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../core/web_client_config/web_client_config.dart';
import '../../models/responses/language/labels_dto.dart';
import '../../models/responses/language/languages_dto.dart';

part 'language_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: LanguageDataSource)
abstract class LanguageSourceImpl implements LanguageDataSource {
  @factoryMethod
  factory LanguageSourceImpl(@Named(WebClientType.defaultClient) Dio dio) =
      _LanguageSourceImpl;

  @override
  @GET('/usermgmt/corporates/{corporateId}/languages')
  Future<LanguagesDto> getLanguages(
    @Path('corporateId') int corporateId,
  );

  @override
  @GET(
      '/smartconfigurator/labelTranslations/MOBILE/{corporateId}?initiativeId={initiativeId}&langCode={langCode}')
  Future<LabelsDto> getLabels({
    @Path('langCode') required String langCode,
    @Path('corporateId') required String corporateId,
    @Path('initiativeId') required String initiativeId,
  });
}
