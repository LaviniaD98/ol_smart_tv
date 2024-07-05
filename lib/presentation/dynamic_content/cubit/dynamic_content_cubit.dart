import 'package:open_learning_smart_tv/domain/use_cases/page/get_page_structure_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../../domain/entities/page/page_model.dart';
import '../../../domain/entities/smart_configurator/smart_configurator_model.dart';
import '../../../domain/use_cases/smart_configurator/get_stored_smart_configuration_use_case.dart';
import '../../offline_state/offline_cubit.dart';

part 'dynamic_content_state.dart';
part 'dynamic_content_cubit.freezed.dart';

@injectable
class DynamicContentCubit extends Cubit<DynamicContentState> {
  final GetPageStructureUseCase _getPageStructureUseCase;
  final GetStoredSmartConfigurationUseCase _getStoredSmartConfigurationUseCase;
  final OfflineCubit _offlineCubit;

  DynamicContentCubit(
    this._getPageStructureUseCase,
    this._getStoredSmartConfigurationUseCase,
    this._offlineCubit,
  ) : super(const DynamicContentState.loading());

  void init(String path, [List<String>? filters]) async {
    _offlineCubit.checkUserMissingAlerts();
    emit(const DynamicContentState.loading());
    final res = await _getPageStructureUseCase(path);
    res.fold(
      (l) => emit(DynamicContentState.error(l)),
      (page) async {
        final start = DateTime.now().millisecond;
        final smartConfig = await _getStoredSmartConfigurationUseCase();
        final elapsed = start - DateTime.now().millisecond;
        if (kDebugMode) print("https:// smartConfig elapsed: $elapsed");
        emit(
          DynamicContentState.success(
            path: path,
            filters: filters,
            smartConfig: smartConfig,
            page: page,
          ),
        );
      },
    );
  }

  Future<void> refresh(String path) async {
    if (state is Success) {
      final current = (state as Success);
      emit(const DynamicContentState.loading());
      final res = await _getPageStructureUseCase(path);
      res.fold(
        (l) => emit(DynamicContentState.error(l)),
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
