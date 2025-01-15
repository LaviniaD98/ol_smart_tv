import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/material.dart';

part 'app_colors.dart';
part 'app_text_theme.dart';
part 'app_button_style.dart';
part 'dimens.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor:
          ColorManager().getColorBackgroundPrimaryLighter(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: ColorManager().getColorBackgroundPrimary(),
        onPrimary: AppColors.white,
        secondary: ColorManager().getColorBackgroundSecondary(),
        onSecondary: AppColors.white,
        error: AppColors.red,
        onError: AppColors.white,
        //background: AppColors.background,
        //onBackground: AppColors.white,
        surface: AppColors.black,
        onSurface: AppColors.white,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        toolbarHeight: Dimens.appBarHeight,
        backgroundColor: AppColors.primary,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        titleTextStyle: AppTextTheme.title(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager().getColorBorderTag(), width: 0.5),
          borderRadius: BorderRadius.circular(2.0),
        ),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager().getColorBorderTag(), width: 1.0),
          borderRadius: BorderRadius.circular(2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager().getColorBorderTag(), width: 1.5),
          borderRadius: BorderRadius.circular(2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager().getColorTextError(), width: 1.0),
          borderRadius: BorderRadius.circular(2.0),
        ),
        hintStyle: AppTextTheme.caption(
          style: FontStyle.italic,
          color: ColorManager().getColorTextPrimary().withValues(alpha: .5),
        ),
        labelStyle: AppTextTheme.body(
          color: ColorManager().getColorTextPrimary(),
          weight: FontWeight.bold,
        ),
        filled: true,
        isDense: true,
        hoverColor: ColorManager().getColorTextPrimary(),
        focusColor: ColorManager().getColorTextPrimary(),
      ),
      checkboxTheme: CheckboxThemeData(
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          checkColor:
              WidgetStateProperty.all(ColorManager().getColorTextPrimary()),
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return ColorManager().getColorBackgroundPrimaryCta();
            }
            return Colors.transparent;
          }),
          side: BorderSide(color: ColorManager().getColorTextPrimary())),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          const Set<WidgetState> interactiveStates = <WidgetState>{
            WidgetState.selected,
          };
          if (states.any(interactiveStates.contains)) {
            return ColorManager().getColorBackgroundPrimaryCta();
          }
          return ColorManager().getColorTextPrimary().withValues(alpha: .5);
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: AppButtonStyle.red),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: AppButtonStyle.outlined),
      progressIndicatorTheme: ProgressIndicatorThemeData(
          color: ColorManager().getColorBackgroundPrimaryCta()),
      indicatorColor: ColorManager().getColorBackgroundPrimaryCta(),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.white,
        dayStyle: AppTextTheme.body(color: Colors.black),
        weekdayStyle: AppTextTheme.body(color: Colors.black),
        headerForegroundColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        dayForegroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.greyTextDisabled;
          }
          return AppColors.black;
        }),
        yearForegroundColor: const WidgetStatePropertyAll(Colors.black),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        surfaceTintColor: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        modalBarrierColor: ColorManager()
            .getColorBackgroundDrawerWidget()
            .withValues(alpha: .5),
        shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(Dimens.radius)),
        ),
      ),
    );
  }

  static LinearGradient get greyGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorManager().getColorGradient01Start(),
        ColorManager().getColorGradient01End(),
      ],
    );
  }

  static LinearGradient get backgroundGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorManager().getColorBackgroundPrimaryLighter(),
        ColorManager().getColorBackgroundPrimaryLighter(),
      ],
    );
  }

  static LinearGradient get apppBackgroundGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorManager().getColorGradient01Start(),
        ColorManager().getColorGradient01End(),
      ],
    );
  }
}
