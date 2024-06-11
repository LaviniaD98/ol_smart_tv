import 'package:open_learning_smart_tv/core/database/tables/offline_player_tracking/offline_statements_dao.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteStatementsUseCase {
  final OfflineStatementsDao _offlineStatementsDao;
  DeleteStatementsUseCase(
    this._offlineStatementsDao,
  );

  Future<bool> call(String videoId) async {
    return await _offlineStatementsDao.deleteById(videoId);
  }
}
