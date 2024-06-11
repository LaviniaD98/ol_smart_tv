import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/user/user_info_model.dart';
import '../../../../domain/use_cases/get_secure_stored_user_info_use_case.dart';
import '../../../../domain/use_cases/user_profile_image/get_user_image_use_case.dart';

part 'logo_header_state.dart';
part 'logo_header_cubit.freezed.dart';

@injectable
class LogoHeaderCubit extends Cubit<LogoHeaderState> {
  final GetUserImageUseCase _getUserImageUseCase;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  LogoHeaderCubit(
    this._getUserImageUseCase,
    this._getSecureStoredUserInfoUseCase
  ) : super (const LogoHeaderState.loading());

  void init() async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    await _getUserImage(userInfoModel);
  }

  Future<void> _getUserImage(UserInfoModel? userInfoModel) async {
    final res = await _getUserImageUseCase(userInfoModel?.user?.idUser);
    final image = res.fold(
      (l) => null,
      (r) => r.imageUrl,
    );

    emit(LogoHeaderState.success(
        image: image,
        name: userInfoModel?.user?.name,
        surname: userInfoModel?.user?.surname
    ));
  }
}