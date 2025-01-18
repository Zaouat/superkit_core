import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';
export 'dart:io' show Platform;

// The global language code is selected to change the font when Arabic is selected (En) by default.
String lang = 'en';

// The global theme is selected to change the color scheme when is selected (SupekitScheme) by default.
Color lightBG = const Color(0xfff8f8f8);
Color darkBG = const Color(0xff0F1C2E);
Color lightColor = const Color(0xffF8F8F8);
Color colorTxt = const Color(0xff2D3748);
Color softColor = const Color(0xffA7AABD);
Color darkColor = Colors.black;
Color cardColor = softColor.withOpacity(.1);

// The global color scheme is selected to change the color when the LightMode & DarkMode is changed.
const Color kcPrimary_100 = Color.fromARGB(255, 0, 93, 185);
const Color kcPrimary_200 = Color(0xff4d648d);
const Color kcPrimary_300 = Color(0xffacc2ef);
const Color kcAccent_100 = Color(0xff3D5A80);
const Color kcAccent_200 = Color(0xffcee8ff);
const Color kcSecondaryColor = Color(0xffd8805d);

// The global Title of the app
String title = 'SuperKit Core';

// The globals URL's of the App

String Logo = 'assets/logo.png';
String zaouat_avatar = 'https://i.postimg.cc/FKN2g1qr/zaouat-compressed.jpg';
String elmissouri_avatar = 'https://i.postimg.cc/X78jMSbY/image-12.png';
String hamza_avatar = 'https://i.postimg.cc/qRyrjWw0/image-13.png';

List<Map<String, Object>> supportedThemes = [
  {
    // The global theme is selected to change the color scheme when is selected (SupekitScheme) by default.
    'theme': FlexScheme.custom,
    // The global color scheme list is selected to change the color when the LightMode & DarkMode is changed.
    'colors': [
      kcPrimary_100,
      kcPrimary_100,
    ],
  },
];
