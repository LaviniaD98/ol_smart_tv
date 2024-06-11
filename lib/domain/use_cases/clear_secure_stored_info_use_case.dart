import 'package:open_learning_smart_tv/wrappers/ol_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ClearSecureStoredUserInfoUseCase {
  final OlSecureStorage _olSecureStorage;
  ClearSecureStoredUserInfoUseCase(this._olSecureStorage);
  Future<void> call() async {
    await _olSecureStorage.clearUserInfo();
    await _olSecureStorage.clearUserSelf();
  }
}

@lazySingleton
class ClearSecureStoredInitiativeUseCase {
  final OlSecureStorage _olSecureStorage;
  ClearSecureStoredInitiativeUseCase(this._olSecureStorage);
  Future<void> call() async {
    await _olSecureStorage.clearInitiative();
  }
}
