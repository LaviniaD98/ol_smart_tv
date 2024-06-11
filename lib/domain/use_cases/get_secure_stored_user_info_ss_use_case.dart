import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';
import 'package:open_learning_smart_tv/wrappers/ol_secure_storage.dart';

@lazySingleton
class GetSecureStoredUserInfoSsUseCase {
  final OlSecureStorage _olSecureStorage;
  GetSecureStoredUserInfoSsUseCase(this._olSecureStorage);
  Future<UserInfoModel?> call() async {
    return await _olSecureStorage.getUserInfo();
  }
}
