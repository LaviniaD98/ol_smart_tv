import 'dart:io';

import 'package:open_learning_smart_tv/data/data_sources/download_ics/download_ics_data_source.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/data/models/requests/events_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../domain/entities/download_ics/events_model.dart';
import '../../../domain/entities/user/user_info_model.dart';
import '../../../domain/repositories/download_ics/download_ics_repository.dart';
import '../../../domain/use_cases/get_secure_stored_user_info_use_case.dart';
import '../../../domain/use_cases/session/get_stored_corporate_id_use_case.dart';
import '../../models/requests/download_ics_request_dto.dart';

@LazySingleton(as: DownloadIcsRepository)
class DownloadIcsRepositoryImpl implements DownloadIcsRepository {
  final DownloadIcsDataSource _dataSource;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  DownloadIcsRepositoryImpl(
    this._dataSource,
    this._getStoredCorporateIdUseCase,
    this._getSecureStoredUserInfoUseCase,
  );

  @override
  Future<Either<Failure, String>> downloadEvents(
      {String? date, List<EventsModel>? events}) {
    return catchFailure(() async {
      /// Get corporateID
      final corporateId = await _getStoredCorporateIdUseCase();

      /// Get initiativeId
      UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase();
      int? initiativeId = userInfoModel?.initiativeId;

      String? downloadsPath;

      if (Platform.isAndroid) {
        final directory = await getDownloadsDirectory();
        downloadsPath = directory != null ? directory.path : "";
      } else {
        final directory = await getApplicationDocumentsDirectory();
        downloadsPath = directory.path;
      }
      if (kDebugMode) print("download_ics downloadsPath $downloadsPath");

      if (events?.isNotEmpty == true) {
        final body = DownloadIcsRequestDto(
          date: date,
          events: events?.map((e) => EventsDto.fromModel(e)).toList() ?? [],
        );

        final res = await _dataSource.downloadEvents(
          corporateId: '${corporateId?.id}',
          initiativeId: '$initiativeId',
          body: body,
        );

        var now = DateTime.now().microsecondsSinceEpoch;
        var contentDisposition =
            res.response.headers.value('content-disposition');
        var filePath = (contentDisposition == null)
            ? '$downloadsPath/ol_calendar_${date?.split('-').join()}.ics'
            : '$downloadsPath/${contentDisposition.substring(contentDisposition.indexOf('=') + 1)}.$now.ics';
        if (kDebugMode) print("download_ics filePath $filePath");
        var directory = await Directory(downloadsPath).create(recursive: true);
        // Save to filesystem
        bool exists = await directory.exists();
        if (kDebugMode) print("download_ics directory exists $exists");
        final file = File(filePath);
        if (file.existsSync()) {
          if (kDebugMode) print("download_ics about to delete existing file");
          file.deleteSync();
        }
        file.createSync();
        if (res.data?.runes.isNotEmpty == true) {
          file.writeAsBytes(res.data!.runes.toList());
        }
        if (kDebugMode) print("download_ics file saved in $filePath");
        return filePath;
      } else {
        if (kDebugMode) print("download_ics file failed");
        return Future.error('download_ics file failed');
      }
    });
  }

  @override
  Future<Either<Failure, String>> getEvents({
    required String date,
    required List<EventsModel> events,
  }) {
    return catchFailure(() async {
      /// Get corporateID
      final corporateId = await _getStoredCorporateIdUseCase();

      /// Get initiativeId
      UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase();
      int? initiativeId = userInfoModel?.initiativeId;

      final body = DownloadIcsRequestDto(
        date: date,
        events: events.map((e) => EventsDto.fromModel(e)).toList(),
      );

      final res = await _dataSource.downloadEvents(
        corporateId: '${corporateId?.id}',
        initiativeId: '$initiativeId',
        body: body,
      );
      if (res.data != null && res.data!.isNotEmpty) {
        return res.data!;
      } else {
        return Future.error('An Error occurred');
      }
    });
  }
}
