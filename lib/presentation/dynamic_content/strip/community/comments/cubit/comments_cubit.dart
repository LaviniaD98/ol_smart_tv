import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entities/community/comment/comment_model.dart';
import '../../../../../../domain/use_cases/community/get_comments_use_case.dart';
import '../../../../../../remote_theming/config/config_manager.dart';
import '../../../../../../remote_theming/config/remote_config_keys.dart';
import '../sliver_comments_list.dart';

part 'comments_state.dart';
part 'comments_cubit.freezed.dart';

@injectable
class CommentsCubit extends Cubit<CommentsState> {
  final GetCommentsUseCase _getCommentsUseCase;

  CommentsCubit(
    this._getCommentsUseCase,
  ) : super(const CommentsState.loading());

  final _pageSize =  ConfigManager().getRemoteInt(RemoteConfigKeys.page_size_comments, 10);
  PagingController<int, CommentModel> pagedController = PagingController(firstPageKey: 0);
  late Function(int) _listener;
  late CommentsArgs args;

  void init(CommentsArgs arguments) async {
    args = arguments;
    _listener = (pageKey) => _fetch(pageKey);
    pagedController.addPageRequestListener(_listener);
    emit(const CommentsState.initialized());
  }

  Future _fetch(int page) async {
    final res = await _getCommentsUseCase(
      page: page,
      pageSize: _pageSize,
      apiPath: args.apiPath,
      entityId: args.entityId,
    );

    res.fold((l) {
      pagedController.error = l.error;
    }, (r) async {

      final items = await CommentModel.getListFromPost(r);
      late bool isLast;
      final totalPages = r.pager?.totalPages;
      if(totalPages != null) {
        isLast = page >= totalPages.toInt();
      } else {
        isLast = r.data.length < _pageSize;
      }

      if (isLast) {
        pagedController.appendLastPage(items);
      } else {
        pagedController.appendPage(items, ++page);
      }
    });
  }
}
