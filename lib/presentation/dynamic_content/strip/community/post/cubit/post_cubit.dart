import 'package:open_learning_smart_tv/domain/entities/generic/post_link_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/post/post_page.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../data/models/failure.dart';
import '../../../../../../domain/entities/user/user_info_model.dart';
import '../../../../../../domain/use_cases/get_secure_stored_user_info_use_case.dart';
import '../../../../../../domain/use_cases/post/create_post_use_case.dart';
import '../../../../../../domain/use_cases/post/edit_post_use_case.dart';
import '../../../../../../domain/use_cases/user_profile_image/get_user_image_use_case.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../cubit/community_wall_cubit.dart';
import '../utils/link_data.dart';

part 'post_cubit.freezed.dart';
part 'post_state.dart';

@injectable
class PostCubit extends Cubit<PostState> {
  PostCubit(
    this._getUserImageUseCase,
    this._getSecureStoredUserInfoUseCase,
    this._createPostUseCase,
    this._editPostUseCase,
    this._communityWallCubit,
  ) : super(const PostState.loading());

  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetUserImageUseCase _getUserImageUseCase;
  final CreatePostUseCase _createPostUseCase;
  final EditPostUseCase _editPostUseCase;
  final CommunityWallCubit _communityWallCubit;
  PostPageArgs? args;

  void init(PostPageArgs? initial) async {
    args = initial;
    UserInfoModel? userInfo = await _getSecureStoredUserInfoUseCase();
    if (userInfo == null) {
      emit(
        PostState.error(
          Failure(
              error: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.error_occurred_try_later)),
        ),
      );
    } else {
      await _getUserImage(userInfo);
    }
  }

  Future<void> _getUserImage(UserInfoModel userInfo) async {
    final res = await _getUserImageUseCase(userInfo.user?.idUser);
    final imageUrl = res.fold(
      (l) => null,
      (r) => r.imageUrl,
    );
    emit(PostState.initialized(
      userInfo: userInfo,
      imageUrl: imageUrl,
      link: await _getLink(),
    ));
  }

  Future<PostLinkModel?> _getLink() async {
    if (args?.link == null) return null;
    return PostLinkModel(
      url: args?.link?.url ?? '',
      label: args?.link?.label ?? 'Link',
      imageUrl: args?.link?.url != null
          ? (await getPreviewData(args!.link!.url)).image?.url
          : null,
    );
  }

  Future<void> setLink(PostLinkModel link) async {
    final current = state as _Initialized;
    emit(const PostState.loading());
    emit(current.copyWith(link: link));
  }

  Future<void> resetLink() async {
    final current = state as _Initialized;
    emit(const PostState.loading());
    emit(current.copyWith(link: null));
  }

  Future<void> create(String body) async {
    final current = state as _Initialized;
    emit(const PostState.loading());
    final res = await _createPostUseCase(body: body, link: current.link);
    res.fold(
      (l) {
        emit(PostState.error(l));
        emit(current);
      },
      (r) {
        _communityWallCubit.refresh();
        emit(const PostState.success());
      },
    );
  }

  Future<void> createSharedPosts(String body, String? loId, String? loAuthor,
      LearningObjectTypology? loType) async {
    final current = state as _Initialized;
    emit(const PostState.loading());
    final res = await _createPostUseCase.createSharedPost(
      body: body,
      loId: loId,
      loAuthor: loAuthor,
      loType: loType,
    );
    res.fold(
      (l) {
        emit(PostState.error(l));
        emit(current);
      },
      (r) {
        _communityWallCubit.refresh();
        emit(const PostState.success());
      },
    );
  }

  Future<void> edit(String body) async {
    if (state is _Initialized &&
        args != null &&
        args!.pageType == PostPageType.edit &&
        args!.id != null) {
      final current = state as _Initialized;
      emit(const PostState.loading());
      final res = await _editPostUseCase(
        id: args!.id!,
        body: body,
        link: current.link,
      );
      res.fold(
        (l) {
          emit(PostState.error(l));
          emit(current);
        },
        (r) {
          _communityWallCubit.refresh();
          emit(const PostState.success());
        },
      );
    } else {
      emit(const PostState.error(Failure()));
    }
  }
}
