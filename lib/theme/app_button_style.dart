part of 'app_theme.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static ButtonStyle get red {
    return ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      minimumSize: WidgetStateProperty.all(
        const Size(Dimens.buttonWidth, Dimens.buttonHeight),
      ),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return ColorManager().getColorTextDisabledAlternative();
        }
        return ColorManager().getColorTextPrimaryAlternative();
      }),
      textStyle: WidgetStateProperty.resolveWith(
        (states) => AppTextTheme.button(),
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.any((element) => element == WidgetState.disabled)) {
            return ColorManager().getColorBackgroundDisabled();
          }
          return ColorManager().getColorBackgroundPrimaryCta();
        },
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.buttonRadius),
          ),
        ),
      ),
      padding: WidgetStateProperty.all<EdgeInsets>(
        const EdgeInsets.fromLTRB(
          Dimens.buttonLmargin,
          Dimens.buttonTmargin,
          Dimens.buttonRmargin,
          Dimens.buttonBmargin,
        ),
      ),
    );
  }

  static ButtonStyle get trasparent {
    return ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      minimumSize: WidgetStateProperty.all(
        const Size(Dimens.buttonWidth, Dimens.buttonHeight),
      ),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        return ColorManager().getColorTextPrimaryCta();
      }),
      textStyle: WidgetStateProperty.resolveWith(
        (states) => AppTextTheme.button(),
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => Colors.transparent,
      ),
      side: WidgetStateProperty.all<BorderSide>(
        BorderSide(
          color: ColorManager().getColorBorderPrimaryCta(),
          width: 1,
        ),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.buttonRadius),
          ),
        ),
      ),
      padding: WidgetStateProperty.all<EdgeInsets>(
        const EdgeInsets.fromLTRB(
          Dimens.buttonLmargin,
          Dimens.buttonTmargin,
          Dimens.buttonRmargin,
          Dimens.buttonBmargin,
        ),
      ),
    );
  }

  static ButtonStyle get outlined {
    return ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      minimumSize: WidgetStateProperty.all(
        const Size(Dimens.buttonWidth, Dimens.buttonHeight),
      ),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return ColorManager().getColorTextDisabled();
        }
        return ColorManager().getColorTextPrimaryCta();
      }),
      textStyle: WidgetStateProperty.resolveWith(
        (states) => AppTextTheme.button(),
      ),
      backgroundColor:
          WidgetStateProperty.resolveWith((states) => Colors.transparent),
      side: WidgetStateProperty.all<BorderSide>(
        BorderSide(
          color: ColorManager().getColorBorderPrimaryCta(),
          width: 1,
        ),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.buttonRadius),
          ),
        ),
      ),
      padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.fromLTRB(
          Dimens.buttonLmargin,
          Dimens.buttonTmargin,
          Dimens.buttonRmargin,
          Dimens.buttonBmargin)),
    );
  }

  static ButtonStyle get textSmall {
    return ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      minimumSize: WidgetStateProperty.all(const Size(0, 0)),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return ColorManager().getColorTextDisabled();
        }
        return ColorManager().getColorTextPrimaryCta();
      }),
      textStyle: WidgetStateProperty.resolveWith(
        (states) {
          return const TextStyle(
            fontFamily: 'OpenSans',
            fontStyle: FontStyle.normal,
            fontSize: 12.0,
          );
        },
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor:
          WidgetStateProperty.resolveWith((states) => Colors.transparent),
      side: WidgetStateProperty.all<BorderSide>(BorderSide.none),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.buttonRadius),
          ),
        ),
      ),
      padding: WidgetStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(horizontal: 0, vertical: Dimens.spacingXS),
      ),
    );
  }
}
