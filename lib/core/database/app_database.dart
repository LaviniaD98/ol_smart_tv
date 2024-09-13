import 'package:open_learning_smart_tv/core/database/tables/offline_player_tracking/converters/video_statement_type_converter.dart';
import 'package:open_learning_smart_tv/core/database/tables/offline_player_tracking/offline_statements.dart';
import 'package:open_learning_smart_tv/core/database/tables/offline_player_tracking/offline_statements_dao.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../domain/enums/types.dart';
import 'tables/local_notifications/converters/local_notification_type_converter.dart';
import 'tables/local_notifications/local_notifications.dart';
import 'tables/local_notifications/local_notifications_dao.dart';

part 'app_database.g.dart';

@lazySingleton
@DriftDatabase(
    tables: [LocalNotifications, OfflineStatements],
    daos: [LocalNotificationsDao, OfflineStatementsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(LazyDatabase super.lazyDatabase);

  @override
  int get schemaVersion => 1;

  Future<void> clean() async {
    await transaction(() async {
      for (final table in allTables) {
        try {
          await delete(table).go();
        } catch (_) {}
      }
    });
  }
}
