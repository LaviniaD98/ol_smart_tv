part of 'splash_screen_cubit.dart';

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.initial() = _Initial;
  const factory SplashScreenState.progress() = _Progress;
  const factory SplashScreenState.end(bool enterOffline) = _End;
  const factory SplashScreenState.error() = _Error;
}
