import 'package:open_learning_smart_tv/application.dart';
import 'package:open_learning_smart_tv/core/env/env.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/app_bootstrap.dart';
import 'package:firebase_core/firebase_core.dart'; // For Firebase initialization
import 'package:firebase_crashlytics/firebase_crashlytics.dart'; // For Crashlytics
import 'dart:ui'; // For PlatformDispatcher

void main() async {
  await bootstrap(Test());
  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const Application());
}
