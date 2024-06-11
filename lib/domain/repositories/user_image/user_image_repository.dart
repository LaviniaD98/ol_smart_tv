import '../../../data/models/failure.dart';
import 'package:dartz/dartz.dart';

import '../../entities/user_image/user_image_model.dart';

abstract class UserImageRepository {
  Future<Either<Failure, UserImageModel>> getUserImage(int? userId);
}