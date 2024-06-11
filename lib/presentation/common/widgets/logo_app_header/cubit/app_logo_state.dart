part of 'app_logo_cubit.dart';

@freezed
class AppLogoState with _$AppLogoState {
  const factory AppLogoState.loading() = _Loading;
  const factory AppLogoState.logoRetrieved({required String fullImageName}) = _LogoRetrieved;
  const factory AppLogoState.useAssetLogo() = _UseAssetLogo;
}