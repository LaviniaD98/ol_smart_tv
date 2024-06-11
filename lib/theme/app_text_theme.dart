part of 'app_theme.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextStyle title({
    Color? color,
    double? size,
    FontWeight? weight,
    FontStyle? style,
  }) =>
      TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: weight ?? FontWeight.bold,
        fontStyle: style ?? FontStyle.normal,
        fontSize: size ?? 42.0,
        color: color,
        letterSpacing: 0.5,
      );

  static TextStyle subtitle({
    Color? color,
    double? size,
    FontWeight? weight,
    FontStyle? style,
  }) =>
      TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: weight ?? FontWeight.w400,
        fontStyle: style ?? FontStyle.normal,
        fontSize: size ?? 30.0,
        color: color,
      );

  static TextStyle headerTitle({
    Color? color,
    double? size,
    FontWeight? weight,
    FontStyle? style,
  }) =>
      TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: weight ?? FontWeight.w500,
        fontStyle: style ?? FontStyle.normal,
        fontSize: size ?? 22.0,
        color: color,
      );

  static TextStyle body({
    Color? color,
    double? size,
    FontWeight? weight,
    FontStyle? style,
  }) =>
      TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: weight ?? FontWeight.normal,
        fontStyle: style ?? FontStyle.normal,
        fontSize: size ?? 20.0,
        color: color,
      );

  static TextStyle caption({
    Color? color,
    double? size,
    FontWeight? weight,
    FontStyle? style,
  }) =>
      TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: weight ?? FontWeight.normal,
        fontStyle: style ?? FontStyle.normal,
        fontSize: size ?? 18.0,
        color: color,
      );

  static TextStyle appBar({
    Color? color,
    double? size,
    FontWeight? weight,
    FontStyle? style,
  }) =>
      TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: weight ?? FontWeight.w500,
        fontStyle: style ?? FontStyle.normal,
        fontSize: size ?? 18.0,
        color: color,
      );

  static TextStyle button({
    Color? color,
    double? size,
    FontWeight? weight,
    FontStyle? style,
  }) =>
      TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: weight ?? FontWeight.bold,
        fontStyle: style ?? FontStyle.normal,
        fontSize: size ?? 28.0,
        color: color,
      );

  static TextStyle dialogTitle({
    Color? color,
    double? size,
    FontWeight? weight,
    FontStyle? style,
  }) =>
      TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: weight ?? FontWeight.bold,
        fontStyle: style ?? FontStyle.normal,
        fontSize: size ?? 16.0,
        color: color,
      );

  static TextStyle bottomNavigation({
    Color? color,
    double? size,
    FontWeight? weight,
    FontStyle? style,
  }) =>
      TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: weight ?? FontWeight.normal,
        fontStyle: style ?? FontStyle.normal,
        fontSize: size ?? 10.0,
        color: color,
      );

  static TextStyle link({
    Color? color,
    double? size,
    FontWeight? weight,
    FontStyle? style,
  }) =>
      TextStyle(
          fontFamily: 'OpenSans',
          fontWeight: weight ?? FontWeight.normal,
          fontStyle: style ?? FontStyle.normal,
          fontSize: size ?? 12.0,
          color: color,
          decoration: TextDecoration.underline);
}
