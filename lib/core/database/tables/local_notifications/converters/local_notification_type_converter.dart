import 'package:drift/drift.dart';

import '../../../../../domain/enums/types.dart';


class LocalNotificationTypeConverter extends TypeConverter<LocalNotificationType, String> {
  const LocalNotificationTypeConverter();

  @override
  LocalNotificationType fromSql(String fromDb) {
    return LocalNotificationType.fromName(fromDb);
  }

  @override
  String toSql(LocalNotificationType value) {
    return value.name;
  }
}
