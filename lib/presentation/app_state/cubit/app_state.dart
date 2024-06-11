part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial({String? initialRoute, List<MenuRoute>? dynamicRoutes, DateTime? date, bool? showPopup}) = _Initial;
}
