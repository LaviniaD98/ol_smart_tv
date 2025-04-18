import 'package:open_learning_smart_tv/core/env/env.dart';
import 'package:open_learning_smart_tv/data/data_sources/download/download_data_source.dart';
import 'package:open_learning_smart_tv/domain/entities/download/download_object_info_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/download/download_repository.dart';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_keys.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

@LazySingleton(as: DownloadlRepository)
class DownloadlRepositoryImpl implements DownloadlRepository {
  final DownloadDataSource _downloadDataSource;
  final Env _env;

  DownloadlRepositoryImpl(this._downloadDataSource, this._env);

  @override
  Future<Either<Failure, DownloadObjectInfoModel?>> retrieveDownloadInfo(
      String? brightCoverId) {
    return catchFailure(() async {
      String url = _env.brightcoveDownloadUrl.replaceFirst(
          '{brightcoveaccountid}',
          ConfigManager()
              .getRemoteString(RemoteConfigKeys.brightcove_accound_id));
      String path = "$url/$brightCoverId";
      String brightcoveAccountPk = ConfigManager()
          .getRemoteString(RemoteConfigKeys.brightcove_accound_pk);
      final res = await _downloadDataSource.retrieveDownloadInfo(
          "application/json;pk=$brightcoveAccountPk", path);
      return DownloadObjectInfoModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, void>> cancelDownload({required String taskId}) {
    return catchFailure(() async {
      //await FlutterDownloader.cancel(taskId: taskId);
    });
  }

  @override
  Future<Either<Failure, void>> deleteDownload({required String taskId}) {
    return catchFailure(() async {});
  }
}
