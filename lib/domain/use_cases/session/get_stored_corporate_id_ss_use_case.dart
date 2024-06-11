import 'package:injectable/injectable.dart';

import '../../../wrappers/ol_secure_storage.dart';
import '../../entities/corporate_code/corporate_code_model.dart';

@lazySingleton
class GetStoredCorporateIdSsUseCase {
  final OlSecureStorage _olSecureStorage;
  GetStoredCorporateIdSsUseCase(this._olSecureStorage);

  Future<CorporateCodeModel?> call([bool readFromSecureStorage = false]) async {
   return await _olSecureStorage.getCorporateCode();
  }
}
