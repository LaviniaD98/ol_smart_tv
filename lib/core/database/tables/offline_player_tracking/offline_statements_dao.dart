import 'dart:convert';

import 'package:open_learning_smart_tv/core/database/tables/offline_player_tracking/offline_statements.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/data/models/requests/offline/offline_statements_info.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../app_database.dart';

part 'offline_statements_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [OfflineStatements])
class OfflineStatementsDao extends DatabaseAccessor<AppDatabase>
    with _$OfflineStatementsDaoMixin {
  OfflineStatementsDao(super.attachedDatabase);

  Future<Either<Failure, OfflineStatement>> add(
      {required DownloadedItem downloadedItem,
      required OfflineStatementsInfo offlineStatementsInfo,
      required PlayerEvent type}) {
    Map<String, dynamic> downloadedItemJsonMap = downloadedItem.toJson();
    String downloadedItemJson = jsonEncode(downloadedItemJsonMap);

    Map<String, dynamic> offlineStatementsInfoJsonMap =
        offlineStatementsInfo.toJson();
    String offlineStatementsInfoJson = jsonEncode(offlineStatementsInfoJsonMap);
    if (kDebugMode)
      print(
          "OFFLINESTATEMENT adding videoId[${downloadedItem.id.toString()}]trackinJsongObject[$offlineStatementsInfoJson]offlineVideoJsongObject[$downloadedItemJson]downloadedItemJson[$downloadedItemJson]");
    return catchFailure(() => into(offlineStatements).insertReturning(
          OfflineStatementsCompanion.insert(
            videoId: Value<String?>(downloadedItem.id.toString()),
            trackinJsongObject: Value<String?>(offlineStatementsInfoJson),
            offlineVideoJsongObject: Value<String?>(downloadedItemJson),
            type: type,
          ),
        ));
  }

  Future<Either<Failure, List<OfflineStatement>>> getAll() {
    return catchFailure(() => select(offlineStatements).get());
  }

  Future<OfflineStatement> getById(String videoId) {
    return (select(offlineStatements)
          ..where((tbl) => tbl.videoId.equals(videoId)))
        .getSingle();
  }

  Future<bool> deleteById(String videoId) async {
    return await (delete(offlineStatements)
              ..where((t) => t.videoId.equals(videoId)))
            .go() ==
        1;
  }
}
