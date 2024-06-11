import 'package:open_learning_smart_tv/core/user_info_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/corporate_code/corporate_code_model.dart';
import 'package:open_learning_smart_tv/wrappers/ol_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetStoredCorporateIdUseCase {
  final OlSecureStorage _olSecureStorage;
  SetStoredCorporateIdUseCase(this._olSecureStorage);

  Future<CorporateCodeModel> call(CorporateCodeModel corporateCodeModel) async {
    UserInfoManager().setCorporateCodeModel(corporateCodeModel);
    return await _olSecureStorage.setCorporateCode(corporateCodeModel);
  }
}
