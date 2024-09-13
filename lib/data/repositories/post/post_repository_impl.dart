import 'package:open_learning_smart_tv/data/data_sources/post/post_data_source.dart';
import 'package:open_learning_smart_tv/domain/repositories/post/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../models/requests/post/cms_post_request.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSource;

  PostRepositoryRepositoryImpl(this._postDataSource);

  @override
  Future<Either<Failure, void>> csmWrapperPost(CmsPostRequest request) {
    return catchFailure(() async {
      await _postDataSource.csmWrapperPost(request);
    });
  }
}
