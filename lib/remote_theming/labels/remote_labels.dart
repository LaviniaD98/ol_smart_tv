import 'dart:convert';
import 'dart:io';

import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/language/language_model.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/shared_preferences_keys.dart';
import '../../domain/use_cases/smart_configurator/get_labels_use_case.dart';
import '../../domain/use_cases/smart_configurator/get_languages_use_case.dart';

@lazySingleton
class RemoteLabels with ChangeNotifier {
  final GetLanguagesUseCase _getLanguagesUseCase;
  final GetLabelsUseCase _getLabelsUseCase;
  final SharedPreferences _sharedPreferences;

  RemoteLabels(
    this._getLanguagesUseCase,
    this._getLabelsUseCase,
    this._sharedPreferences,
  );

  static const _fallbackLanguage = LanguageModel(label: 'Italian', id: 'it');

  bool enableMultiLanguages = false;

  /// Default labels - assets/translation/it.json
  Map<String, String> fallbackLabels = {};

  /// Remote primary labels
  Map<String, String> primaryLabels = {};

  /// Remote selected labels
  Map<String, String> selectedLabels = {};

  late List<LanguageModel> supportedLanguages;

  late LanguageModel selectedLanguage;

  Iterable<Locale> get supportedLocales =>
      supportedLanguages.map((e) => Locale(e.id));

  Locale get locale => Locale(selectedLanguage.id);

  Future<void> initialize() async {
    await setFallback();
    final res = await _readFileLabels();
    res.fold((l) {
      if (kDebugMode) print(l.error.toString());
    }, (r) async {
      /// Set stored languages
      final lang = _sharedPreferences.getString(SharedPreferencesKeys.language);
      if (lang != null) {
        final Map<String, dynamic> json = jsonDecode(lang);
        final storedLang = LanguageModel.fromJson(json);
        selectedLanguage = storedLang;
        supportedLanguages = [storedLang];
        selectedLabels = r;
        storeLabels(r);
      } else {
        /// Set default languages
        storeLabels(fallbackLabels);
      }
    });
  }

  void refresh() {
    notifyListeners();
  }

  Future<void> setFallback() async {
    final String response =
        await rootBundle.loadString('assets/translation/it.json');
    final Map<String, dynamic> data = await json.decode(response);
    final labels = data.map((key, value) =>
        MapEntry(key, value?.toString().replaceAll(r'\n', '\n') ?? ''));
    Intl.defaultLocale = _fallbackLanguage.id;
    fallbackLabels = labels;
    selectedLanguage = _fallbackLanguage;
    supportedLanguages = [_fallbackLanguage];
    storeLabels(fallbackLabels);
  }

  void storeLabels(Map<String, String> map) {
    selectedLabels = map;
    notifyListeners();
  }

  Future<LanguageModel?> setLang(LanguageModel lang) async {
    final labels = await _getLabelsUseCase(lang.id);
    LanguageModel? result;
    await labels.fold((l) async {
      if (kDebugMode) print(l.error.toString());
      result = null;
    }, (r) async {
      Intl.defaultLocale = lang.id;
      selectedLanguage = lang;
      await _sharedPreferences.setString(
          SharedPreferencesKeys.language, jsonEncode(selectedLanguage));
      await _setPrimaryLabels(lang);
      _saveFileLabels(r);
      storeLabels(r);
      result = lang;
    });
    return result;
  }

  Future<void> _saveFileLabels(Map<String, String> data) async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'translation.json'));
    file.writeAsString(jsonEncode(data));
  }

  Future<Either<Failure, Map<String, String>>> _readFileLabels() async {
    return catchFailure(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(join(dbFolder.path, 'translation.json'));
      final Map<String, dynamic> data = jsonDecode(await file.readAsString());
      return data.map((key, value) =>
          MapEntry(key, value?.toString().replaceAll(r'\n', '\n') ?? ''));
    });
  }

  Future<void> _setPrimaryLabels(LanguageModel lang) async {
    if (!lang.isPrimary) {
      final primaryLang =
          supportedLanguages.firstWhereOrNull((element) => element.isPrimary);
      if (primaryLang != null) {
        final res = await _getLabelsUseCase(primaryLang.id);
        await res.fold((l) {
          if (kDebugMode) print(l.error.toString());
        }, (r) async {
          primaryLabels = r;
        });
      } else {
        primaryLabels = {};
      }
    } else {
      primaryLabels = {};
    }
  }

  Future<void> getLanguages({int? corporateId}) async {
    final langCode = await _getLanguagesUseCase(corporateId);
    await langCode.fold((l) {
      if (kDebugMode) print(l.error.toString());
    }, (r) async {
      enableMultiLanguages = r.enableMultilanguage;
      supportedLanguages = [r.primaryLanguage, ...r.secondaryLanguage];
      final lang = _sharedPreferences.getString(SharedPreferencesKeys.language);
      if (lang != null) {
        final Map<String, dynamic> json = jsonDecode(lang);
        final storedLang = LanguageModel.fromJson(json);
        if (supportedLanguages.contains(storedLang)) {
          await setLang(storedLang);
        } else {
          await setLang(r.primaryLanguage);
        }
      } else {
        await setLang(r.primaryLanguage);
      }
    });
  }
}
