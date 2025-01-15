// ignore_for_file: always_specify_types

library superkit.globals;

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

// The global language code is selected to change the font when Arabic is selected (En) by default.
String lang = 'en';

List<Map<String, Object>> supportedThemes = [
  {
    // The global theme is selected to change the color scheme when is selected (SupekitScheme) by default.
    'theme': FlexScheme.custom,
    // The global color scheme list is selected to change the color when the LightMode & DarkMode is changed.
    'colors': [
      Colors.red,
      Colors.red,
    ],
  },
  {
    // The global theme is selected to change the color scheme when is selected (SupekitScheme) by default.
    'theme': FlexScheme.flutterDash,
    // The global color scheme list is selected to change the color when the LightMode & DarkMode is changed.
    'colors': [
      Colors.red,
      Colors.red,
    ],
  }
];
