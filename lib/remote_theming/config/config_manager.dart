import 'dart:convert';

import 'package:open_learning_smart_tv/remote_theming/config/remote_config.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_file.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_keys.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';

class ConfigManager {
  static final ConfigManager _singleton = ConfigManager._internal();

  late ConfigManager labelManager;

  factory ConfigManager() {
    return _singleton;
  }

  ConfigManager._internal();

  ///Retrieve from remote config and pass it to RemoteConfig
  Future<void> retrieveRemoteConfig() async {
    try {
      await FirebaseRemoteConfig.instance.setConfigSettings(
          RemoteConfigSettings(
              fetchTimeout: const Duration(seconds: 60),
              minimumFetchInterval: const Duration(seconds: 1)));
      await FirebaseRemoteConfig.instance.fetchAndActivate();
      var json = FirebaseRemoteConfig.instance
          .getString(RemoteConfigFile.remote_configs.name);
      final map = jsonDecode(json) as Map<String, dynamic>;

      Map<String, dynamic> mapped =
          map.map((key, value) => MapEntry(key, value));
      RemoteConfig().storeConfig(mapped);
    } catch (e) {
      final String response =
          await rootBundle.loadString('assets/json/remote_config.json');
      final Map<String, dynamic> data = await json.decode(response);
      final configs = data.map((key, value) => MapEntry(key, value));
      RemoteConfig().storeConfig(configs);
    }
  }

  /// Get remote values from a RemoteConfiglKeys.
  String getRemoteString(RemoteConfigKeys key) {
    String value = key.name;
    if (RemoteConfig().labels.containsKey(key.name)) {
      return RemoteConfig().labels[key.name] ?? key.name;
    }
    return value;
  }

  int getRemoteInt(RemoteConfigKeys key, int defaultValue) {
    int value = defaultValue;
    if (RemoteConfig().labels.containsKey(key.name)) {
      return RemoteConfig().labels[key.name];
    }
    return value;
  }

  bool getRemoteBoolean(RemoteConfigKeys key, bool defaultValue) {
    bool value = defaultValue;
    if (RemoteConfig().labels.containsKey(key.name)) {
      return RemoteConfig().labels[key.name];
    }
    return value;
  }

  List<dynamic> getRemoteList(
      RemoteConfigKeys key, List<dynamic> defaultValue) {
    List<dynamic> value = defaultValue;
    if (RemoteConfig().labels.containsKey(key.name)) {
      return RemoteConfig().labels[key.name];
    }
    return value;
  }
}
