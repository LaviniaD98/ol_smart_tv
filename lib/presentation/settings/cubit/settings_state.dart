part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial({SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO}) = Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.error() = _Error;
  const factory SettingsState.goToInitiatives({CognitoUserSession? session, SelfModel? selfModel, String? sessionId}) = _GoToInitiatives;
}