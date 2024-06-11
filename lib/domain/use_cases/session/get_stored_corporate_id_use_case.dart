import 'package:open_learning_smart_tv/core/user_info_manager.dart';
import 'package:injectable/injectable.dart';

import '../../entities/corporate_code/corporate_code_model.dart';

@lazySingleton
class GetStoredCorporateIdUseCase {
  GetStoredCorporateIdUseCase();

  Future<CorporateCodeModel?> call() async {
    return UserInfoManager().getCorporateCodeModel();
  }
}
