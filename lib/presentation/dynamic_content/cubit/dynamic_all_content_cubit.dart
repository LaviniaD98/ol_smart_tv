import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/page/page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/smart_configurator/smart_configurator_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/domain/use_cases/page/get_page_structure_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_standard_strip_use_case.dart';

import '../../../domain/use_cases/smart_configurator/get_stored_smart_configuration_use_case.dart';

part 'dynamic_all_content_state.dart';
part 'dynamic_all_content_cubit.freezed.dart';

@injectable
class DynamicAllContentCubit extends Cubit<DynamicAllContentState> {
  final GetPageStructureUseCase _getPageStructureUseCase;
  final GetStandardStripUseCase _getSuggestedStripUseCase;
  final GetStoredSmartConfigurationUseCase _getStoredSmartConfigurationUseCase;

  DynamicLocalContent? dynamicContent;
  Map<StripRow, List<LearningObjectModel>>? exploreCarousel;

  DynamicAllContentCubit(
    this._getPageStructureUseCase,
    this._getStoredSmartConfigurationUseCase,
    this._getSuggestedStripUseCase,
  ) : super(const DynamicAllContentState.loading());

  void init(String path, [List<String>? filters, bool debug = false]) async {
    final res = await _getPageStructureUseCase(path);
    res.fold(
      (l) {
        emit(DynamicAllContentState.error(l));
      },
      (page) async {
        final smartConfig = await _getStoredSmartConfigurationUseCase();
        dynamicContent = DynamicLocalContent(
          path: path,
          filters: filters,
          smartConfig: smartConfig,
          page: page,
        );

        await getAllRows();
      },
    );
  }

  Future<List<Map<StripRow, List<LearningObjectModel>>>> getAllRows({
    bool debug = false,
    bool excludeExploreBigCarousel = false,
  }) async {
    if (dynamicContent == null) {
      return [];
    }

    emit(const DynamicAllContentState.loading());

    final List<Map<StripRow, List<LearningObjectModel>>> mappedList = [];

    final allStripsFuture = dynamicContent?.page.strips.map((strip) {
          return fetch(strip: strip);
        }).toList() ??
        [];

    final allStrips = await Future.wait([...allStripsFuture]);

    for (final element in allStrips) {
      if (element.keys.firstOrNull?.labelMapping == 'sliderTopContentExplore') {
        exploreCarousel = element;
      } else {
        mappedList.add(element);
      }
    }

    emit(DynamicAllContentState.success(
      rowItems: mappedList,
      exploreCarousel: exploreCarousel,
    ));
    return mappedList;
  }

  Future<List<Map<StripRow, List<LearningObjectModel>>>> refreshStrips({
    bool debug = false,
    List<String>? filters,
  }) async {
    if (dynamicContent == null) {
      return [];
    }

    emit(
      DynamicAllContentState.success(
        rowItems: [],
        exploreCarousel: exploreCarousel,
        filters: filters,
        refreshingStrips: true,
      ),
    );

    final List<Map<StripRow, List<LearningObjectModel>>> mappedList = [];

    final stripsToFetch =
        List<StripRow>.from(dynamicContent?.page.strips ?? <StripRow>[])
          ..removeWhere(
            (element) => element.labelMapping == 'sliderTopContentExplore',
          );

    final allStripsFuture = stripsToFetch.map((strip) {
      return fetch(strip: strip, filters: filters);
    }).toList();

    final allStrips = await Future.wait([...allStripsFuture]);

    for (final element in allStrips) {
      mappedList.add(element);
    }

    emit(DynamicAllContentState.success(
      rowItems: mappedList,
      exploreCarousel: exploreCarousel,
      filters: filters,
    ));
    return mappedList;
  }

  Future<Map<StripRow, List<LearningObjectModel>>> fetch({
    StripRow? strip,
    List<String>? filters,
    bool debug = false,
  }) async {
    if (strip == null) {
      return {};
    }

    Map<StripRow, List<LearningObjectModel>> mappedList = {};

    final res = await _getSuggestedStripUseCase(
      strip: strip,
      filters: filters,
    );

    res.fold((l) {}, (r) {
      if (r.isNotEmpty) {
        mappedList[strip] = List.from(r);
      }
    });

    return mappedList;
  }

  Future<void> refresh(String path) async {
    if (state is Success) {
      final current = (state as Success);
      emit(const DynamicAllContentState.loading());
      final res = await _getPageStructureUseCase(path);
      res.fold(
        (l) => emit(DynamicAllContentState.error(l)),
        (page) async {
          emit(current.copyWith(filters: [...?current.filters]));
        },
      );
    } else {
      init(path);
    }
  }

  void setFilters([List<String>? filters]) async {
    dynamicContent?.filters = filters;
    emit((state as Success).copyWith(filters: [...?filters]));
  }
}

class DynamicLocalContent {
  DynamicLocalContent({
    required this.path,
    required this.page,
    this.filters,
    this.smartConfig,
  });
  String path;
  SmartConfiguratorModel? smartConfig;
  List<String>? filters;
  PageModel page;
}
