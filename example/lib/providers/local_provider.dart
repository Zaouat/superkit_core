// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:superkit_core/superkit_core.dart';

class LocaleProvider with ChangeNotifier {
  LocaleProvider() {
    _box = GetStorage();
    _initLocale();
  }

  GetStorage? _box;
  Locale appLocale = const Locale('en'); // Default locale

  Future<void> _initLocale() async {
    await _box?.initStorage; // Ensure GetStorage is initialized
    if (_box?.read('language_code') == null) {
      // Load device locale if no stored language
      final String? localeString =
          WidgetsBinding.instance.window.locale.toLanguageTag();
      if (localeString != null) {
        final List<String> parts = localeString.split('-');
        if (parts.length > 1) {
          appLocale = Locale(parts[0], parts[1]);
        } else {
          appLocale = Locale(parts[0]);
        }
      } else {
        appLocale = const Locale('en'); // Default locale if fetching fails
      }
    } else {
      appLocale = Locale(_box?.read('language_code') as String);
    }
    notifyListeners();
  }

  Future<void> changeLanguage({required LanguageData languageData}) async {
    if (appLocale == Locale(languageData.code)) {
      return;
    }

    appLocale = Locale(languageData.code);
    await _box?.write('language_code', languageData.code);
    await _box?.write('countryCode', languageData.countryCode);
    notifyListeners();
  }
}
