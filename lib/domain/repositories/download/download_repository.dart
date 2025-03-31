import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/download/download_object_info_model.dart';
import 'package:dartz/dartz.dart';

abstract class DownloadlRepository {
  Future<Either<Failure, void>> cancelDownload({required String taskId});
  Future<Either<Failure, void>> deleteDownload({required String taskId});
  Future<Either<Failure, DownloadObjectInfoModel?>> retrieveDownloadInfo(
      String? brightCoverId);
}
