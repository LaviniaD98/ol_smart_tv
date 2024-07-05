import '../../models/requests/post/cms_post_request.dart';

abstract class PostDataSource {
  Future<void> csmWrapperPost(CmsPostRequest request);
}
