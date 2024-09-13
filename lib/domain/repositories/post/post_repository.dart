
import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';
import '../../../data/models/requests/post/cms_post_request.dart';

abstract class PostRepository {
  Future<Either<Failure, void>> csmWrapperPost(CmsPostRequest request);
}
