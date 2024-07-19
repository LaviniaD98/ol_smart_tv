import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/search/clean_local_suggestions_use_case.dart';
import '../../../domain/use_cases/search/get_local_suggestions_use_case.dart';
import '../../../domain/use_cases/search/set_local_suggestions_use_case.dart';

@injectable
class SuggestionsCubit extends Cubit<List<String>> {
  final GetLocalSuggestionsUseCase _getLocalSuggestionsUseCase;
  final SetLocalSuggestionsUseCase _setLocalSuggestionsUseCase;
  final CleanLocalSuggestionsUseCase _cleanLocalSuggestionsUseCase;

  SuggestionsCubit(
    this._getLocalSuggestionsUseCase,
    this._setLocalSuggestionsUseCase,
    this._cleanLocalSuggestionsUseCase,
  ) : super(const []);

  Timer? _timer;

  void localSuggestions([bool reset = false]) async {
    _timer?.cancel();
    if (reset) {
      await _cleanLocalSuggestionsUseCase();
    }
    final localSuggestions = _getLocalSuggestionsUseCase().reversed.toList();
    emit(localSuggestions);
  }

  void setLocalSuggestions({required String text}) {
    _setLocalSuggestionsUseCase(text);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
