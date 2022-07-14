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
      kcPrimaryColor_50,
      kcPrimaryColor_50,
    ],
  },
  {
    'theme': FlexScheme.mandyRed,
    'colors': [
      const Color(0xffcd5758),
      const Color(0xffda8585),
    ],
  },
  {
    'theme': FlexScheme.espresso,
    'colors': [
      const Color(0xff220804),
      const Color(0xff8d7f7d),
    ],
  },
  {
    'theme': FlexScheme.amber,
    'colors': [
      const Color(0xffe65100),
      const Color(0xffffb300),
    ]
  },
  {
    'theme': FlexScheme.green,
    'colors': [
      const Color(0xff2e7d32),
      const Color(0xffa5d6a7),
    ],
  },
  {
    'theme': FlexScheme.aquaBlue,
    'colors': [
      const Color(0xff35a0cb),
      const Color(0xff5db3d5),
    ],
  },
  {
    'theme': FlexScheme.gold,
    'colors': [
      const Color(0xffb86914),
      const Color(0xffeda85e),
    ],
  }
];
