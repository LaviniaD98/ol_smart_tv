import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class OlCognitoStorage extends CognitoStorage {
  final SharedPreferences _sharedPreferences;
  OlCognitoStorage(this._sharedPreferences);

  @override
  Future getItem(String key) async {
    String item;
    try {
      item = json.decode(_sharedPreferences.getString(key)!);
    } catch (e) {
      return null;
    }
    return item;
  }

  @override
  Future setItem(String key, value) async {
    await _sharedPreferences.setString(key, json.encode(value));
    return getItem(key);
  }

  @override
  Future removeItem(String key) async {
    final item = getItem(key);
    await _sharedPreferences.remove(key);
    return item;
  }

  @override
  Future<void> clear() async {}
}
