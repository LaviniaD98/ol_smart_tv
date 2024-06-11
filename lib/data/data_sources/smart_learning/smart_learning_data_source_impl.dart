import 'package:open_learning_smart_tv/data/data_sources/smart_learning/smart_learning_data_source.dart';
import 'package:open_learning_smart_tv/data/models/requests/create_slot_request.dart';
import 'package:open_learning_smart_tv/data/models/responses/smart_learning/slot/slot_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/responses/smart_learning/smart_learning_slots_dto.dart';

part 'smart_learning_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: SmartLearningDataSource)
abstract class SmartLearningDataSourceImpl implements SmartLearningDataSource {
  @factoryMethod
  factory SmartLearningDataSourceImpl(
          @Named(WebClientType.authenticated) Dio dio) =
      _SmartLearningDataSourceImpl;

  @override
  @GET(
      '/usermgmt/learner/smart-learning/slots?start_date={startDate}&end_date={endDate}&month={month}&year={year}')
  Future<SmartLearningSlotsDto> getSlots({
    @Path('startDate') required String startDate,
    @Path('endDate') required String endDate,
    @Path('month') required int month,
    @Path('year') required int year,
  });

  @override
  @POST('/usermgmt/learner/smart-learning/slots')
  Future<SlotDto> create(
    @Body() CreateSlotRequest request,
  );

  @override
  @PUT('/usermgmt/learner/smart-learning/slots/{slotId}')
  Future<SlotDto> update({
    @Path('slotId') required int slotId,
    @Body() required CreateSlotRequest request,
  });

  @override
  @DELETE('/usermgmt/learner/smart-learning/slots/{slotId}')
  Future<void> delete(
    @Path('slotId') int slotId,
  );
}
