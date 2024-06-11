import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../core/web_client_config/web_client_config.dart';
import '../../models/responses/progress/learner_goals_dto.dart';
import '../../models/responses/progress/learner_progress_dto.dart';
import '../../models/responses/progress/progress_goals_config_dto.dart';
import 'learner_progress_data_source.dart';

part 'learner_progress_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: LearnerProgressDataSource)
abstract class LearnerProgressDataSourceImpl implements LearnerProgressDataSource {
  @factoryMethod
  factory LearnerProgressDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) = _LearnerProgressDataSourceImpl;

  @override
  @GET('runtastic/learnerProgress/{corporateId}/{learnerId}')
  Future<LearnerProgressDto> getLearnerProgress(
    @Path('corporateId') String corporateId,
    @Path('learnerId') String learnerId,
  );

  @override
  @GET('runtastic/learnerGoals/{corporateId}/{learnerId}')
  Future<LearnerGoalsDto> getLearnerGoals(
    @Path('corporateId') String corporateId,
    @Path('learnerId') String learnerId,
  );

  @override
  @GET('runtastic/configs/{corporateId}')
  Future<ProgressGoalsConfigDto> getProgressGoalsConfig(
    @Path('corporateId') String? corporateId,
  );
}