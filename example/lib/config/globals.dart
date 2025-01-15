import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';
export 'dart:io' show Platform;

// The global language code is selected to change the font when Arabic is selected (En) by default.
String lang = 'en';

// The global theme is selected to change the color scheme when is selected (SupekitScheme) by default.
Color lightBG = const Color(0xfff8f8f8);
Color darkBG = Colors.black;
Color lightColor = const Color(0xffF8F8F8);
Color colorTxt = const Color(0xff2D3748);
Color softColor = const Color(0xffA7AABD);
Color darkColor = Colors.black;
Color cardColor = softColor.withOpacity(.1);

const Color kcPrimaryColor = Color(0xff4e5ce6);
const Color kcAccentColor = Color(0xff36bb91);
const Color kcSecondaryColor = Color(0xffd8805d);

List<Map<String, Object>> supportedThemes = [
  {
    // The global theme is selected to change the color scheme when is selected (SupekitScheme) by default.
    'theme': FlexScheme.custom,
    // The global color scheme list is selected to change the color when the LightMode & DarkMode is changed.
    'colors': [
      kcPrimaryColor,
      kcPrimaryColor,
    ],
  },
];
