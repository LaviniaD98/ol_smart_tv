import 'package:open_learning_smart_tv/domain/entities/user_image/user_image_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/user_image/user_image_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';

@lazySingleton
class GetUserImageUseCase {
  final UserImageRepository _userImageRepository;
  GetUserImageUseCase(this._userImageRepository);

  Future<Either<Failure, UserImageModel>> call(int? userId) {
    return _userImageRepository.getUserImage(userId);
  }
}
