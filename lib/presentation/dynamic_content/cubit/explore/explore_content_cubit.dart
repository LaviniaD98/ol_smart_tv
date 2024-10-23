import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/page/page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/smart_configurator/smart_configurator_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/domain/use_cases/page/get_page_structure_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_stored_smart_configuration_use_case.dart';
import 'package:collection/collection.dart';

part 'explore_content_state.dart';
part 'explore_content_cubit.freezed.dart';

@injectable
class ExploreContentCubit extends Cubit<ExploreContentState> {
  final GetPageStructureUseCase _getPageStructureUseCase;
  final GetStoredSmartConfigurationUseCase _getStoredSmartConfigurationUseCase;

  ExploreContentCubit(
    this._getPageStructureUseCase,
    this._getStoredSmartConfigurationUseCase,
  ) : super(const ExploreContentState.loading());

  void init(String path, [List<String>? filters]) async {
    emit(const ExploreContentState.loading());
    final res = await _getPageStructureUseCase(path);
    res.fold(
      (l) => emit(ExploreContentState.error(l)),
      (page) async {
        final start = DateTime.now().millisecond;
        final smartConfig = await _getStoredSmartConfigurationUseCase();
        final elapsed = start - DateTime.now().millisecond;
        if (kDebugMode) print("https:// smartConfig elapsed: $elapsed");

        final exploreCarousel = page.strips.firstWhereOrNull(
          (e) => e.labelMapping == "sliderTopContentExplore",
        );

        final otherStrips = List<StripRow>.from(page.strips)
          ..removeWhere(
              (element) => element.labelMapping == "sliderTopContentExplore");

        emit(
          ExploreContentState.success(
            path: path,
            filters: filters,
            smartConfig: smartConfig,
            page: page,
            exploreCarousel: exploreCarousel,
            strips: otherStrips,
          ),
        );
      },
    );
  }

  Future<void> refresh(String path) async {
    if (state is Success) {
      final current = (state as Success);
      emit(const ExploreContentState.loading());
      final res = await _getPageStructureUseCase(path);
      res.fold(
        (l) => emit(ExploreContentState.error(l)),
        (page) async {
          emit(current.copyWith(filters: [...?current.filters]));
        },
      );
    } else {
      init(path);
    }
  }

  void setFilters([List<String>? filters]) async {
    emit((state as Success).copyWith(filters: [...?filters]));
  }
}
