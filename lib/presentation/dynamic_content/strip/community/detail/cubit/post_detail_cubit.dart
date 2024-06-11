import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/community/community_posts_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entities/community/community_data_model.dart';
import '../../../../../../domain/entities/session/user_model.dart';
import '../../../../../../domain/use_cases/community/get_community_post_use_case.dart';
import '../../../../../../domain/use_cases/community/get_shared_post_use_case.dart';
import '../../../../../../domain/use_cases/get_secure_stored_user_info_use_case.dart';
import '../../../../../../domain/use_cases/post/delete_post_use_case.dart';
import '../../../../../../domain/use_cases/user_profile_image/get_user_image_use_case.dart';
import '../../cubit/community_wall_cubit.dart';
import '../post_detail_page_connector.dart';

part 'post_detail_cubit.freezed.dart';
part 'post_detail_state.dart';

@injectable
class PostDetailCubit extends Cubit<PostDetailState> {
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetSharedPostUseCase _getSharedPostUseCase;
  final GetCommunityPostUseCase _getCommunityPostUseCase;
  final GetUserImageUseCase _getUserImageUseCase;
  final DeletePostUseCase _deletePostUseCase;
  final CommunityWallCubit _communityWallCubit;

  PostDetailCubit(
    this._getSecureStoredUserInfoUseCase,
    this._getSharedPostUseCase,
    this._getUserImageUseCase,
    this._getCommunityPostUseCase,
    this._deletePostUseCase,
    this._communityWallCubit,
  ) : super(const PostDetailState.loading());

  void init(PostDetailPageArgs args, {bool loading = true}) async {
    if (loading && state is! _Loading) emit(const PostDetailState.loading());

    final storedInfo = await _getSecureStoredUserInfoUseCase.call();
    String? sessionId = storedInfo?.sessionId;
    UserModel? storedUser = storedInfo?.user;
    if (sessionId != null && storedUser != null) {
      Either<Failure, CommunityPostsModel> res;

      if (args.type == PostType.TALK) {
        res = await _getCommunityPostUseCase(
            args.entityId, storedUser.idUser, args.apiPath);
      } else {
        res = await _getSharedPostUseCase(args.entityId, args.apiPath);
      }

      res.fold(
        (l) => emit(const PostDetailState.error()),
        (r) async {
          if (r.data.isNotEmpty && storedUser.idUser != null) {
            final imageUrl = await _getUserImage(storedUser.idUser!);
            final post = r.data.first;
            final canEdit = post.owner!.ownerId != null &&
                post.owner!.ownerId == storedUser.idUser.toString();
            emit(PostDetailState.done(
              post: r.data.first,
              imageUrl: imageUrl,
              args: args,
              canEdit: canEdit,
              storedUser: storedUser,
            ));
          } else {
            emit(const PostDetailState.error());
          }
        },
      );
    }
  }

  void refresh() {
    if (state is _Done) {
      init((state as _Done).args, loading: false);
    }
  }

  Future<String?> _getUserImage(int? id) async {
    final res = await _getUserImageUseCase(id);
    return res.fold((l) => null, (r) => r.imageUrl);
  }

  void delete(String? id) async {
    final current = state;
    if (id != null && current is _Done) {
      final res = await _deletePostUseCase(id);
      final action = res.fold(
        (l) => PostDetailAction.error,
        (r) {
          _communityWallCubit.refresh();
          return PostDetailAction.success;
        },
      );
      emit(PostDetailState.action(action));
    } else {
      emit(const PostDetailState.action(PostDetailAction.error));
    }
    emit(current);
  }
}

enum PostDetailAction { error, success }
