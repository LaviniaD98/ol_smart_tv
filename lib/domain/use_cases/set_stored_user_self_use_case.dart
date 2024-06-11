import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/wrappers/ol_secure_storage.dart';

@lazySingleton
class SetStoredUserSelfUseCase {
  final OlSecureStorage _olSecureStorage;
  SetStoredUserSelfUseCase(this._olSecureStorage);
  Future<SelfModel?> call(SelfModel valueToStore) async {
    return await _olSecureStorage.setUserSelf(valueToStore);
  }
}
