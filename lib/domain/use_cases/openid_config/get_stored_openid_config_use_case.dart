import 'package:open_learning_smart_tv/domain/entities/openid_config/openid_config_model.dart';
import 'package:injectable/injectable.dart';

import '../../../wrappers/ol_secure_storage.dart';

@lazySingleton
class GetStoredOpenidConfigUseCase {
  final OlSecureStorage _olSecureStorage;
  GetStoredOpenidConfigUseCase(this._olSecureStorage);

  Future<OpenidConfigModel?> call() async {
    return await _olSecureStorage.getOpenidConfig();
  }
}
