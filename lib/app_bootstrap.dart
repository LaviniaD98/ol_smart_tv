import 'dart:async';

import 'package:open_learning_smart_tv/core/env/env.dart';
import 'package:open_learning_smart_tv/core/shared_preferences_keys.dart';
import 'package:open_learning_smart_tv/prod_firebase_options.dart';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/dependency_injection/dependency_injection.dart';
import 'firebase_options.dart';

Future<void> bootstrap(Env env) async {
  //WidgetsFlutterBinding.ensureInitialized();

  ScaledWidgetsFlutterBinding.ensureInitialized(
    scaleFactor: (deviceSize) {
      // screen width used in your UI design
      const double widthOfDesign = 1920;
      return deviceSize.width / widthOfDesign;
    },
  );
  //await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  String appFlavor = const String.fromEnvironment('FLUTTER_APP_FLAVOR') != ''
      ? const String.fromEnvironment('FLUTTER_APP_FLAVOR')
      : "dev";
  try {
    if (kDebugMode) print("appFlavor: $appFlavor - env.name: ${env.name}");
    if (env.name == "dev") {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
    } else {
      await Firebase.initializeApp(
          options: ProdFirebaseOptions.currentPlatform);
    }
  } catch (e) {
    if (kDebugMode) print("exception while trying to inizialize firebase: $e");
  }

  await configureDependencies(env.name);

  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool(SharedPreferencesKeys.firtRun) ?? true) {
    if (kDebugMode)
      print(
          "App opening check: openend for the first time - deleting secure storage");
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.deleteAll();
    prefs.setBool(SharedPreferencesKeys.firtRun, false);
  } else {
    if (kDebugMode) print("App opening check: reopened");
  }

  await ColorManager().retrieveBaseColors(rootBundle);
  await ConfigManager().retrieveRemoteConfig();
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          false // option: set to false to disable working with http links (default: false)
      );

  await getIt<RemoteLabels>().initialize();
  //AppRouter.I.setRouter();
}
