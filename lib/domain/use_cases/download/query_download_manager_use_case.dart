import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class QueryDownloadManagerUseCase {

  QueryDownloadManagerUseCase();

  Future<List<DownloadTask>?> call({String? whereCondition}) async{
    var rawQuery = "SELECT * FROM task";
    if (whereCondition?.isNotEmpty == true) {
      rawQuery = "$rawQuery where ${whereCondition!}";
    }
    if (kDebugMode) print("download_manager QueryDownloadManagerUseCase rawQuery: $rawQuery");
    return await FlutterDownloader.loadTasksWithRawQuery(query: rawQuery);
  }
}