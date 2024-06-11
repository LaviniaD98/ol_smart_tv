import 'package:open_learning_smart_tv/domain/entities/color_response.dart';

import '../../models/responses/smart_configurator/smart_configurator_dto.dart';

abstract class SmartConfiguratorDataSource {
  Future<SmartConfiguratorDto> getConfigurations({
    String? corporateId,
    String? initiativeId,
  });

  Future<List<ColorResponse>> getColours({
    String? initiativeId,
  });
}
