import 'package:open_learning_smart_tv/domain/entities/corporate_code/corporate_code_model.dart';
import 'package:open_learning_smart_tv/domain/entities/smart_configurator/smart_configurator_model.dart';
import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';

class UserInfoManager {
  static final UserInfoManager _singleton = UserInfoManager._internal();

  late UserInfoManager userInfoManager;

  factory UserInfoManager() {
    return _singleton;
  }

  UserInfoManager._internal();

  UserInfoModel? _userInfoModel;
  CorporateCodeModel? _corporateCodeModel;
  SmartConfiguratorModel? _smartConfiguratorModel;

  UserInfoModel? getUserInfoModel() {
    return _userInfoModel;
  }

  void setUserInfoModel(UserInfoModel? newUserInfoModel) {
    _userInfoModel = newUserInfoModel;
  }

  void clearInitiative() async {
    UserInfoModel? uinfo = getUserInfoModel();
    if (uinfo != null) {
      UserInfoModel uiToWrite =
          UserInfoModel(uinfo.sessionId, null, uinfo.user);
      setUserInfoModel(uiToWrite);
    }
  }

  CorporateCodeModel? getCorporateCodeModel() {
    return _corporateCodeModel;
  }

  void setCorporateCodeModel(CorporateCodeModel? newCorporateCodeModel) {
    _corporateCodeModel = newCorporateCodeModel;
  }

  SmartConfiguratorModel? getSmartConfiguratorModel() {
    return _smartConfiguratorModel;
  }

  void setSmartConfiguratorModel(
      SmartConfiguratorModel? newSmartConfiguratorModel) {
    _smartConfiguratorModel = newSmartConfiguratorModel;
  }
}
