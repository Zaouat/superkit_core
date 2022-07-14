// Create a custom flex scheme color for a light theme.
// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomThemes {
  final FlexScheme? theme;
  final List<Color>? colors;

  CustomThemes({
    this.theme,
    this.colors,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'theme': theme,
      'colors': colors,
    };
  }

  factory CustomThemes.fromMap(Map<String, dynamic> map) {
    return CustomThemes(
      theme: map['theme'] as FlexScheme,
      colors: List<Color>.from(
        map['colors'],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomThemes.fromJson(Map<String, dynamic> parsedJson) {
    return CustomThemes(
      theme: parsedJson['theme'] as FlexScheme,
      colors: parsedJson['colors'] as List<Color>,
    );
  }
}

// ignore: avoid_classes_with_only_static_members
class CustomTheme {
  static ThemeData setCustomLightTheme({FlexScheme? theme}) {
    ThemeData lightCustomTheme;
    return lightCustomTheme = FlexThemeData.light(
      scheme: theme!,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 17,
      appBarStyle: FlexAppBarStyle.material,
      appBarOpacity: 0.95,
      appBarElevation: 0,
      transparentStatusBar: true,
      tabBarStyle: FlexTabBarStyle.forAppBar,
      tooltipsMatchBackground: true,
      swapColors: false,
      lightIsWhite: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      // To use playground font, add GoogleFonts package and uncomment:
      // fontFamily: GoogleFonts.notoSans().fontFamily,
      subThemesData: const FlexSubThemesData(
        useTextTheme: true,
        fabUseShape: true,
        interactionEffects: true,
        tabBarIndicatorSchemeColor: SchemeColor.primary,
        bottomNavigationBarElevation: 3,
        bottomNavigationBarOpacity: 0.95,
        navigationBarOpacity: 0.95,
        navigationBarMutedUnselectedIcon: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: false,
        blendOnColors: true,
        blendTextTheme: true,
        popupMenuOpacity: 0.95,
      ),
    );

// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
  }

  static ThemeData setCustomDarkTheme({FlexScheme? theme}) {
    ThemeData darkCustomTheme;
    return darkCustomTheme = FlexThemeData.dark(
      scheme: theme,
      surfaceMode: FlexSurfaceMode.custom,
      blendLevel: 17,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.95,
      appBarElevation: 0,
      transparentStatusBar: true,
      tabBarStyle: FlexTabBarStyle.forAppBar,
      tooltipsMatchBackground: true,
      swapColors: false,
      darkIsTrueBlack: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      // To use playground font, add GoogleFonts package and uncomment:
      // fontFamily: GoogleFonts.notoSans().fontFamily,
      subThemesData: const FlexSubThemesData(
        useTextTheme: true,
        fabUseShape: true,
        interactionEffects: true,
        tabBarIndicatorSchemeColor: SchemeColor.primary,
        bottomNavigationBarElevation: 3,
        bottomNavigationBarOpacity: 0.95,
        navigationBarOpacity: 0.95,
        navigationBarMutedUnselectedIcon: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: false,
        blendOnColors: true,
        blendTextTheme: true,
        popupMenuOpacity: 0.95,
      ),
    );
  }

  static changeTheme(
    BuildContext context,
    FlexScheme? theme,
  ) {
    AdaptiveTheme.of(context).setTheme(
      light: CustomTheme.setCustomLightTheme(
        theme: theme,
      ),
      dark: CustomTheme.setCustomDarkTheme(
        theme: theme,
      ),
    );
  }
}
