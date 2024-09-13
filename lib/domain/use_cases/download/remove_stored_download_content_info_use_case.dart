import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class RemoveStoredDownloadContentInfoUseCase {
  final SharedPreferences _sharedPreferences;
  RemoveStoredDownloadContentInfoUseCase(this._sharedPreferences);
  Future<void> call(String contentKey) async {
    try {
      if (kDebugMode) print('download_manager about to DELETE sharedcontent for $contentKey');
      await _sharedPreferences.remove(contentKey);
    } catch (_) {}
  }
}
