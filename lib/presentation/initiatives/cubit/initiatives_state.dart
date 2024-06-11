part of 'initiatives_cubit.dart';

@freezed
class InitiativesState with _$InitiativesState {
  const factory InitiativesState.initial() = _Initial;
  const factory InitiativesState.loading() = _Loading;
  const factory InitiativesState.error(String errorMessage) = _Error;
  const factory InitiativesState.success(List<MenuRoute>? routes, String initial) = _Success;
}
