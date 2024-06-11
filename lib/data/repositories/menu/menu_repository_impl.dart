import 'package:open_learning_smart_tv/data/data_sources/menu/menu_data_source.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/menu_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/menu/menu_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

@LazySingleton(as: MenuRepository)
class MenuRepositoryImpl implements MenuRepository {
  final MenuDataSource _menuDataSource;

  MenuRepositoryImpl(this._menuDataSource);

  @override
  Future<Either<Failure, MenuModel>> getMenu(
      int corporateId, int initiativeId) {
    return catchFailure(() async {
      final res = await _menuDataSource.getMenu(corporateId, initiativeId);
      return MenuModel.fromResponse(res);
    });
  }
}
