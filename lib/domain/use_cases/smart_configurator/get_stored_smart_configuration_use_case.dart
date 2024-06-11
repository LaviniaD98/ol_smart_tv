import 'package:open_learning_smart_tv/core/user_info_manager.dart';
import 'package:injectable/injectable.dart';

import '../../../core/env/env.dart';
import '../../entities/smart_configurator/smart_configurator_model.dart';

@lazySingleton
class GetStoredSmartConfigurationUseCase {
  final Env _env;

  GetStoredSmartConfigurationUseCase(this._env);

  Future<SmartConfiguratorModel?> call() async {
    return UserInfoManager().getSmartConfiguratorModel();
  }

  Future<String?> getSCORMTracker() async {
    final smartConfig = UserInfoManager().getSmartConfiguratorModel();
    if (smartConfig?.lrsEsterno == true) {
      return smartConfig?.extScormTracker ?? _env.viteSCORMTracker;
    } else {
      return smartConfig?.intScormTracker ?? _env.viteSCORMTracker;
    }
  }

  Future<String?> getXAPITracker() async {
    final smartConfig = UserInfoManager().getSmartConfiguratorModel();
    if (smartConfig?.lrsEsterno == true) {
      return smartConfig?.extXapiTracker ?? _env.viteXAPITracker;
    } else {
      return smartConfig?.intXapiTracker ?? _env.viteXAPITracker;
    }
  }
}
