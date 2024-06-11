import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/domain/entities/color_response.dart';
import 'package:open_learning_smart_tv/color_management/remote_colors.dart';
import 'dart:convert';

class ColorManager {
  static final ColorManager _singleton = ColorManager._internal();

  late ColorManager themeManager;

  factory ColorManager() {
    return _singleton;
  }

  ColorManager._internal();

  Color _getColorFromString(String colorString) {
    return Color(_generateColorIntFromString(colorString));
  }

  int _generateColorIntFromString(String colorString) {
    try {
      colorString.replaceAll('#', '');
      if (colorString.length != 8) {
        colorString = "ff$colorString";
      }
      return int.parse(colorString, radix: 16);
    } catch (e) {
      return 0;
    }
  }

  //Retrieve from local file and pass it to RemoteTheme
  Future<void> retrieveBaseColors(AssetBundle rootBundle) async {
    var response = await rootBundle.loadString("assets/json/base_colors.json");
    jsonDecode(response);

    List<ColorResponse> colorList = List<ColorResponse>.from(
        json.decode(response).map((model) => ColorResponse.fromJson(model)));

    RemoteColors().assignColorsFromMap(Map.fromIterable(colorList,
        key: (element) => element.name, value: (element) => element.rgb));
  }

  Future<void> setColors(List<ColorResponse> colorList) async {
    RemoteColors().assignColorsFromMap(Map.fromIterable(colorList,
        key: (element) => element.name, value: (element) => element.rgb));
  }

  //COLOR GETTERS
  Color getColorBackgroundPrimary() {
    return _getColorFromString(RemoteColors().colorBackgroundPrimary);
  }

  Color getColorBackgroundPrimaryLighter() {
    return _getColorFromString(RemoteColors().colorBackgroundPrimaryLighter);
  }

  Color getColorBackgroundPrimaryCta() {
    return _getColorFromString(RemoteColors().colorBackgroundPrimaryCta);
  }

  Color getColorBackgroundSecondary() {
    return _getColorFromString(RemoteColors().colorBackgroundSecondary);
  }

  Color getColorBackgroundAccent() {
    return _getColorFromString(RemoteColors().colorBackgroundAccent);
  }

  Color getColorBackgroundSecondaryComplete() {
    return _getColorFromString(RemoteColors().colorBackgroundSecondaryComplete);
  }

  Color getColorBackgroundWarning() {
    return _getColorFromString(RemoteColors().colorBackgroundWarning);
  }

  Color getColorBackgroundDisabled() {
    return _getColorFromString(RemoteColors().colorBackgroundDisabled);
  }

  Color getColorBackgroundDisabledAlternative() {
    return _getColorFromString(
        RemoteColors().colorBackgroundDisabledAlternative);
  }

  Color getColorBackgroundSaved() {
    return _getColorFromString(RemoteColors().colorBackgroundSaved);
  }

  Color getColorBackgroundList() {
    return _getColorFromString(RemoteColors().colorBackgroundList);
  }

  Color getColorBorderPrimaryCta() {
    return _getColorFromString(RemoteColors().colorBorderPrimaryCta);
  }

  Color getColorBorderAccent() {
    return _getColorFromString(RemoteColors().colorBorderAccent);
  }

  Color getColorBorderSecondaryComplete() {
    return _getColorFromString(RemoteColors().colorBorderSecondaryComplete);
  }

  Color getColorBorderWarning() {
    return _getColorFromString(RemoteColors().colorBorderWarning);
  }

  Color getColorBorder() {
    return _getColorFromString(RemoteColors().colorBorder);
  }

  Color getColorBorderTag() {
    return _getColorFromString(RemoteColors().colorBorderTag);
  }

  Color getColorBorderError() {
    return _getColorFromString(RemoteColors().colorBorderError);
  }

  Color getColorTextPrimary() {
    return _getColorFromString(RemoteColors().colorTextPrimary);
  }

  Color getColorAccentVariantB() {
    return _getColorFromString(RemoteColors().colorAccentVariantB);
  }

  Color getColorAccentVariantA() {
    return _getColorFromString(RemoteColors().colorAccentVariantA);
  }

  Color getColorTextPrimaryAlternative() {
    return _getColorFromString(RemoteColors().colorTextPrimaryAlternative);
  }

  Color getColorTextPrimaryCta() {
    return _getColorFromString(RemoteColors().colorTextPrimaryCta);
  }

  Color getColorTextError() {
    return _getColorFromString(RemoteColors().colorTextError);
  }

  Color getColorTextWarning() {
    return _getColorFromString(RemoteColors().colorTextWarning);
  }

  Color getColorTextMandatory() {
    return _getColorFromString(RemoteColors().colorTextMandatory);
  }

  Color getColorTextDisabledAlternative() {
    return _getColorFromString(RemoteColors().colorTextDisabledAlternative);
  }

  Color getColorTextDisabled() {
    return _getColorFromString(RemoteColors().colorTextDisabled);
  }

  Color getColorSystemPrimary01() {
    return _getColorFromString(RemoteColors().colorSystemPrimary01);
  }

  Color getColorSystemPrimary02() {
    return _getColorFromString(RemoteColors().colorSystemPrimary02);
  }

  Color getColorSystemSecondary01() {
    return _getColorFromString(RemoteColors().colorSystemSecondary01);
  }

  Color getColorSystemSecondary02() {
    return _getColorFromString(RemoteColors().colorSystemSecondary02);
  }

  Color getColorSystemSecondary03() {
    return _getColorFromString(RemoteColors().colorSystemSecondary03);
  }

  Color getColorSystemSecondary04() {
    return _getColorFromString(RemoteColors().colorSystemSecondary04);
  }

  Color getColorSystemSecondary05() {
    return _getColorFromString(RemoteColors().colorSystemSecondary05);
  }

  Color getColorSystemDisabled() {
    return _getColorFromString(RemoteColors().colorSystemDisabled);
  }

  // Color getColorGradientImageBigCard() {
  //   return _getColorFromString(RemoteColors().colorGradientImageBigCard);
  // }

  // Color getColorGradientImageSmallCard() {
  //   return _getColorFromString(RemoteColors().colorGradientImageSmallCard);
  // }

  Color getColorGradientWidget() {
    return _getColorFromString(RemoteColors().colorGradientWidget);
  }

  // Color getColorGradientImageBigCardEnd() {
  //   return _getColorFromString(RemoteColors().colorGradientImageBigCardEnd);
  // }

  // Color getColorGradientImageSmallCardEnd() {
  //   return _getColorFromString(RemoteColors().colorGradientImageSmallCardEnd);
  // }

  Color getColorGradientWidgetEnd() {
    return _getColorFromString(RemoteColors().colorGradientWidgetEnd);
  }

  Color getColorGradient01Start() {
    return _getColorFromString(RemoteColors().colorGradient01Start);
  }

  Color getColorGradient01End() {
    return _getColorFromString(RemoteColors().colorGradient01End);
  }

  Color getColorGradient03Start() {
    return _getColorFromString(RemoteColors().colorGradient03Start);
  }

  Color getColorGradient03End() {
    return _getColorFromString(RemoteColors().colorGradient03End);
  }

  Color getColorGradient05Start() {
    return _getColorFromString(RemoteColors().colorGradient05Start);
  }

  Color getColorGradient05End() {
    return _getColorFromString(RemoteColors().colorGradient05End);
  }

  Color getColorBackgroundDrawerWidget() {
    return _getColorFromString(RemoteColors().colorBackgroundDrawerWidget);
  }
}
