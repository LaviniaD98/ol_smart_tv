import 'dart:convert';

import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_lang.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../core/dependency_injection/dependency_injection.dart';

class LabelsManager {
  static final LabelsManager _singleton = LabelsManager._internal();

  late LabelsManager labelManager;

  factory LabelsManager() {
    return _singleton;
  }

  LabelsManager._internal();

  ///Retrieve from remote config and pass it to RemoteLabel
  /// old method - remove
  Future<void> retrieveRemoteLabels() async {
    await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 60),
        minimumFetchInterval: const Duration(seconds: 1)));
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    var json = FirebaseRemoteConfig.instance
        .getString(RemoteLabelLanguages.it_IT.name);
    final map = jsonDecode(json) as Map<String, dynamic>;

    Map<String, String> mapped =
        map.map((key, value) => MapEntry(key, value!.toString()));
    getIt<RemoteLabels>().storeLabels(mapped);
  }

  /// get remote label from a String. This is only for dev purposes.
  /// Ideally always use RemoteLabelKeys instead
  String getRemoteStringFromString(String key) {
    if (getIt<RemoteLabels>().selectedLabels.containsKey(key)) {
      return getIt<RemoteLabels>().selectedLabels[key] ?? key;
    } else if (getIt<RemoteLabels>().primaryLabels.containsKey(key)) {
      return getIt<RemoteLabels>().primaryLabels[key] ?? key;
    } else if (getIt<RemoteLabels>().fallbackLabels.containsKey(key)) {
      return getIt<RemoteLabels>().fallbackLabels[key] ?? key;
    } else {
      return key;
    }
  }

  /// get remote label from a RemoteLabelKeys.
  String getRemoteStringFromLabelKeys(RemoteLabelKeys key) {
    if (getIt<RemoteLabels>().selectedLabels.containsKey(key.name)) {
      return getIt<RemoteLabels>().selectedLabels[key.name] ?? key.name;
    } else if (getIt<RemoteLabels>().primaryLabels.containsKey(key.name)) {
      return getIt<RemoteLabels>().primaryLabels[key.name] ?? key.name;
    } else if (getIt<RemoteLabels>().fallbackLabels.containsKey(key.name)) {
      return getIt<RemoteLabels>().fallbackLabels[key.name] ?? key.name;
    } else {
      return key.name;
    }
  }
}
