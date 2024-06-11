import 'package:open_learning_smart_tv/core/database/tables/local_notifications/converters/local_notification_type_converter.dart';
import 'package:drift/drift.dart';

@DataClassName('LocalNotification')
class LocalNotifications extends Table {
  IntColumn get id => integer()();

  TextColumn get title => text().nullable()();

  TextColumn get body => text().nullable()();

  BoolColumn get read => boolean().withDefault(const Constant(false))();

  DateTimeColumn get sentTime => dateTime().withDefault(currentDateAndTime)();

  TextColumn get type => text().map(const LocalNotificationTypeConverter())();
}
