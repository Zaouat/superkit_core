// ignore_for_file: unrelated_type_equality_checks

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superkit_core/src/shared/app_colors.dart';

/*
1. We use AdaptiveTheme.of(context) to get the AdaptiveThemeData from the context.
2. We use AdaptiveTheme.of(context).mode to get the mode from the AdaptiveThemeData.
3. We use MediaQuery.of(context).platformBrightness to get the value of the Brightness.
4. We use the ternary operator to check if the AdaptiveTheme.of(context).mode is equal to AdaptiveThemeMode.system.
5. If it is equal to AdaptiveThemeMode.system, we check if the value of MediaQuery.of(context).platformBrightness is equal to Brightness.light.
6. If it is equal to Brightness.light we set the value to false.
7. Otherwise we set the value to true.
8. We check if the AdaptiveTheme.of(context).mode is equal to AdaptiveThemeMode.light.
9. If it is equal to AdaptiveThemeMode.light we set the value to false.
10. Otherwise we set the value to true. 
*/

Color colorChanger({
  required BuildContext context,
  required Color dark,
  required Color light,
}) {
  final Brightness brightness = MediaQuery.of(context).platformBrightness;
  return (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.system)
      ? brightness == Brightness.light
          ? light
          : dark
      : (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light)
          ? light
          : dark;
}

bool isDarkMode(
  BuildContext context,
) {
  final Brightness brightness = MediaQuery.of(context).platformBrightness;

  return (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.system)
      ? brightness == Brightness.light
          ? false
          : true
      : (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light)
          ? false
          : true;
}

Brightness? brightnessChanger({
  required BuildContext context,
  Brightness? dark,
  Brightness? light,
}) {
  final Brightness brightness = MediaQuery.of(context).platformBrightness;
  return (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.system)
      ? brightness == Brightness.light
          ? light!
          : dark!
      : (AdaptiveTheme.of(context).mode == ThemeMode.light)
          ? light
          : dark;
}

void changeNavStatusBarsColor({
  required BuildContext? context,
}) {
  final bool isDark = isDarkMode(context!);
  debugPrint(isDark.toString());
  final SystemUiOverlayStyle style = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: brightnessChanger(
      context: context,
      dark: Brightness.dark,
      light: Brightness.light,
    ),
    statusBarBrightness: brightnessChanger(
      context: context,
      dark: Brightness.dark,
      light: Brightness.light,
    ),
    systemNavigationBarColor: isDark ? kcNeutralColor_100 : Colors.white,
    systemNavigationBarIconBrightness:
        isDark ? Brightness.light : Brightness.dark,
  );
  SystemChrome.setSystemUIOverlayStyle(style);
}

void changeNavStatusBarsSystem({
  required BuildContext? context,
  required Brightness? brightness,
}) {
  final SystemUiOverlayStyle style = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: brightness,
    statusBarBrightness: brightnessChanger(
      context: context!,
      dark: Brightness.dark,
      light: Brightness.light,
    ),
    systemNavigationBarColor:
        brightness == Brightness.dark ? kcNeutralColor_100 : Colors.white,
    systemNavigationBarIconBrightness:
        brightness == Brightness.light ? Brightness.light : Brightness.dark,
  );
  SystemChrome.setSystemUIOverlayStyle(style);
}

void setLightMode({BuildContext? context}) {
  changeNavStatusBarsColor(context: context);
  AdaptiveTheme.of(context!).setLight();
}

void setDarkMode({BuildContext? context}) {
  changeNavStatusBarsColor(context: context);
  AdaptiveTheme.of(context!).setDark();
}

void setSystemMode({BuildContext? context}) {
  changeNavStatusBarsColor(context: context);
  AdaptiveTheme.of(context!).setSystem();
}
