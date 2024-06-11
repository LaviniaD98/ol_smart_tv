import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/shared_preferences_keys.dart';

@lazySingleton
class SetLocalSuggestionsUseCase {
  final SharedPreferences _sharedPreferences;

  SetLocalSuggestionsUseCase(this._sharedPreferences);

  Future<bool> call(String text) async {
    final suggestions = _sharedPreferences.getStringList(SharedPreferencesKeys.latestResearch) ?? [];
    if(!suggestions.contains(text)) {
      if(suggestions.length >= 8) {
        suggestions.removeAt(0);
      }
      suggestions.add(text);
      return await _sharedPreferences.setStringList(SharedPreferencesKeys.latestResearch, suggestions);
    }
    return false;
  }
}
