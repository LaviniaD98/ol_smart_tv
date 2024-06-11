import 'package:open_learning_smart_tv/color_management/remote_names.dart';

class RemoteColors {
  static final RemoteColors _singleton = RemoteColors._internal();

  late RemoteColors remoteTheme;

  factory RemoteColors() {
    return _singleton;
  }

  RemoteColors._internal();

  //Background Colors
  String colorBackgroundPrimary = "1B1B1B";
  String colorBackgroundPrimaryLighter = "F4F6F6";
  String colorBackgroundPrimaryCta = "D40C34";
  String colorBackgroundSecondary = "1B1B1B";
  String colorBackgroundAccent = "006141";
  String colorBackgroundSecondaryComplete = "004F99";
  String colorBackgroundWarning = "CB3919";
  String colorBackgroundDisabled = "DCDBDB";
  String colorBackgroundDisabledAlternative = "4F4B4C";
  String colorBackgroundSaved = "6C7A00";
  String colorBackgroundList = "3E3E43";

  //Border Colors
  String colorBorderPrimaryCta = "D40C34";
  String colorBorderAccent = "006141";
  String colorBorderSecondaryComplete = "004F99";
  String colorBorderWarning = "CB3919";
  String colorBorder = "4F4B4C";
  String colorBorderTag = "1B1B1B";
  String colorBorderError = "E01A1A";

  //Text Colors
  String colorTextPrimary = "1B1B1B";
  String colorTextPrimaryAlternative = "F4F6F6";
  String colorTextPrimaryCta = "D40C34";
  String colorTextError = "E01A1A";
  String colorTextWarning = "CB3919";
  String colorTextMandatory = "006141";
  String colorTextDisabledAlternative = "4F4B4C";
  String colorTextDisabled = "DCDBDB";
  String colorAccentVariantB = "0FD9FF";
  String colorAccentVariantA = "A6FF03";

  //System Colors
  String colorSystemPrimary01 = "4F4B4C";
  String colorSystemPrimary02 = "D40C34";
  String colorSystemSecondary01 = "006141";
  String colorSystemSecondary02 = "004F99";
  String colorSystemSecondary03 = "CB3919";
  String colorSystemSecondary04 = "6C7A00";
  String colorSystemSecondary05 = "F4F6F6";
  String colorSystemDisabled = "DCDBDB";

  //Gradients
  String colorGradientImageBigCard = "00F9F9F9";
  String colorGradientImageBigCardEnd = "FF1B1B1B";

  String colorGradientImageSmallCard = "1AF9F9F9";
  String colorGradientImageSmallCardEnd = "B31B1B1B";

  String colorGradientWidget = "EBEBEB";
  String colorGradientWidgetEnd = "E3E343";

  String colorGradient01Start = "0019191f";
  String colorGradient01End = "FF3e3e43";

  String colorGradient03Start = "0019191f";
  String colorGradient03End = "FF3e3e43";

  String colorGradient05Start = "0019191f";
  String colorGradient05End = "FF3e3e43";

  String colorBackgroundDrawerWidget = "FFFFFF";

