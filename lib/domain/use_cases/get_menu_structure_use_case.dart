import 'package:open_learning_smart_tv/domain/entities/menu/menu_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/menu/menu_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

@lazySingleton
class GetMenuStructureUseCase {
  final MenuRepository _menuRepository;
  GetMenuStructureUseCase(this._menuRepository);
  Future<Either<Failure, MenuModel>> call(int corporateId, int initiativeId) {
    return _menuRepository.getMenu(corporateId, initiativeId);
  }
}
