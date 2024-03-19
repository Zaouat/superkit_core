// ignore_for_file: use_named_constants, always_specify_types

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:superkit_core/superkit_core.dart';

class LocaleProvider with ChangeNotifier {
  LocaleProvider() {
    _box = GetStorage();
    Future.delayed(const Duration(), () async {
      fetchLocale();
    });
  }
  GetStorage? _box;

  Locale appLocale = const Locale('en');

  Future<void> fetchLocale() async {
    if (_box?.read('language_code') == null) {
      appLocale = const Locale('en');
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
    appLocale = Locale(languageData.code);
    notifyListeners();
  }
}
