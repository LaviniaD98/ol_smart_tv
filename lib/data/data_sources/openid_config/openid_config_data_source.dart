import 'package:open_learning_smart_tv/data/models/responses/openid_config/openid_config_dto.dart';

abstract class OpenidConfigDataSource {
  Future<OpenidConfigDto> getOpenidConfig(String path);
}
