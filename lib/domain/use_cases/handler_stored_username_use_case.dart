import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class HandlerStoredUsernameUseCase {
  final SharedPreferences _sharedPreferences;

  HandlerStoredUsernameUseCase(this._sharedPreferences);

  Future<void> call({required String? username, required bool remember}) async {
    if (remember && username != null) {
      await _sharedPreferences.setString(
        SharedPreferencesKeys.username,
        username,
      );
    } else {
      await _sharedPreferences.remove(SharedPreferencesKeys.username);
    }
  }
}
