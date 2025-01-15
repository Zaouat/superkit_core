import 'dart:async';

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';
import 'package:superkit_project/db_manager.dart';

class LocaleProvider with ChangeNotifier {
  LocaleProvider() {
    unawaited(_initLocale());
  }

  Locale appLocale = const Locale('en'); // Default locale

  Future<void> _initLocale() async {
    final config = DBManager.getAppConfig();
    appLocale = Locale(config.languageCode, config.countryCode);

    // Load the locale in AppLocalizations
    await AppLocalizations(appLocale).load();
    notifyListeners();
  }

  Future<void> changeLanguage({required LanguageData languageData}) async {
    if (appLocale.languageCode == languageData.code &&
        appLocale.countryCode == languageData.countryCode) {
      return;
    }

    appLocale = Locale(languageData.code, languageData.countryCode);

    final config = DBManager.getAppConfig();
    DBManager.saveAppconfig(config.copyWith(
      languageCode: languageData.code,
      countryCode: languageData.countryCode,
    ));

    // Load the new locale in AppLocalizations
    await AppLocalizations(appLocale).load();
    notifyListeners();
  }
}
