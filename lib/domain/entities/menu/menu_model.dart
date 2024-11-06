import 'package:open_learning_smart_tv/data/models/responses/menu/menu_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:collection/collection.dart';
import '../../../data/models/responses/generic/relative_path_dto.dart';

class MenuModel {
  final String? menuType;
  final List<MenuRoute>? relativePaths;

  const MenuModel({this.menuType, this.relativePaths});

  factory MenuModel.fromResponse(MenuDto dto) {
    return MenuModel(
      menuType: dto.menuType,
      relativePaths: dto.relativePaths!
          .mapIndexed((i, e) => _dtoToMenuRoute(i, e))
          .whereType<MenuRoute>()
          .toList(),
    );
  }

  static MenuRoute? _dtoToMenuRoute(int index, RelativePathDto e) {
    switch (e.serviceType) {
      case 'visForyou':
        return MenuRoute.visForYou(
          id: e.id,
          title: e.title,
          routeName: MenuServiceType.visForYou.routeName,
          labelMapping: e.labelMapping,
          apiPath: e.apiPath,
          preSelected: e.preSelected,
        );
      case 'visSearch':
        return MenuRoute.visSearch(
          id: e.id,
          title: e.title,
          routeName: MenuServiceType.visSearch.routeName,
          labelMapping: e.labelMapping,
          apiPath: e.apiPath,
          preSelected: e.preSelected,
        );
      case 'visExplore':
        return MenuRoute.visExplore(
          id: e.id,
          title: e.title,
          routeName: MenuServiceType.visExplore.routeName,
          labelMapping: e.labelMapping,
          apiPath: e.apiPath,
          preSelected: e.preSelected,
        );
      case 'funcCommunity':
        return MenuRoute.visCommunity(
          id: e.id,
          title: e.title,
          routeName: MenuServiceType.community.routeName,
          labelMapping: e.labelMapping,
          apiPath: e.apiPath,
          preSelected: e.preSelected,
        );
      default:
        return null;
    }
  }
}

enum MenuServiceType {
  visForYou('visForyou'),
  visSearch('visSearch'),
  visExplore('visExplore'),
  community('funcCommunity'),
  favorites('favorites'),
  agenda('agenda');

  final String routeName;
  const MenuServiceType(this.routeName);
}
