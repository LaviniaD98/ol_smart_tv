import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/language/language_model.dart';
import '../../../remote_theming/labels/remote_labels.dart';
import '../languages_page.dart';

part 'languages_cubit.freezed.dart';
part 'languages_state.dart';

@injectable
class LanguagesCubit extends Cubit<LanguagesState> {
  LanguagesCubit(this._remoteLabels) : super(const LanguagesState.loading());

  final RemoteLabels _remoteLabels;

  VoidCallback? onChanged;

  void init(LanguagesPageArgs args) {
    onChanged = args.onChanged;
    emit(
      LanguagesState.initial(
        selected: _remoteLabels.selectedLanguage,
        supportedLanguages: _remoteLabels.supportedLanguages,
      ),
    );
  }

  void onLanguageChange(LanguageModel lang) async {
    final current = state;
    emit(const LanguagesState.loading());
    final res = await _remoteLabels.setLang(lang);

    if (res != null) {
      onChanged?.call();
    } else {
      emit(const LanguagesState.error());
      emit(current);
    }
  }
}
