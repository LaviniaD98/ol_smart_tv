part of 'languages_cubit.dart';

@freezed
class LanguagesState with _$LanguagesState {
  const factory LanguagesState.initial({
    required LanguageModel selected,
    required List<LanguageModel> supportedLanguages,
  }) = _Initial;
  const factory LanguagesState.loading() = _Loading;
  const factory LanguagesState.error() = _Error;
}
