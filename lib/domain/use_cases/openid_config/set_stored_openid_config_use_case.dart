import 'package:injectable/injectable.dart';

import '../../../wrappers/ol_secure_storage.dart';
import '../../entities/openid_config/openid_config_model.dart';

@lazySingleton
class SetStoredOpenidConfigUseCase {
  final OlSecureStorage _olSecureStorage;
  SetStoredOpenidConfigUseCase(this._olSecureStorage);

  Future<OpenidConfigModel?> call(OpenidConfigModel openidConfig) async {
    return await _olSecureStorage.setOpenidConfig(openidConfig);
  }
}