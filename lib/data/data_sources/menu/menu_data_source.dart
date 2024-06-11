import 'package:open_learning_smart_tv/data/models/responses/menu/menu_dto.dart';

abstract class MenuDataSource {
  Future<MenuDto> getMenu(int corporateId, int initiativeId);
}
