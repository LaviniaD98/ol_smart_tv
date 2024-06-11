import 'dart:convert';

import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GetStoredDownloadContentInfoUseCase {
  final SharedPreferences _sharedPreferences;
  GetStoredDownloadContentInfoUseCase(this._sharedPreferences);
  Future<DownloadedItem?> call(String contentKey) async {
    DownloadedItem? item;
    try {
      String? itemRead = _sharedPreferences.getString("VIDEO_$contentKey");
      if (kDebugMode)
        print(
            'download_manager about to GET sharedcontent for "VIDEO_$contentKey - itemRead: $itemRead');
      Map<String, dynamic> jsonMap = jsonDecode(itemRead!);
      item = DownloadedItem.fromJson(jsonMap);
    } catch (e) {
      return null;
    }
    return item;
  }
}
