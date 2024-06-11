class RemoteNames {
  static final RemoteNames _singleton = RemoteNames._internal();

  late RemoteNames remoteTheme;

  factory RemoteNames() {
    return _singleton;
  }

  RemoteNames._internal();

  //Background Colors
  final colorBackgroundPrimary = "color.background.primary";
  final String colorBackgroundPrimaryLighter =
      "color.background.primary-lighter";
  final String colorBackgroundPrimaryCta = "color.background.primary-cta";
  final String colorBackgroundSecondary = "color.background.secondary";
  final String colorBackgroundAccent = "color.background.accent";
  final String colorBackgroundSecondaryComplete =
      "color.background.secondary-complete";
  final String colorBackgroundWarning = "color.background.warning";
  final String colorBackgroundDisabled = "color.background.disabled";
  final String colorBackgroundDisabledAlternative =
      "color.background.disabled-alternative";
  final String colorBackgroundSaved = "color.background.saved";
  final String colorBackgroundList = "color.background.list";

  //Border Colors
  final String colorBorderPrimaryCta = "color.border.primary-cta";
  final String colorBorderAccent = "color.border.accent";
  final String colorBorderSecondaryComplete = "color.border.secondary-complete";
  final String colorBorderWarning = "color.border-warning";
  final String colorBorder = "color.border";
  final String colorBorderTag = "color.border.tag";
  final String colorBorderError = "color.border-error";

  //Text Colors
  final String colorTextPrimary = "color.text.primary";
  final String colorTextPrimaryAlternative = "color.text.primary-alternative";
  final String colorTextPrimaryCta = "color.text.primary-cta";
  final String colorTextError = "color.text-error";
  final String colorTextWarning = "color.text-warning";
  final String colorTextMandatory = "color.text-mandatory";
  final String colorTextDisabledAlternative = "color.text.disabled-alternative";
  final String colorTextDisabled = "color.text.disabled";
  final String colorAccentVariantB = "color.accent.variant.B";
  final String colorAccentVariantA = "color.accent.variant.A";

  //System Colors
  final String colorSystemPrimary01 = "color.system.primary.01";
  final String colorSystemPrimary02 = "color.system.primary.02";
  final String colorSystemSecondary01 = "color.system.secondary.01";
  final String colorSystemSecondary02 = "color.system.secondary.02";
  final String colorSystemSecondary03 = "color.system.secondary.03";
  final String colorSystemSecondary04 = "color.system.secondary.04";
  final String colorSystemSecondary05 = "color.system.secondary.05";
  final String colorSystemDisabled = "color.system.disabled";

  //Gradients
  final String colorGradientImageBigCard = "color.gradient.image-big.card";
  final String colorGradientImageSmallCard = "color.gradient.image-small.card";
  final String colorGradientWidget = "color.gradient.widget";
  final String colorGradientImageBigCardEnd = "color.gradient.image-big.card-end";
  final String colorGradientImageSmallCardEnd = "color.gradient.image-small.card-end";
  final String colorGradientWidgetEnd = "color.gradient.widget-end";

  final String colorGradient01Start = "color.gradient.01.start";
  final String colorGradient01End = "color.gradient.01.end";

  final String colorGradient03Start = "color.gradient.03.start";
  final String colorGradient03End = "color.gradient.03.end";

  final String colorGradient05Start = "color.gradient.05.start";
  final String colorGradient05End = "color.gradient.05.end";

  final String colorBackgroundDrawerWidget = "color.background.drawer-widget";
}
