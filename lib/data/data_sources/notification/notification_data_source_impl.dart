import 'package:open_learning_smart_tv/data/data_sources/notification/notification_data_source.dart';
import 'package:open_learning_smart_tv/data/models/requests/register_device_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/notification/register_device_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import '../../../core/web_client_config/web_client_config.dart';
import '../../models/requests/notification/set_notification_read_request.dart';
import '../../models/responses/notification/notifications_dto.dart';

part 'notification_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: NotificationDataSource)
abstract class NotificationDataSourceImpl implements NotificationDataSource {
  @factoryMethod
  factory NotificationDataSourceImpl(
          @Named(WebClientType.authenticated) Dio dio) =
      _NotificationDataSourceImpl;

  @override
  @POST('{path}')
  Future<RegisterDeviceResponse?> registerDevice(
    @Path('path') String path,
    @Body() RegisterDeviceBodyDto registerDeviceBodyDto,
  );

  @override
  @GET('/notificator/messages?outputChannel=PUSH')
  Future<NotificationsDto?> getNotifications();

  @override
  @POST('/notificator/messages?outputChannel=PUSH')
  Future<NotificationsDto?> setRead(@Body() SetNotificationReadRequest req);
}
