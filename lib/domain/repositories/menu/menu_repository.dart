import 'package:open_learning_smart_tv/domain/entities/menu/menu_model.dart';
import 'package:dartz/dartz.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

abstract class MenuRepository {
  Future<Either<Failure, MenuModel>> getMenu(int corporateId, int initiativeId);
}
