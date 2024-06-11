import 'package:open_learning_smart_tv/domain/entities/generic/tool_url_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/use_cases/detail/get_tool_url_use_case.dart';

part 'tool_item_state.dart';
part 'tool_item_cubit.freezed.dart';

@injectable
class ToolItemCubit extends Cubit<ToolItemState> {
  final GetToolUrlUseCase _getToolUrlUseCase;
  ToolItemCubit(this._getToolUrlUseCase) : super(const ToolItemState.loading());

  void fetch(int? toolId, int? learningObjectId) async {
    final res = await _getToolUrlUseCase(
        toolId: toolId, learningObjectId: learningObjectId);
    res.fold(
      (l) => emit(const ToolItemState.loaded()),
      (r) => emit(ToolItemState.loaded(r)),
    );
  }
}
