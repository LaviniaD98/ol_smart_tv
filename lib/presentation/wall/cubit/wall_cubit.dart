import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/strip/learning_object/learning_object_model.dart';
import '../../../domain/entities/strip/row/strip_row.dart';
import '../../../domain/enums/types.dart';
import '../../../domain/use_cases/detail/remove_favourite_use_case.dart';
import '../../../domain/use_cases/strip/get_wall_strip_content_use_case.dart';
import '../../../remote_theming/config/config_manager.dart';
import '../../../remote_theming/config/remote_config_keys.dart';
import '../../dynamic_content/strip/favourites/cubit/favourites_strip_cubit.dart';

part 'wall_state.dart';
part 'wall_cubit.freezed.dart';

@injectable
class WallCubit extends Cubit<WallState> {
  final GetWallStripContentUseCase _getWallStripContentUseCase;
  final RemoveFavouritesUseCase _removeFavouritesUseCase;
  final FavouritesStripCubit _favouritesStripCubit;

  WallCubit(
    this._getWallStripContentUseCase,
    this._removeFavouritesUseCase,
    this._favouritesStripCubit,
  ) : super(const WallState.idle());

  PagingController<int, LearningObjectModel>? controller = PagingController(
    firstPageKey: 0,
  );
  late Function(int) _listener;
  int pageSize = ConfigManager().getRemoteInt(RemoteConfigKeys.page_size_wall, 20);
  int? totalElements;

  void initPagingController(StripRow strip) async {
    _listener = (pageKey) => _fetch(strip, pageKey);
    controller?.addPageRequestListener(_listener);
    emit(const WallState.initialized());
  }

  void _fetch(StripRow strip, int page) async {
    final res = await _getWallStripContentUseCase(
      strip: strip,
      page: page,
      pageSize: pageSize,
    );

    res.fold((l) {
      controller?.error = l.error;
    }, (r) {
      if(r.metadata != null && r.metadata!.totalPages != null) {
        final isLast = page == r.metadata!.totalPages!-1;
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

  void _updatePagingController(
      {required bool isLast,
      required List<LearningObjectModel> items,
      required int page}) {
    if (isLast) {
      controller?.appendLastPage(items);
    } else {
      final nextPageKey = page += 1;
      controller?.appendPage(items, nextPageKey);
    }
  }

  void removeFromFavorite({
    required LearningObjectTypology learningObjectTypology,
    int? id,
    int? parentId,
    int? grandParentId,
  }) async {
    final removeFavouriteRes = await _removeFavouritesUseCase(
      id: id,
      learningObjectTypology: learningObjectTypology,
      parentId: parentId?.toString(),
      grandParentId: grandParentId?.toString(),
    );
    await removeFavouriteRes.fold(
      (l) {
        controller?.error = l.error;
      },
      (favouriteModel) async {
        _favouritesStripCubit.refresh();
        controller?.refresh();
      },
    );
  }

  @override
  Future<void> close() {
    controller?.removePageRequestListener(_listener);
    controller = null;
    controller?.dispose();
    return super.close();
  }
}
