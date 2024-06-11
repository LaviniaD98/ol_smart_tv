import 'package:open_learning_smart_tv/core/database/tables/offline_player_tracking/converters/video_statement_type_converter.dart';
import 'package:drift/drift.dart';

@DataClassName('OfflineStatement')
class OfflineStatements extends Table {
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();

  TextColumn get videoId => text().nullable()();

  TextColumn get trackinJsongObject => text().nullable()();

  TextColumn get offlineVideoJsongObject => text().nullable()();

  // TextColumn get type => text().nullable()();

  TextColumn get type => text().map(const VideoStatementTypeConverter())();
}
