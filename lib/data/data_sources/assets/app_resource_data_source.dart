import 'package:open_learning_smart_tv/data/models/responses/assets/app_resource_get_file_dto.dart';

abstract class AppResourceDataSource {
  Future<AppResourceGetFileDto> getFile({
    String? corporateId,
    String? fileName,
  });
}
