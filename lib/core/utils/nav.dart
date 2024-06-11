import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Nav {
  //MARK:- BEFORE LOGIC -> fullScreen ? true : (root == false ? val : root)
  static Future<dynamic> push(
    BuildContext context, {
    required Widget screen,
    RouteSettings? settings,
    bool root = false,
    bool fullScreen = false,
    bool applySelectionAreaIfWeb = true,
  }) async {
    var val = false;
    if (!kIsWeb) {
      if (root == false && Platform.isAndroid) {
        val = true;
      }
    }

    return Navigator.of(context,
            rootNavigator: fullScreen || (root == false ? val : root))
        .push(
      kIsWeb
          ? PageRouteBuilder(
              pageBuilder: (_, __, ___) => applySelectionAreaIfWeb
                  ? SelectionArea(child: screen)
                  : screen,
              transitionDuration: Duration.zero,
            )
          : MaterialPageRoute(
              builder: (context) => screen,
              fullscreenDialog: fullScreen,
            ),
    );
  }

  static Future<dynamic> pushReplacement(
    BuildContext context, {
    required Widget screen,
    RouteSettings? settings,
    bool root = false,
    bool fullScreen = false,
    bool applySelectionAreaIfWeb = true,
  }) async {
    var val = false;
    if (!kIsWeb) {
      if (root == false && Platform.isAndroid) {
        val = true;
      }
    }
    return Navigator.of(context,
            rootNavigator: fullScreen || (root == false ? val : root))
        .pushReplacement(
      kIsWeb
          ? PageRouteBuilder(
              pageBuilder: (_, __, ___) => applySelectionAreaIfWeb
                  ? SelectionArea(child: screen)
                  : screen,
              transitionDuration: Duration.zero,
            )
          : MaterialPageRoute(
              builder: (context) => screen,
              fullscreenDialog: fullScreen,
            ),
    );
  }

  static Future<dynamic> pushAndRemoveUntil(
    BuildContext context, {
    required Widget screen,
    RouteSettings? settings,
    bool root = false,
    bool fullScreen = true,
    bool applySelectionAreaIfWeb = true,
  }) async {
    var val = false;
    if (!kIsWeb) {
      if (root == false && Platform.isAndroid) {
        val = true;
      }
    }
    return Navigator.of(context,
            rootNavigator: fullScreen || (root == false ? val : root))
        .pushAndRemoveUntil<dynamic>(
            kIsWeb
                ? PageRouteBuilder(
                    pageBuilder: (_, __, ___) => applySelectionAreaIfWeb
                        ? SelectionArea(child: screen)
                        : screen,
                    transitionDuration: Duration.zero,
                  )
                : MaterialPageRoute<dynamic>(
                    builder: (context) => screen, fullscreenDialog: fullScreen),
            (Route<dynamic> route) => false);
  }
}
