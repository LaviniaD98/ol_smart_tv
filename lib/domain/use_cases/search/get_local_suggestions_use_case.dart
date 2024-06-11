import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/shared_preferences_keys.dart';

@lazySingleton
class GetLocalSuggestionsUseCase {
  final SharedPreferences _sharedPreferences;

  GetLocalSuggestionsUseCase(this._sharedPreferences);

  List<String> call() {
    return _sharedPreferences.getStringList(SharedPreferencesKeys.latestResearch) ?? [];
  }
}
