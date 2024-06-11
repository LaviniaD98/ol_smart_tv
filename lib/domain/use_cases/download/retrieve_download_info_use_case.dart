import 'package:open_learning_smart_tv/domain/entities/download/download_object_info_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/download/download_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

@lazySingleton
class RetrieveDownloadInfoUseCase {
  final DownloadlRepository _repository;

  RetrieveDownloadInfoUseCase(
    this._repository,
  );

  Future<Either<Failure, DownloadObjectInfoModel?>> call(
      String? brightCoverId) async {
    return await _repository.retrieveDownloadInfo(brightCoverId);
  }
}
