import 'package:open_learning_smart_tv/data/models/requests/post/post_request.dart';

import '../../models/requests/post/cms_post_request.dart';
import '../../models/responses/post/create_post_dto.dart';

abstract class PostDataSource {
  Future<void> csmWrapperPost(CmsPostRequest request);
}
