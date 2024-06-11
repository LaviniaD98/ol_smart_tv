import 'package:open_learning_smart_tv/data/models/responses/download/download_object_info_dto.dart';

abstract class DownloadDataSource {
  Future<DownloadObjectInfoDto> retrieveDownloadInfo(
      String accept, String path);
}
