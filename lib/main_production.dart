import 'package:open_learning_smart_tv/application.dart';
import 'package:open_learning_smart_tv/core/env/env.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/app_bootstrap.dart';

void main() async {
  await bootstrap(Prod());
  runApp(const Application());
}
