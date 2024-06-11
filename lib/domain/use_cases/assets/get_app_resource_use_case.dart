import 'package:open_learning_smart_tv/domain/entities/assets/app_resource_get_file_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/assets/app_resource_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';

@lazySingleton
class GetAppresourceUseCase {
  final AppResourceRepository _appResourceRepository;
  GetAppresourceUseCase(this._appResourceRepository);

  Future<Either<Failure, AppResourceGetFileModel>> call(
      String? corporateId, String fileName) {
    return _appResourceRepository.getFile(corporateId, fileName);
  }
}
