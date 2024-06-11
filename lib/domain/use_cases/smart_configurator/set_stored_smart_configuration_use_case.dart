import 'package:open_learning_smart_tv/core/user_info_manager.dart';
import 'package:injectable/injectable.dart';
import '../../entities/smart_configurator/smart_configurator_model.dart';

@lazySingleton
class SetStoredSmartConfigurationUseCase {
  SetStoredSmartConfigurationUseCase();

  Future<SmartConfiguratorModel?> call(
      SmartConfiguratorModel smartConfiguratorModel) async {
    UserInfoManager().setSmartConfiguratorModel(smartConfiguratorModel);
    return smartConfiguratorModel;
  }
}
