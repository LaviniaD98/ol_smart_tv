import 'package:open_learning_smart_tv/domain/entities/community/community_data_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/community/get_community_posts_use_case.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/models/failure.dart';
import '../../../../../domain/entities/community/community_topic_model.dart';
import '../../../../../domain/entities/community/enriched_information_model.dart';
import '../../../../../domain/use_cases/get_secure_stored_user_info_use_case.dart';

part 'community_wall_state.dart';
part 'community_wall_cubit.freezed.dart';

@lazySingleton
class CommunityWallCubit extends Cubit<CommunityWallState> {
  final GetCommunityPostsUseCase _getCommunityPostsUseCase;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  PagingController<int, CommunityDataModel> controller =
      PagingController(firstPageKey: 0);
  late String apiPath;
  Function(int)? _listener;
  List<String>? filterTypes;
  List<String>? filterTopics;

  CommunityWallCubit(
    this._getCommunityPostsUseCase,
    this._getSecureStoredUserInfoUseCase,
  ) : super(const CommunityWallState.loading());

  Future<void> init(String? apiPath) async {
    final userModel = await _getSecureStoredUserInfoUseCase();
    if (apiPath != null &&
        userModel != null &&
        userModel.user != null &&
        userModel.user?.idUser != null) {
      emit(CommunityWallState.initialized(userModel.user!.idUser!));
      this.apiPath = apiPath;
      if (_listener != null) {
        controller.removePageRequestListener(_listener!);
      }
      _listener = (pageKey) => _fetchPosts(pageKey);
      controller.addPageRequestListener(_listener!);
    } else {
      emit(
        CommunityWallState.error(
          Failure(
            error: LabelsManager().getRemoteStringFromLabelKeys(
              RemoteLabelKeys.error_occurred,
            ),
          ),
        ),
      );
    }
  }

  Future _fetchPosts(int page) async {
    final res = await _getCommunityPostsUseCase(
        page, apiPath, filterTopics, filterTypes);
    res.fold((l) {
      controller.error = l.error;
    }, (posts) {
      if (state is _Initialized && page == 0) {
        emit((state as _Initialized).copyWith(
            enrichedInformation: posts.enrichedInformation,
            topics: posts.topic));
      }
      if (posts.pager != null && posts.pager?.totalPages != null) {
        final isLast = (page == posts.pager!.totalPages! - 1);
        _updatePagingController(items: posts.data, isLast: isLast, page: page);
      }
    });
  }

  void _updatePagingController({
    required List<CommunityDataModel> items,
    required bool isLast,
    required int page,
  }) {
    if (isLast) {
      controller.appendLastPage(items);
    } else {
      final nextPageKey = page += 1;
      controller.appendPage(items, nextPageKey);
    }
  }

  Future refresh() async {
    if (state is _Initialized) {
      controller.refresh();
    } else {
      init(apiPath);
    }
  }

  Future updateTopicFilters(List<String>? topics) async {
    filterTopics = topics;
    controller.refresh();
  }

  Future updateTypeFilters(List<String>? types) async {
    filterTypes = types;
    controller.refresh();
  }

  @override
  Future<void> close() {
    if (_listener != null) {
      controller.removePageRequestListener(_listener!);
    }
    controller.dispose();
    return super.close();
  }
}
