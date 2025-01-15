// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:superkit_project/config/globals.dart' as globals;

mixin Themes {
  static final ThemeData light = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: globals.kcPrimaryColor,
    ),
    primaryColor: globals.kcPrimaryColor,
    brightness: Brightness.light,
    primaryColorLight: globals.lightBG,
    dialogBackgroundColor: globals.lightBG,
    scaffoldBackgroundColor: globals.lightBG,
    unselectedWidgetColor: globals.kcPrimaryColor,
    cardColor: globals.lightBG,
    hintColor: globals.kcPrimaryColor,
    highlightColor: globals.kcPrimaryColor.withOpacity(0.2),
    hoverColor: globals.kcPrimaryColor.withOpacity(0.2),
    focusColor: globals.kcPrimaryColor.withOpacity(0.2),
    disabledColor: globals.darkBG,
    splashColor: globals.kcPrimaryColor.withOpacity(0.1),
    canvasColor: globals.lightBG,
    cardTheme: CardTheme(shadowColor: globals.kcPrimaryColor.withOpacity(0.5)),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: globals.kcPrimaryColor,
      cursorColor: globals.lightColor,
      selectionHandleColor: globals.kcPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: globals.lightBG,
      elevation: 0,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(1),
        shadowColor:
            WidgetStateProperty.all(globals.kcPrimaryColor.withOpacity(0.2)),
        overlayColor: WidgetStateProperty.all(
          globals.kcPrimaryColor.withOpacity(0.1),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return globals.kcPrimaryColor;
        }
        return null;
      }),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      dragHandleColor: globals.lightColor,
    ),
    radioTheme: RadioThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return globals.kcPrimaryColor;
        }
        return null;
      }),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: globals.kcPrimaryColor,
      brightness: Brightness.light,
      background: globals.lightBG,
      onBackground: globals.kcPrimaryColor,
      surface: globals.lightBG,
      onSurface: globals.kcPrimaryColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(
          globals.kcPrimaryColor), // Uniform thumb color
      trackColor: WidgetStateProperty.all(
        globals.kcPrimaryColor.withOpacity(0.5),
      ), // U
      trackOutlineColor:
          WidgetStateProperty.all(globals.softColor.withOpacity(0.5)),
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: globals.kcPrimaryColor,
    ),
    primaryColor: globals.kcPrimaryColor,
    brightness: Brightness.dark,
    primaryColorDark: globals.darkBG,
    dialogBackgroundColor: globals.darkBG,
    scaffoldBackgroundColor: globals.darkBG,
    unselectedWidgetColor: globals.kcPrimaryColor,
    cardColor: globals.darkBG,
    hintColor: globals.lightColor,
    highlightColor: globals.kcPrimaryColor.withOpacity(0.2),
    hoverColor: globals.lightColor.withOpacity(0.2),
    focusColor: globals.lightColor.withOpacity(0.2),
    disabledColor: globals.darkBG,
    splashColor: globals.kcPrimaryColor.withOpacity(0.1),
    canvasColor: globals.darkBG,
    cardTheme: const CardTheme(shadowColor: globals.kcPrimaryColor),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: globals.kcPrimaryColor,
      cursorColor: globals.darkBG,
      selectionHandleColor: globals.kcPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: globals.darkBG,
      elevation: 0,
      shadowColor: globals.kcPrimaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(1),
        shadowColor: WidgetStateProperty.all(globals.lightBG.withOpacity(0.2)),
        overlayColor: WidgetStateProperty.all(globals.lightBG.withOpacity(0.1)),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return globals.kcPrimaryColor;
        }
        return null;
      }),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      dragHandleColor: globals.kcPrimaryColor,
    ),
    radioTheme: RadioThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return globals.kcPrimaryColor;
        }
        return null;
      }),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: globals.kcPrimaryColor,
      brightness: Brightness.light,
      background: globals.lightBG,
      onBackground: globals.kcPrimaryColor,
      surface: globals.lightBG,
      onSurface: globals.kcPrimaryColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(
          globals.kcPrimaryColor), // Uniform thumb color
      trackColor: WidgetStateProperty.all(
        globals.kcPrimaryColor.withOpacity(0.5),
      ), // U
      trackOutlineColor:
          WidgetStateProperty.all(globals.softColor.withOpacity(0.15)),
    ),
  );
}
