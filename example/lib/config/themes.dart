// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superkit_project/config/globals.dart' as globals;

mixin Themes {
  static final ThemeData light = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: globals.kcPrimary_100,
    ),
    primaryColor: globals.kcPrimary_100,
    brightness: Brightness.light,
    primaryColorLight: globals.lightBG,
    dialogBackgroundColor: globals.lightBG,
    scaffoldBackgroundColor: globals.lightBG,
    unselectedWidgetColor: globals.kcPrimary_100,
    cardColor: globals.lightBG,
    hintColor: globals.kcPrimary_100,
    highlightColor: globals.kcPrimary_100.withOpacity(0.2),
    hoverColor: globals.kcPrimary_100.withOpacity(0.2),
    focusColor: globals.kcPrimary_100.withOpacity(0.2),
    disabledColor: globals.darkBG,
    splashColor: globals.kcPrimary_100.withOpacity(0.1),
    canvasColor: globals.lightBG,
    cardTheme: CardTheme(shadowColor: globals.kcPrimary_100.withOpacity(0.5)),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: globals.kcPrimary_100,
      cursorColor: globals.lightColor,
      selectionHandleColor: globals.kcPrimary_100,
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
            WidgetStateProperty.all(globals.kcPrimary_100.withOpacity(0.2)),
        overlayColor: WidgetStateProperty.all(
          globals.kcPrimary_100.withOpacity(0.1),
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
          return globals.kcPrimary_100;
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
          return globals.kcPrimary_100;
        }
        return null;
      }),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: globals.kcPrimary_100,
      brightness: Brightness.light,
      background: globals.lightBG,
      onBackground: globals.kcPrimary_100,
      surface: globals.lightBG,
      onSurface: globals.kcPrimary_100,
    ),
    switchTheme: SwitchThemeData(
      thumbColor:
          WidgetStateProperty.all(globals.kcPrimary_100), // Uniform thumb color
      trackColor: WidgetStateProperty.all(
        globals.kcPrimary_100.withOpacity(0.5),
      ), // U
      trackOutlineColor:
          WidgetStateProperty.all(globals.softColor.withOpacity(0.5)),
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: globals.kcPrimary_100,
    ),
    primaryColor: globals.kcPrimary_100,
    brightness: Brightness.dark,
    primaryColorDark: globals.darkBG,
    dialogBackgroundColor: globals.darkBG,
    scaffoldBackgroundColor: globals.darkBG,
    unselectedWidgetColor: globals.kcPrimary_100,
    cardColor: globals.darkBG,
    hintColor: globals.lightColor,
    highlightColor: globals.kcPrimary_100.withOpacity(0.2),
    hoverColor: globals.lightColor.withOpacity(0.2),
    focusColor: globals.lightColor.withOpacity(0.2),
    disabledColor: globals.darkBG,
    splashColor: globals.kcPrimary_100.withOpacity(0.1),
    canvasColor: globals.darkBG,
    cardTheme: const CardTheme(shadowColor: globals.kcPrimary_100),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: globals.kcPrimary_100,
      cursorColor: globals.darkBG,
      selectionHandleColor: globals.kcPrimary_100,
    ),
    appBarTheme: AppBarTheme(
      color: globals.darkBG,
      elevation: 0,
      shadowColor: globals.kcPrimary_100,
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
          return globals.kcPrimary_100;
        }
        return null;
      }),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      dragHandleColor: globals.kcPrimary_100,
    ),
    radioTheme: RadioThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return globals.kcPrimary_100;
        }
        return null;
      }),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: globals.kcPrimary_100,
      brightness: Brightness.light,
      background: globals.lightBG,
      onBackground: globals.kcPrimary_100,
      surface: globals.lightBG,
      onSurface: globals.kcPrimary_100,
    ),
    switchTheme: SwitchThemeData(
      thumbColor:
          WidgetStateProperty.all(globals.kcPrimary_100), // Uniform thumb color
      trackColor: WidgetStateProperty.all(
        globals.kcPrimary_100.withOpacity(0.5),
      ), // U
      trackOutlineColor:
          WidgetStateProperty.all(globals.softColor.withOpacity(0.15)),
    ),
  );
}
