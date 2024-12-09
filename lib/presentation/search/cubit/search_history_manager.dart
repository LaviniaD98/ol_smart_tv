import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/core/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryManager {
  SearchHistoryManager() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
      getHistorySearch();
    });
  }
  late SharedPreferences _sharedPreferences;

  ValueNotifier<List<String>> suggestionsNotifier = ValueNotifier([]);

  void getHistorySearch() {
    final suggestions = _sharedPreferences
            .getStringList(SharedPreferencesKeys.latestResearch) ??
        [];
    suggestionsNotifier.value = List.from(suggestions);
  }

  Future<bool> setSearchHistory(String text) async {
    final suggestions = _sharedPreferences
            .getStringList(SharedPreferencesKeys.latestResearch) ??
        [];
    if (!suggestions.contains(text)) {
      if (suggestions.length >= 8) {
        suggestions.removeLast();
      }
      suggestions.insert(0, text);
      final success = await _sharedPreferences.setStringList(
          SharedPreferencesKeys.latestResearch, suggestions);

      if (success) {
        suggestionsNotifier.value = List.from(suggestions);
      }

      return success;
    }
    return false;
  }

  Future<bool> cleanHistorySearch() async {
    final success =
        await _sharedPreferences.remove(SharedPreferencesKeys.latestResearch);

    if (success) {
      suggestionsNotifier.value = List.from([]);
    }
    return success;
  }

  Future<bool> deleteHistorySearch(String text) async {
    final suggestions = _sharedPreferences
            .getStringList(SharedPreferencesKeys.latestResearch) ??
        [];
    if (suggestions.contains(text)) {
      suggestions.remove(text);

      final success = await _sharedPreferences.setStringList(
          SharedPreferencesKeys.latestResearch, suggestions);

      if (success) {
        suggestionsNotifier.value = List.from(suggestions);
      }

      return success;
    }
    return false;
  }
}

var searchManager = SearchHistoryManager();
