import 'dart:convert';

import 'package:open_learning_smart_tv/domain/entities/corporate_code/corporate_code_model.dart';
import 'package:open_learning_smart_tv/domain/entities/openid_config/openid_config_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../core/secure_store_keys.dart';
import '../domain/entities/self/self_model.dart';
import '../domain/entities/user/user_info_model.dart';

@injectable
class OlSecureStorage {
  final FlutterSecureStorage _flutterSecureStorage;
  OlSecureStorage(this._flutterSecureStorage);

  Future<UserInfoModel?> getUserInfo() async {
    UserInfoModel? item;
    try {
      String? itemRead =
          await _flutterSecureStorage.read(key: SecureStoreKeys.userInfo);
      Map<String, dynamic> jsonMap = jsonDecode(itemRead!);
      item = UserInfoModel.fromJson(jsonMap);
    } catch (e) {
      return null;
    }
    return item;
  }

  Future setUserInfo(UserInfoModel userInfoModel) async {
    try {
      Map<String, dynamic> jsonMap = userInfoModel.toJson();
      String valueToStore = jsonEncode(jsonMap);
      await _flutterSecureStorage.write(
          key: SecureStoreKeys.userInfo, value: valueToStore);
    } catch (e) {
      return null;
    }
    return getUserInfo();
  }

  Future<CorporateCodeModel?> getCorporateCode() async {
    CorporateCodeModel? item;
    try {
      String? itemRead =
          await _flutterSecureStorage.read(key: SecureStoreKeys.corporateCode);
      Map<String, dynamic> jsonMap = jsonDecode(itemRead!);
      item = CorporateCodeModel.fromJson(jsonMap);
    } catch (e) {
      return null;
    }
    return item;
  }

  Future setCorporateCode(CorporateCodeModel corporateCodeModel) async {
    try {
      Map<String, dynamic> jsonMap = corporateCodeModel.toJson();
      String valueToStore = jsonEncode(jsonMap);
      await _flutterSecureStorage.write(
          key: SecureStoreKeys.corporateCode, value: valueToStore);
    } catch (e) {
      return null;
    }
    return getCorporateCode();
  }

  Future<OpenidConfigModel?> getOpenidConfig() async {
    OpenidConfigModel? item;
    try {
      String? itemRead =
          await _flutterSecureStorage.read(key: SecureStoreKeys.openidConfig);
      Map<String, dynamic> jsonMap = jsonDecode(itemRead!);
      item = OpenidConfigModel.fromJson(jsonMap);
    } catch (e) {
      return null;
    }
    return item;
  }

  Future setOpenidConfig(OpenidConfigModel openidConfigModel) async {
    try {
      Map<String, dynamic> jsonMap = openidConfigModel.toJson();
      String valueToStore = jsonEncode(jsonMap);
      await _flutterSecureStorage.write(
          key: SecureStoreKeys.openidConfig, value: valueToStore);
    } catch (e) {
      return null;
    }
    return getOpenidConfig();
  }

  Future<bool?> getSkipOnboarding() async {
    bool? item;
    try {
      String? itemRead =
          await _flutterSecureStorage.read(key: SecureStoreKeys.skipOnboarding);
      item = bool.parse(itemRead ?? 'false');
    } catch (e) {
      return null;
    }
    return item;
  }

  Future setSkipOnboarding(bool skipOnboarding) async {
    try {
      await _flutterSecureStorage.write(
          key: SecureStoreKeys.skipOnboarding, value: '$skipOnboarding');
    } catch (e) {
      return null;
    }
    return getSkipOnboarding();
  }

  Future<SelfModel?> getUserSelf() async {
    SelfModel? item;
    try {
      String? itemRead =
          await _flutterSecureStorage.read(key: SecureStoreKeys.userSelf);
      Map<String, dynamic> jsonMap = jsonDecode(itemRead!);
      item = SelfModel.fromJson(jsonMap);
    } catch (e) {
      return null;
    }
    return item;
  }

  Future setUserSelf(SelfModel selfModel) async {
    try {
      Map<String, dynamic> jsonMap = selfModel.toJson();
      String valueToStore = jsonEncode(jsonMap);
      await _flutterSecureStorage.write(
          key: SecureStoreKeys.userSelf, value: valueToStore);
    } catch (e) {
      return null;
    }
    return getUserSelf();
  }

  Future<void> clear() async {
    await _flutterSecureStorage.deleteAll();
  }

  Future<void> clearUserInfo() async {
    await _flutterSecureStorage.delete(key: SecureStoreKeys.userInfo);
  }

  Future<void> clearInitiative() async {
    UserInfoModel? uinfo = await getUserInfo();
    if (uinfo != null) {
      UserInfoModel uiToWrite =
          UserInfoModel(uinfo.sessionId, null, uinfo.user);
      setUserInfo(uiToWrite);
    }
  }

  Future<void> clearUserSelf() async {
    await _flutterSecureStorage.delete(key: SecureStoreKeys.userSelf);
  }
}
