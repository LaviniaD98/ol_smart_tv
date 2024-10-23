import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_standard_strip_use_case.dart';

part 'explore_strips_state.dart';
part 'explore_strips_cubit.freezed.dart';

@injectable
class ExploreStripsCubit extends Cubit<ExploreStripsState> {
  final GetStandardStripUseCase _getSuggestedStripUseCase;

  List<StripRow> tempStrips = [];

  ExploreStripsCubit(
    this._getSuggestedStripUseCase,
  ) : super(const ExploreStripsState.loading());

  Future<List<Map<StripRow, List<LearningObjectModel>>>> init({
    required List<StripRow> strips,
    bool debug = false,
  }) async {
    emit(const ExploreStripsState.loading());

    tempStrips = List.from(strips);

    final List<Map<StripRow, List<LearningObjectModel>>> mappedList = [];

    final allStripsFuture = strips.map((strip) {
      return fetch(strip: strip);
    }).toList();

    final allStrips = await Future.wait([...allStripsFuture]);

    for (final element in allStrips) {
      mappedList.add(element);
    }

    emit(ExploreStripsState.success(rowItems: mappedList));
    return mappedList;
  }

  Future<List<Map<StripRow, List<LearningObjectModel>>>> refreshStrips({
    bool debug = false,
    List<String>? filters,
  }) async {
    emit(
      ExploreStripsState.success(
        rowItems: [],
        filters: filters,
        refreshingStrips: true,
      ),
    );

    final List<Map<StripRow, List<LearningObjectModel>>> mappedList = [];

    final allStripsFuture = tempStrips.map((strip) {
      return fetch(strip: strip, filters: filters);
    }).toList();

    final allStrips = await Future.wait([...allStripsFuture]);

    for (final element in allStrips) {
      mappedList.add(element);
    }

    emit(ExploreStripsState.success(
      rowItems: mappedList,
      filters: filters,
      refreshingStrips: false,
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
}
