import 'package:open_learning_smart_tv/data/data_sources/topic/topics_data_source.dart';
import 'package:open_learning_smart_tv/data/models/responses/topics/topics_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:retrofit/retrofit.dart';

part 'topics_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: TopicsDataSource)
abstract class TopicsDataSourceImpl implements TopicsDataSource {
  @factoryMethod
  factory TopicsDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _TopicsDataSourceImpl;

  @override
  @GET('/usermgmt/learner/topics?generateUrl=true')
  Future<TopicsDto> getTopics();
}
