import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/database/app_database.dart';
import '../../core/shared_preferences_keys.dart';
import '../entities/user/user_info_model.dart';

@lazySingleton
class CleanLocalDatabaseUseCase {
  final AppDatabase _appDatabase;
  final SharedPreferences _sharedPreferences;

  CleanLocalDatabaseUseCase(
    this._appDatabase,
    this._sharedPreferences,
  );

  Future<void> call(UserInfoModel? model) async {
    final storedId = _sharedPreferences.getInt(SharedPreferencesKeys.userId);
    if (storedId != model?.user?.idUser) {
      /// if the new login is made by a different user, clean local database
      await _appDatabase.clean();
    }
    return;
  }
}
