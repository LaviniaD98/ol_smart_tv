import 'package:freezed_annotation/freezed_annotation.dart';
part 'menu_route.freezed.dart';

@freezed
class MenuRoute with _$MenuRoute {
  const MenuRoute._();
  const factory MenuRoute.visForYou({
    required int id,
    required String apiPath,
    required String routeName,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = VisForYou;
  const factory MenuRoute.visSearch({
    required int id,
    required String apiPath,
    required String routeName,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = VisSearch;
  const factory MenuRoute.visExplore({
    required int id,
    required String apiPath,
    required String routeName,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = VisExplore;
  const factory MenuRoute.visCommunity({
    required int id,
    required String apiPath,
    required String routeName,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = VisCommunity;
}