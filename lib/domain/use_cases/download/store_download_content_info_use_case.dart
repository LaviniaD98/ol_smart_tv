import 'dart:convert';

import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/entities/download/source_model.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class StoreDownloadContentInfoUseCase {
  final SharedPreferences _sharedPreferences;
  StoreDownloadContentInfoUseCase(this._sharedPreferences);

  Future call(
      DetailPageModel detailPageModel,
      String? taskId,
      SourceModel downloadableModel,
      String parentId,
      String? tentativeId,
      DetailPageArgs args,
      double currentBookmark) async {
    try {
      DownloadedItem downloadedItem = DownloadedItem(
        id: detailPageModel.id,
        taskId: taskId,
        coverUrl: detailPageModel.coverPublicURL,
        isMandatory: detailPageModel.isMandatory ?? false,
        type: downloadableModel.container,
        title: detailPageModel.title ?? "",
        description: detailPageModel.shortDescription ?? "",
        pathId: parentId,
        duration: detailPageModel.duration,
        learningObjectType: detailPageModel.learningObjectType,
        learningObjectTypology: detailPageModel.learningObjectTypology,
        size: downloadableModel.size,
        tentativeId: tentativeId,
        iconStatus: detailPageModel.iconStatus,
        bookmark: currentBookmark.toInt(),
        parentId: (args.parent?.id != null ? args.parent!.id!.toString() : ""),
        grandParentId: (args.grandParentId != null ? args.grandParentId! : ""),
      );
      Map<String, dynamic> jsonMap = downloadedItem.toJson();
      String valueToStore = jsonEncode(jsonMap);
      if (kDebugMode)
        print(
            'download_manager about to STORE sharedcontent for VIDEO_${detailPageModel.id.toString()}');
      await _sharedPreferences.setString(
          "VIDEO_${detailPageModel.id.toString()}", valueToStore);
    } catch (e) {
      return null;
    }
  }

  Future storeDownloadItem(DownloadedItem downloadedItem, String loId) async {
    try {
      Map<String, dynamic> jsonMap = downloadedItem.toJson();
      String valueToStore = jsonEncode(jsonMap);
      if (kDebugMode)
        print(
            'download_manager storeDownloadItem - about to STORE sharedcontent for VIDEO_$loId');
      await _sharedPreferences.setString("VIDEO_$loId", valueToStore);
    } catch (e) {
      return null;
    }
  }
}
