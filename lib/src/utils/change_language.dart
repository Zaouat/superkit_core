// // ignore_for_file: file_names, always_specify_types, use_named_constants

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:superkit_core/src/models/language.dart';

// class AppLanguage {
//   AppLanguage() {
//     _box = GetStorage();
//     Future.delayed(const Duration(), () async {
//       fetchLocale();
//     });
//   }
//   GetStorage? _box;

//   Locale appLocale = const Locale('en');

//   Future<void> fetchLocale() async {
//     if (_box?.read('language_code') == null) {
//       appLocale = const Locale('en');
//     } else {
//       appLocale = Locale(_box?.read('language_code') as String);
//     }
//     Get.updateLocale(appLocale);
//   }

//   Future<void> changeLanguage({required LanguageData languageData}) async {
//     if (appLocale == Locale(languageData.code)) {
//       return;
//     }
//     appLocale = Locale(languageData.code);
//     await _box?.write('language_code', languageData.code);
//     await _box?.write('countryCode', languageData.countryCode);
//     Get.updateLocale(Locale(languageData.code));
//   }
// }
