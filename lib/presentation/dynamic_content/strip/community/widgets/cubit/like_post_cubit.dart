import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/use_cases/community/get_community_post_likes_use_case.dart';
import '../../../../../../domain/use_cases/community/like_post_use_case.dart';
import '../../../../../../domain/use_cases/community/unlike_post_use_case.dart';
import '../../../../../../domain/use_cases/get_secure_stored_user_info_use_case.dart';

part 'like_post_state.dart';
part 'like_post_cubit.freezed.dart';

@injectable
class LikePostCubit extends Cubit<LikePostState> {
  LikePostCubit(
    this._getCommunityPostLikesUseCase,
    this._likePostUseCase,
    this._unlikePostUseCase,
    this._getSecureStoredUserInfoUseCase,
  ) : super(const LikePostState.initial(0, false));

  final GetCommunityPostLikesUseCase _getCommunityPostLikesUseCase;
  final LikePostUseCase _likePostUseCase;
  final UnlikePostUseCase _unlikePostUseCase;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  int entityId = 0;
  int userId = 0;
  String? apiPath;

  Future init({required int entityId, String? apiPath}) async {
    this.entityId = entityId;
    this.apiPath = apiPath;

    final userModel = await _getSecureStoredUserInfoUseCase();
    userId = userModel?.user?.idUser ?? 0;

    loadPostLikes();
  }

  Future loadPostLikes() async {
    final res = await _getCommunityPostLikesUseCase(entityId, apiPath);
    res.fold(
      (l) => null,
      (newLikes) => emit(state.copyWith(
        likesAmount: newLikes.countDataObj?.toInt() ?? 0,
        isLikedByUser: newLikes.data?.any((element) => (element.userId == '$userId')) ?? false,
      ),),
    );
  }

  Future likePost() async {
    await _likePostUseCase(entityId, apiPath);
    await loadPostLikes();
  }

  Future unlikePost() async {
    await _unlikePostUseCase(entityId, apiPath);
    await loadPostLikes();
  }
}