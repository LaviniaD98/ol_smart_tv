import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/download/source_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/download/download_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

@lazySingleton
class ScheduleDownloadUseCase {
  final DownloadlRepository _repository;

  ScheduleDownloadUseCase(
    this._repository,
  );

  Future<Either<Failure, String?>> call(
      {required String url,
      required DetailPageModel detailPageModel,
      required SourceModel downloadableModel}) async {
    return await _repository.scheduleDownload(
        url: url,
        detailPageModel: detailPageModel,
        downloadableModel: downloadableModel);
  }
}
