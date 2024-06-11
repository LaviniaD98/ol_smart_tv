import 'package:injectable/injectable.dart';

import '../../remote_theming/config/config_manager.dart';
import '../../remote_theming/config/remote_config_keys.dart';

@lazySingleton
class GetPageSizeStripUseCase {
  GetPageSizeStripUseCase();
  Future<(int, int)> call() async {
    return (0, ConfigManager().getRemoteInt(RemoteConfigKeys.page_size_strip, 9));
  }
}
