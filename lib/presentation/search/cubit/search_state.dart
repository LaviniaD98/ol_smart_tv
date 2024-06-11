part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial(List<String> latestResearch) = _Initial;
  const factory SearchState.suggestions(List<SuggestionModel> suggestions, String search) = _Suggestions;
  const factory SearchState.searchPaginated() = _SearchPaginated;
  const factory SearchState.error(Failure failure) = _Error;
  const factory SearchState.empty([String? search]) = _Empty;
  const factory SearchState.loading() = _Loading;
}
