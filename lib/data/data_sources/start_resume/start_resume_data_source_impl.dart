import 'package:open_learning_smart_tv/data/data_sources/start_resume/start_resume_data_source.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/learning_object_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../core/web_client_config/web_client_config.dart';

part 'start_resume_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: StartResumeDataSource)
abstract class StartResumeDataSourceImpl implements StartResumeDataSource {
  @factoryMethod
  factory StartResumeDataSourceImpl(
      @Named(WebClientType.authenticated) Dio dio) = _StartResumeDataSourceImpl;

  @override
  @POST('{path}')
  Future<LearningObjectDto> startOrResume(
    @Path('path') String path,
  );
}
