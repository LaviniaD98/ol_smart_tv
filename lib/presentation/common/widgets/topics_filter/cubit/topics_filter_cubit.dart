import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/topics/topic_model.dart';
import '../../../../../domain/use_cases/topics/get_topics_use_case.dart';

part 'topics_filter_state.dart';

part 'topics_filter_cubit.freezed.dart';

@injectable
class TopicsFilterCubit extends Cubit<TopicsFilterState> {
  final GetTopicsUseCase _getTopicsUseCase;

  TopicsFilterCubit(this._getTopicsUseCase)
      : super(const TopicsFilterState.loading());

  void init() async {
    print('INITING TOPICS FILTER CUBIT');
    final res = await _getTopicsUseCase();
    res.fold(
      (l) {
        print('LEFT: $l');
        emit(const TopicsFilterState.error());
      },
      (r) {
        print('RIGHT: ${r}');
        emit(TopicsFilterState.success(r.output ?? []));
      },
    );
  }
}
