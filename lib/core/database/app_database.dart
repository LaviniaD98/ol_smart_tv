import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

part 'app_database.g.dart';

@lazySingleton
@DriftDatabase()
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
