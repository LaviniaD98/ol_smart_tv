import 'package:open_learning_smart_tv/core/user_info_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/wrappers/ol_secure_storage.dart';

@lazySingleton
class ClearSecureStoredUseCase {
  final OlSecureStorage _olSecureStorage;
  ClearSecureStoredUseCase(this._olSecureStorage);
  Future<void> call() async {
    UserInfoManager().setCorporateCodeModel(null);
    UserInfoManager().setUserInfoModel(null);
    return await _olSecureStorage.clear();
  }
}