  void assignColorsFromMap(Map<String, String> map) {
    //Assign background colors
    colorBackgroundPrimary =
        map[RemoteNames().colorBackgroundPrimary] ?? colorBackgroundPrimary;
    colorBackgroundPrimaryLighter =
        map[RemoteNames().colorBackgroundPrimaryLighter] ??
            colorBackgroundPrimaryLighter;
    colorBackgroundPrimaryCta = map[RemoteNames().colorBackgroundPrimaryCta] ??
        colorBackgroundPrimaryCta;
    colorBackgroundSecondary =
        map[RemoteNames().colorBackgroundSecondary] ?? colorBackgroundSecondary;
    colorBackgroundAccent =
        map[RemoteNames().colorBackgroundAccent] ?? colorBackgroundAccent;
    colorBackgroundSecondaryComplete =
        map[RemoteNames().colorBackgroundSecondaryComplete] ??
            colorBackgroundSecondaryComplete;
    colorBackgroundWarning =
        map[RemoteNames().colorBackgroundWarning] ?? colorBackgroundWarning;
    colorBackgroundDisabled =
        map[RemoteNames().colorBackgroundDisabled] ?? colorBackgroundDisabled;
    colorBackgroundDisabledAlternative =
        map[RemoteNames().colorBackgroundDisabledAlternative] ??
            colorBackgroundDisabledAlternative;
    colorBackgroundSaved =
        map[RemoteNames().colorBackgroundSaved] ?? colorBackgroundSaved;

    colorBackgroundList =
        map[RemoteNames().colorBackgroundList] ?? colorBackgroundList;

    //Assign border colors
    colorBorderPrimaryCta =
        map[RemoteNames().colorBorderPrimaryCta] ?? colorBorderPrimaryCta;
    colorBorderAccent =
        map[RemoteNames().colorBorderAccent] ?? colorBorderAccent;
    colorBorderSecondaryComplete =
        map[RemoteNames().colorBorderSecondaryComplete] ??
            colorBorderSecondaryComplete;
    colorBorderWarning =
        map[RemoteNames().colorBorderWarning] ?? colorBorderWarning;
    colorBorder = map[RemoteNames().colorBorder] ?? colorBorder;
    colorBorderTag = map[RemoteNames().colorBorderTag] ?? colorBorderTag;
    colorBorderError = map[RemoteNames().colorBorderError] ?? colorBorderError;

    //Assign text colors
    colorTextPrimary = map[RemoteNames().colorTextPrimary] ?? colorTextPrimary;
    colorTextPrimaryAlternative =
        map[RemoteNames().colorTextPrimaryAlternative] ??
            colorTextPrimaryAlternative;
    colorTextPrimaryCta =
        map[RemoteNames().colorTextPrimaryCta] ?? colorTextPrimaryCta;
    colorTextError = map[RemoteNames().colorTextError] ?? colorTextError;
    colorTextWarning = map[RemoteNames().colorTextWarning] ?? colorTextWarning;
    colorTextMandatory =
        map[RemoteNames().colorTextMandatory] ?? colorTextMandatory;
    colorTextDisabledAlternative =
        map[RemoteNames().colorTextDisabledAlternative] ??
            colorTextDisabledAlternative;
    colorTextDisabled =
        map[RemoteNames().colorTextDisabled] ?? colorTextDisabled;

    colorAccentVariantB =
        map[RemoteNames().colorAccentVariantB] ?? colorAccentVariantB;

    colorAccentVariantA =
        map[RemoteNames().colorAccentVariantA] ?? colorAccentVariantA;

    //Assign system colors
    colorSystemPrimary01 =
        map[RemoteNames().colorSystemPrimary01] ?? colorSystemPrimary01;
    colorSystemPrimary02 =
        map[RemoteNames().colorSystemPrimary02] ?? colorSystemPrimary02;
    colorSystemSecondary01 =
        map[RemoteNames().colorSystemSecondary01] ?? colorSystemSecondary01;
    colorSystemSecondary02 =
        map[RemoteNames().colorSystemSecondary02] ?? colorSystemSecondary02;
    colorSystemSecondary03 =
        map[RemoteNames().colorSystemSecondary03] ?? colorSystemSecondary03;
    colorSystemSecondary04 =
        map[RemoteNames().colorSystemSecondary04] ?? colorSystemSecondary04;
    colorSystemSecondary05 =
        map[RemoteNames().colorSystemSecondary05] ?? colorSystemSecondary05;
    colorSystemDisabled =
        map[RemoteNames().colorSystemDisabled] ?? colorSystemDisabled;

    //Assign gradient colors
    colorGradientImageBigCard = map[RemoteNames().colorGradientImageBigCard] ??
        colorGradientImageBigCard;
    if (colorGradientImageBigCard.isNotEmpty &&
        colorGradientImageBigCard.length == 6) {
      colorGradientImageBigCard = "00$colorGradientImageBigCard";
    }
    colorGradientImageBigCardEnd =
        map[RemoteNames().colorGradientImageBigCardEnd] ??
            colorGradientImageBigCardEnd;
    if (colorGradientImageBigCardEnd.isNotEmpty &&
        colorGradientImageBigCardEnd.length == 6) {
      colorGradientImageBigCardEnd = "FF$colorGradientImageBigCardEnd";
    }

    colorGradientImageSmallCard =
        map[RemoteNames().colorGradientImageSmallCard] ??
            colorGradientImageSmallCard;
    if (colorGradientImageSmallCard.isNotEmpty &&
        colorGradientImageSmallCard.length == 6) {
      colorGradientImageSmallCard = "00$colorGradientImageSmallCard";
    }
    colorGradientImageSmallCardEnd =
        map[RemoteNames().colorGradientImageSmallCardEnd] ??
            colorGradientImageSmallCardEnd;
    if (colorGradientImageSmallCardEnd.isNotEmpty &&
        colorGradientImageSmallCardEnd.length == 6) {
      colorGradientImageSmallCardEnd = "FF$colorGradientImageSmallCardEnd";
    }

    colorGradientWidget =
        map[RemoteNames().colorGradientWidget] ?? colorGradientWidget;
    if (colorGradientWidget.isNotEmpty && colorGradientWidget.length == 6) {
      colorGradientWidget = "00$colorGradientWidget";
    }
    colorGradientWidgetEnd =
        map[RemoteNames().colorGradientWidgetEnd] ?? colorGradientWidgetEnd;
    if (colorGradientWidgetEnd.isNotEmpty &&
        colorGradientWidgetEnd.length == 6) {
      colorGradientWidgetEnd = "FF$colorGradientWidgetEnd";
    }

    colorGradient01Start =
        map[RemoteNames().colorGradient01Start] ?? colorGradient01Start;
    // if (colorGradient01Start.isNotEmpty && colorGradient01Start.length == 6) {
    //   colorGradient01Start = "00$colorGradient01Start";
    // }
    colorGradient01End =
        map[RemoteNames().colorGradient01End] ?? colorGradient01End;
    // if (colorGradient01End.isNotEmpty && colorGradient01End.length == 6) {
    //   colorGradient01End = "FF$colorGradient01End";
    // }

    colorGradient03Start =
        map[RemoteNames().colorGradient03Start] ?? colorGradient03Start;
    if (colorGradient03Start.isNotEmpty && colorGradient03Start.length == 6) {
      colorGradient03Start = "00$colorGradient03Start";
    }
    colorGradient03End =
        map[RemoteNames().colorGradient03End] ?? colorGradient03End;
    if (colorGradient03End.isNotEmpty && colorGradient03End.length == 6) {
      colorGradient03End = "FF$colorGradient03End";
    }

    colorGradient05Start =
        map[RemoteNames().colorGradient05Start] ?? colorGradient05Start;
    if (colorGradient05Start.isNotEmpty && colorGradient05Start.length == 6) {
      colorGradient05Start = "00$colorGradient05Start";
    }
    colorGradient05End =
        map[RemoteNames().colorGradient05End] ?? colorGradient05End;
    if (colorGradient05End.isNotEmpty && colorGradient05End.length == 6) {
      colorGradient05End = "FF$colorGradient05End";
    }

    colorBackgroundDrawerWidget =
        map[RemoteNames().colorBackgroundDrawerWidget] ??
            colorBackgroundDrawerWidget;
  }
}
