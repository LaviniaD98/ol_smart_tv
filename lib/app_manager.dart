import 'package:flutter/material.dart';

final manager = AppManager();

class AppManager {
  AppManager();

  final navKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState>? currentTabNavKey;

  Future<void> pushOnStack({required Widget screen}) async {
    await manager.currentTabNavKey?.currentState?.push(
      MaterialPageRoute<dynamic>(
        builder: (context) => screen,
        settings: RouteSettings(
          name: screen.runtimeType.toString(),
          arguments: const {'stacked': true},
        ),
      ),
    );
  }
}
