import 'package:open_learning_smart_tv/core/shared_preferences_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SetSkipTutorialUseCase {
  final SharedPreferences _sharedPreferences;
  SetSkipTutorialUseCase(this._sharedPreferences);
  Future<bool?> call(bool value) async {
    return await _sharedPreferences.setBool(
        SharedPreferencesKeys.tutorialFlag, value);
  }
}
