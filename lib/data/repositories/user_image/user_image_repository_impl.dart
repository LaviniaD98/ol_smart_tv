import 'package:open_learning_smart_tv/domain/repositories/user_image/user_image_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entities/user_image/user_image_model.dart';
import '../../data_sources/user_image/user_image_data_source.dart';

@LazySingleton(as: UserImageRepository)
class UserImageRepositoryImpl implements UserImageRepository {
  final UserImageDataSource _userImageDataSource;

  UserImageRepositoryImpl(this._userImageDataSource);

  @override
  Future<Either<Failure, UserImageModel>> getUserImage(int? userId) {
    return catchFailure(() async {
      final res = await _userImageDataSource.getUserImage(userId);
      return UserImageModel(res);
    });
  }
}
