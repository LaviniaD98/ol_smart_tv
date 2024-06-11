import 'package:open_learning_smart_tv/core/database/app_database.dart';
import 'package:open_learning_smart_tv/core/database/tables/offline_player_tracking/offline_statements_dao.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetStatementsUseCase {
  final OfflineStatementsDao _offlineStatementsDao;
  GetStatementsUseCase(
    this._offlineStatementsDao,
  );

  Future<Either<Failure, List<OfflineStatement>>> call() async {
    return await _offlineStatementsDao.getAll();
  }
}
