import 'package:flutter/material.dart';
import 'theme_handler.dart';

class GlowThemeInherited extends InheritedWidget {
  const GlowThemeInherited({
    super.key,
    required super.child,
    required this.value,
    required this.onChange,
  });

  final GlowThemeHandler? value;

  final ValueChanged<GlowThemeHandler> onChange;

  @override
  bool updateShouldNotify(GlowThemeInherited oldWidget) =>
      value != oldWidget.value;

  GlowThemeData? get current => value!.current;

  bool get isUsingDark => value!.useDark;

  GlowThemeType? get themeType => value!.themeType;

  set themeType(GlowThemeType? themeType) =>
      onChange(value!.copyWith(themeType: themeType));

  set updateCurrentTheme(GlowThemeData themeData) => onChange(
        value!.copyWith(
          theme: isUsingDark ? null : themeData,
          darkTheme: isUsingDark ? themeData : null,
        ),
      );
}
