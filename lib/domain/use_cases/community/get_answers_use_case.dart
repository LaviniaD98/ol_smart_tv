import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/community/community_posts_model.dart';
import '../../repositories/community/community_repository.dart';

@lazySingleton
class GetAnswersUseCase {
  final CommunityRepository _repository;

  GetAnswersUseCase(this._repository);

  Future<Either<Failure, CommunityPostsModel>> call({
    required int page,
    required int pageSize,
    int? id,
    String? apiPath,
  }) async {

    return await _repository.getPostAnswers(
        commentId: id,
        page: page,
        pageSize: pageSize,
        apiPath: apiPath,
    );
  }
}