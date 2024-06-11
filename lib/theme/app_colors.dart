part of 'app_theme.dart';

abstract class AppColors {

  static const Color red = Color(0xffF43E63);

  static const Color white = Color(0xffffffff);

  static const Color blue = Color(0xff53b7e8);

  static const Color black = Color(0xff000000);

  static const Color greyTextDisabled = Color(0xffD9D9D9);

  static const Color grey = Color(0xffa2a2a2);

  static const Color background = Color(0xff191f24);

  static Color primary = ColorManager().getColorBackgroundPrimaryLighter();

  static Color primaryFaded = ColorManager().getColorBackgroundPrimaryLighter();

  static const Color buttonDisabled = Color(0xff696969);

  static const Color validationError = Color(0xffEB5757);

  static const Color textLight = Color(0xffffffff);

  static const LinearGradient greyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff19191F),
      Color(0xff3E3E43),
    ],
  );

  static LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primary,
      primaryFaded,
    ],
  );
}
