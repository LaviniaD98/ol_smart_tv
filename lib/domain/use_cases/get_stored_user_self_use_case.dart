import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/wrappers/ol_secure_storage.dart';

@lazySingleton
class GetStoredUserSelfUseCase {
  final OlSecureStorage _olSecureStorage;
  GetStoredUserSelfUseCase(this._olSecureStorage);
  Future<SelfModel?> call() async {
    return await _olSecureStorage.getUserSelf();
  }
}
