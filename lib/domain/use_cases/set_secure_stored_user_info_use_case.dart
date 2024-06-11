import 'package:open_learning_smart_tv/core/shared_preferences_keys.dart';
import 'package:open_learning_smart_tv/core/user_info_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';
import 'package:open_learning_smart_tv/wrappers/ol_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SetSecureStoredUserInfoUseCase {
  final OlSecureStorage _olSecureStorage;
  final SharedPreferences _sharedPreferences;

  SetSecureStoredUserInfoUseCase(
      this._olSecureStorage, this._sharedPreferences);
  Future<UserInfoModel?> call(UserInfoModel userInfoModel) async {
    if (userInfoModel.user?.idUser != null) {
      await _sharedPreferences.setInt(
          SharedPreferencesKeys.userId, userInfoModel.user!.idUser!);
    }
    await _olSecureStorage.setUserInfo(userInfoModel);
    UserInfoManager().setUserInfoModel(userInfoModel);
    return userInfoModel;
  }
}
