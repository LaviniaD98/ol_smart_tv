import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/enums/types.dart';
import '../../app_database.dart';
import 'local_notifications.dart';

part 'local_notifications_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [LocalNotifications])
class LocalNotificationsDao extends DatabaseAccessor<AppDatabase>
    with _$LocalNotificationsDaoMixin {
  LocalNotificationsDao(super.attachedDatabase);

  Future<Either<Failure, LocalNotification>> add(
      {required RemoteMessage message, bool read = false}) {
    return catchFailure(() => into(localNotifications).insertReturning(
          LocalNotificationsCompanion.insert(
            id: message.notification.hashCode,
            title: Value<String?>(message.notification?.title),
            body: Value<String?>(message.notification?.body),
            type: LocalNotificationType
                .reminder, //(LocalNotificationType.values.toList()..shuffle()).first, //TODO random value for test
            read: Value<bool>(read),
            sentTime: Value<DateTime>(message.sentTime ?? DateTime.now()),
          ),
        ));
  }

  Future<Either<Failure, List<LocalNotification>>> getAll() {
    return catchFailure(() => select(localNotifications).get());
  }

  UpdateStatement<LocalNotifications, LocalNotification> setRead(int id) {
    return update(localNotifications)
      ..where((tbl) => tbl.id.equals(id))
      ..write(
        const LocalNotificationsCompanion(read: Value(true)),
      );
  }

  Future<LocalNotification> getById(int id) {
    return (select(localNotifications)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> deleteById(int id) async {
    return await (delete(localNotifications)..where((t) => t.id.equals(id)))
            .go() ==
        1;
  }

  Future<Either<Failure, int>> cleanOldItems() async {
    return catchFailure(() => (delete(localNotifications)
          ..where((row) {
            return row.sentTime.isSmallerOrEqualValue(
                DateTime.now().subtract(const Duration(days: 30)));
          }))
        .go());
  }
}
