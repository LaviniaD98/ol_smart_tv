import 'package:retrofit/dio.dart';

import '../../models/requests/download_ics_request_dto.dart';

abstract class DownloadIcsDataSource {
  Future<HttpResponse<String?>> downloadEvents({String? corporateId, String? initiativeId, DownloadIcsRequestDto? body});
}