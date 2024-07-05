import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../domain/entities/community/comment/comment_model.dart';
import '../../../../../../../../domain/use_cases/community/get_answers_use_case.dart';
import '../../../../../../../../remote_theming/config/config_manager.dart';
import '../../../../../../../../remote_theming/config/remote_config_keys.dart';

part 'answers_state.dart';
part 'answers_cubit.freezed.dart';

@injectable
class AnswersCubit extends Cubit<AnswersState> {
  
  final GetAnswersUseCase _answersUseCase;
  AnswersCubit(this._answersUseCase) : super(const AnswersState.initial());

  final int pageSize = ConfigManager().getRemoteInt(RemoteConfigKeys.page_size_answers, 10);
  int page = 0;
  
  Future<void> fetch(CommentModel parent, String? apiPath, {bool showLoading = true}) async {
    if(showLoading) emit(state.copyWith(loading: true));
    final res = await _answersUseCase(
      id: parent.commentId,
      page: page,
      pageSize: pageSize,
      apiPath: apiPath,
    );

    res.fold((l) {
      emit(state.copyWith(
        error: true,
        loading: false,
      ));
    }, (r) async {

      final items = await CommentModel.getListFromPost(r);
      late bool isLast;
      final totalPages = r.pager?.totalPages;
      if(totalPages != null) {
        isLast = (page + 1) >= totalPages.toInt();
      } else {
        isLast = r.data.length < pageSize;
      }
      page++;
      emit(state.copyWith(
        showMore: !isLast,
        error: false,
        loading: false,
        answers: [...state.answers, ...items],
      ));
    });
  }

  Future<void> refresh(CommentModel parent, String? apiPath) async {
    page = 0;
    emit(const AnswersState.initial(loading: true, error: false, answers: []));
    final res = await _answersUseCase(
      id: parent.commentId,
      page: page,
      pageSize: pageSize,
      apiPath: apiPath,
    );

    res.fold((l) {
      emit(const AnswersState.initial(loading: false, error: true));
    }, (r) async {

      final items = await CommentModel.getListFromPost(r);
      late bool isLast;
      final totalPages = r.pager?.totalPages;
      if(totalPages != null) {
        isLast = (page + 1) >= totalPages.toInt();
      } else {
        isLast = r.data.length < pageSize;
      }
      page++;
      emit(AnswersState.initial(
        showMore: !isLast,
        error: false,
        loading: false,
        answers: [...items],
      ));
    });
  }
}
