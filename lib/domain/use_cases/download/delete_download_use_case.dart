import 'package:open_learning_smart_tv/domain/repositories/download/download_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

@lazySingleton
class DeleteDownloadUseCase {
  final DownloadlRepository _repository;

  DeleteDownloadUseCase(
    this._repository,
  );

  Future<Either<Failure, void>> call({required String taskId}) async {
    return await _repository.deleteDownload(taskId: taskId);
  }
}
