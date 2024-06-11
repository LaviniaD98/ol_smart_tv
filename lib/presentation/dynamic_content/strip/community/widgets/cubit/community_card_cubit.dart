import 'package:open_learning_smart_tv/domain/use_cases/post/delete_post_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../cubit/community_wall_cubit.dart';

part 'community_card_state.dart';
part 'community_card_cubit.freezed.dart';

@injectable
class CommunityCardCubit extends Cubit<CommunityCardState> {
  final DeletePostUseCase _deletePostUseCase;
  final CommunityWallCubit _communityWallCubit;

  CommunityCardCubit(
    this._deletePostUseCase,
    this._communityWallCubit,
  ) : super(const CommunityCardState.success());

  void delete(String? id) async {
    if (id != null) {
      final res = await _deletePostUseCase(id);
      res.fold(
        (l) => emit(const CommunityCardState.error()),
        (r) => _communityWallCubit.refresh(),
      );
    } else {
      emit(const CommunityCardState.error());
    }
  }
}
