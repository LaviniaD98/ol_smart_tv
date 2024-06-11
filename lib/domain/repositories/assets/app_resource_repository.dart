import 'package:open_learning_smart_tv/domain/entities/assets/app_resource_get_file_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';

abstract class AppResourceRepository {
  Future<Either<Failure, AppResourceGetFileModel>> getFile(
      String? corporateId, String? fileName);
}
