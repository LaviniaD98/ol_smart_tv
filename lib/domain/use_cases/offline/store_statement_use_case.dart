import 'package:open_learning_smart_tv/core/database/tables/offline_player_tracking/offline_statements_dao.dart';
import 'package:open_learning_smart_tv/data/models/requests/offline/offline_statements_info.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item_wall.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StoreStatementUseCase {
  final OfflineStatementsDao _offlineStatementsDao;
  StoreStatementUseCase(
    this._offlineStatementsDao,
  );

  Future call(
      PlayerEvent playerEvent,
      DownloadedItemExtended downloadedItemExtended,
      OfflineStatementsInfo offlineStatementsInfo) async {
    try {
      if (downloadedItemExtended.downloadedItem != null) {
        final res = await _offlineStatementsDao.add(
            downloadedItem: downloadedItemExtended.downloadedItem!,
            offlineStatementsInfo: offlineStatementsInfo,
            type: playerEvent);
        res.fold((l) {}, (offlineStatement) {});
      }
    } catch (e) {
      return null;
    }
  }
}
