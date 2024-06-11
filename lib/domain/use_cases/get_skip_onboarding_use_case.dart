import 'package:open_learning_smart_tv/core/shared_preferences_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GetSkipOnboardingUseCase {
  final SharedPreferences _sharedPreferences;
  GetSkipOnboardingUseCase(this._sharedPreferences);
  Future<bool?> call() async {
    return _sharedPreferences.getBool(SharedPreferencesKeys.onboardingFlag);
  }
}
