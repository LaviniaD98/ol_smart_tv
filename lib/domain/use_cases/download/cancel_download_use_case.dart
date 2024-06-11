import 'package:open_learning_smart_tv/domain/repositories/download/download_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

@lazySingleton
class CancelDownloadUseCase {
  final DownloadlRepository _repository;

  CancelDownloadUseCase(
    this._repository,
  );

  Future<Either<Failure, void>> call({required String taskId}) async {
    return await _repository.cancelDownload(taskId: taskId);
  }
}
