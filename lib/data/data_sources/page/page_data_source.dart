import '../../models/responses/page/page_dto.dart';

abstract class PageDataSource {
  Future<PageDto> getPage(String path);
}
