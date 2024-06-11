class RemoteConfig {
  static final RemoteConfig _singleton = RemoteConfig._internal();

  late RemoteConfig remoteConfig;

  factory RemoteConfig() {
    return _singleton;
  }

  RemoteConfig._internal();

  Map<String, dynamic> labels = {};

  void storeConfig(Map<String, dynamic> map){labels = map;}
}