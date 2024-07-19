import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../data/models/failure.dart';
import '../../../domain/entities/search/suggestion_model.dart';
import '../../../domain/entities/strip/learning_object/learning_object_model.dart';
import '../../../domain/use_cases/search/clean_local_suggestions_use_case.dart';
import '../../../domain/use_cases/search/get_local_suggestions_use_case.dart';
import '../../../domain/use_cases/search/get_search_results_use_case.dart';
import '../../../domain/use_cases/search/get_suggestions_use_case.dart';
import '../../../domain/use_cases/search/set_local_suggestions_use_case.dart';
import '../../../remote_theming/config/config_manager.dart';
import '../../../remote_theming/config/remote_config_keys.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final GetSearchResultsUseCase _getSearchResultsUseCase;
  final GetSuggestionsUseCase _getSuggestionsUseCase;
  final GetLocalSuggestionsUseCase _getLocalSuggestionsUseCase;
  final SetLocalSuggestionsUseCase _setLocalSuggestionsUseCase;
  final CleanLocalSuggestionsUseCase _cleanLocalSuggestionsUseCase;

  SearchCubit(
    this._getSearchResultsUseCase,
    this._getSuggestionsUseCase,
    this._getLocalSuggestionsUseCase,
    this._setLocalSuggestionsUseCase,
    this._cleanLocalSuggestionsUseCase,
  ) : super(const SearchState.loading());

  PagingController<int, LearningObjectModel>? controller;
  int pageSize =
      ConfigManager().getRemoteInt(RemoteConfigKeys.page_size_search, 20);
  int? totalElements;
  Timer? _timer;

  void localSuggestions([bool reset = false]) async {
    _timer?.cancel();
    _resetPagingController();
    if (reset) {
      await _cleanLocalSuggestionsUseCase();
    }
    final localSuggestions = _getLocalSuggestionsUseCase().reversed.toList();
    emit(SearchState.initial(localSuggestions));
  }

  void onChanged(String text) async {
    _timer?.cancel();
    if (text.length >= 3) {
      _getSuggestions(text);
    } else if (text.isEmpty) {
      localSuggestions();
    } else {
      emit(const SearchState.empty());
    }
  }

  void initPagingController(String searchText) async {
    if (controller == null) {
      controller = PagingController(firstPageKey: 0);
      controller?.addPageRequestListener((pageKey) {
        _search(searchText, pageKey);
      });
      emit(const SearchState.searchPaginated());
    }
  }

  void _getSuggestions(String text) async {
    _timer = Timer(const Duration(milliseconds: 500), () async {
      emit(const SearchState.loading());
      _resetPagingController();
      final res = await _getSuggestionsUseCase(text);
      res.fold((l) {
        emit(SearchState.error(l));
      }, (r) {
        if (r.isNotEmpty) {
          emit(SearchState.suggestions(r, text));
        } else {
          emit(SearchState.empty(text));
        }
      });
    });
  }

  void _resetPagingController() {
    if (controller != null) {
      controller!.dispose();
      controller = null;
    }
  }

  void _updatePagingController({
    required bool isLast,
    required List<LearningObjectModel> items,
    required int page,
  }) {
    if (isLast) {
      controller?.appendLastPage(items);
    } else {
      final nextPageKey = page += 1;
      controller?.appendPage(items, nextPageKey);
    }
  }

  void _search(String searchText, int page) async {
    _timer?.cancel();
    final res = await _getSearchResultsUseCase(
      text: searchText,
      page: page,
      pageSize: pageSize,
    );

    res.fold((l) {
      controller?.error = l.error;
    }, (r) {
      _setLocalSuggestionsUseCase(searchText);
      if (r.metadata != null && r.metadata!.totalPages != null) {
        final isLast = page == r.metadata!.totalPages! - 1;
        _updatePagingController(
          items: r.learningObjects,
          page: page,
          isLast: isLast,
        );
        totalElements = r.metadata?.totalElements ?? 0;
      } else {
        final isLast = r.learningObjects.length < pageSize;
        _updatePagingController(
          items: r.learningObjects,
          page: page,
          isLast: isLast,
        );
      }
    });
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}
