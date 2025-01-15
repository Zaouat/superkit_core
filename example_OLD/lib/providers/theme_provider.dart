// ignore_for_file: use_named_constants, always_specify_types, avoid_setters_without_getters, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:superkit_core/superkit_core.dart';

class ThemeProvider with ChangeNotifier {
  late FlexScheme? defaultTheme = FlexScheme.custom;

  GetStorage? box;

  ThemeProvider() {
    box = GetStorage();
    _getThemeFromSharedPrefs();
  }

  FlexScheme get getSelectedTheme {
    return defaultTheme!;
  }

  set setTheme(FlexScheme theme) {
    defaultTheme = theme;
    _saveThemeInSharedPrefs(theme);
    notifyListeners();
  }

  void _getThemeFromSharedPrefs() {
    final String? themeFromPrefs = box?.read('theme');
    if (themeFromPrefs != null) {
      defaultTheme = parseStringScheme(themeFromPrefs);
    }
    notifyListeners();
  }

  Future<void> _saveThemeInSharedPrefs(FlexScheme theme) async {
    await box?.write('theme', theme.name);
  }
}
