import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/domain/use_cases/page/get_page_structure_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_standard_strip_use_case.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_all_content_cubit.dart';

import '../../../domain/use_cases/smart_configurator/get_stored_smart_configuration_use_case.dart';

part 'favorites_content_state.dart';
part 'favorites_content_cubit.freezed.dart';

@injectable
class FavoritesContentCubit extends Cubit<FavoritesContentState> {
  final GetPageStructureUseCase _getPageStructureUseCase;
  final GetStandardStripUseCase _getSuggestedStripUseCase;
  final GetStoredSmartConfigurationUseCase _getStoredSmartConfigurationUseCase;

  DynamicLocalContent? dynamicContent;

  FavoritesContentCubit(
    this._getPageStructureUseCase,
    this._getStoredSmartConfigurationUseCase,
    this._getSuggestedStripUseCase,
  ) : super(const FavoritesContentState.loading());

  void init(String path, [List<String>? filters, bool debug = false]) async {
    emit(const FavoritesContentState.loading());
    final res = await _getPageStructureUseCase(path);
    res.fold(
      (l) {
        emit(FavoritesContentState.error(l));
      },
      (page) async {
        final smartConfig = await _getStoredSmartConfigurationUseCase();
        dynamicContent = DynamicLocalContent(
          path: path,
          filters: filters,
          smartConfig: smartConfig,
          page: page,
        );

        final v = await getAllRows();
        emit(FavoritesContentState.success(rowItems: v));
      },
    );
  }

  Future<List<Map<StripRow, List<LearningObjectModel>>>> getAllRows(
      {bool debug = false}) async {
    if (dynamicContent == null) {
      return [];
    }

    final List<Map<StripRow, List<LearningObjectModel>>> mappedList = [];

    final allStripsFuture = dynamicContent?.page.strips.map((strip) {
          return fetch(strip: strip);
        }).toList() ??
        [];

    final allStrips = await Future.wait([...allStripsFuture]);

    for (final element in allStrips) {
      mappedList.add(element);
    }
    return mappedList;
  }

  Future<Map<StripRow, List<LearningObjectModel>>> fetch({
    StripRow? strip,
    bool debug = false,
  }) async {
    if (strip == null) {
      return {};
    }

    Map<StripRow, List<LearningObjectModel>> mappedList = {};

    final res = await _getSuggestedStripUseCase(
      strip: strip,
      filters: dynamicContent?.filters,
    );

    res.fold((l) {
      if (debug) {}
    }, (r) {
      if (r.isNotEmpty) {
        mappedList[strip] = List.from(r);
      }
    });

    return mappedList;
  }

  Future<void> refresh(String path) async {
    if (state is Success) {
      // final current = (state as Success);
      emit(const FavoritesContentState.loading());
      final res = await _getPageStructureUseCase(path);
      res.fold(
        (l) => emit(FavoritesContentState.error(l)),
        (page) async {
          // emit(current.copyWith(filters: [...?current.filters]));
        },
      );
    } else {
      init(path);
    }
  }

  void setFilters([List<String>? filters]) async {
    // emit((state as Success).copyWith(filters: [...?filters]));
  }
}
