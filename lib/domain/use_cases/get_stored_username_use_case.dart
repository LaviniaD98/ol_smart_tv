import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GetStoredUsernameUseCase {
  final SharedPreferences _sharedPreferences;
  GetStoredUsernameUseCase(this._sharedPreferences);
  String? call() {
    return _sharedPreferences.getString(SharedPreferencesKeys.username);
  }
}
