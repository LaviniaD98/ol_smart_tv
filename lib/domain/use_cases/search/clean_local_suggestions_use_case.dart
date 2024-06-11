import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/shared_preferences_keys.dart';

@lazySingleton
class CleanLocalSuggestionsUseCase {
  final SharedPreferences _sharedPreferences;

  CleanLocalSuggestionsUseCase(this._sharedPreferences);

  Future<bool> call() {
    return _sharedPreferences.remove(SharedPreferencesKeys.latestResearch);
  }
}
