import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/use_cases/user_profile_image/get_user_image_use_case.dart';

part 'user_avatar_state.dart';
part 'user_avatar_cubit.freezed.dart';

@injectable
class UserAvatarCubit extends Cubit<UserAvatarState> {

  final GetUserImageUseCase _getUserImageUseCase;

  UserAvatarCubit(this._getUserImageUseCase) : super(const UserAvatarState.loading());

  void init(int? id) async {
    final res = await _getUserImageUseCase(id);
    res.fold(
      (l) => emit(const UserAvatarState.error()),
      (r) => emit(UserAvatarState.image(r.imageUrl)),
    );
  }
}
