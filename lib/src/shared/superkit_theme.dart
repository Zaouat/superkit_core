// Create a custom flex scheme color for a light theme.
/* Here is the explanation for the code above:
1. We have created a custom color scheme for the light theme,
   and a custom color scheme for the dark theme.
2. We use the ThemeData class to create the theme.
3. We use the FlexThemeData class to create the color scheme.
4. We use the FlexSubThemesData class to create a custom subTheme.
5. The subTheme is an extension of the ThemeData class.
   It is where we can add custom colors and other properties.
6. We can use the FlexThemeData class to create a light theme and
   a dark theme.
7. We can use the FlexThemeData class to create a custom theme.
   The custom theme is an extension of the ThemeData class.
   It is where we can add custom colors and other properties.
8. We can use the FlexThemeData class to create a light theme and
   a dark theme.
9. We can use the FlexThemeData class to create a custom theme.
   The custom theme is an extension of the ThemeData class.
   It is where we can add custom colors and other properties.
10. If you do not have a themeMode switch, uncomment this line
   to let the device system mode control the theme mode:
   themeMode: ThemeMode.system, */
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:superkit_core/src/shared/app_colors.dart';

ThemeData superkitLightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: kcPrimary_100_50,
    secondary: Color(0xff36bb91),
    appBarColor: Color(0xff36bb91),
    error: Color(0xffb00020),
  ),
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
ThemeData superkitDarkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: kcPrimary_100_50,
    secondary: Color(0xffff6e48),
    appBarColor: Color(0xffed7f29),
    error: Color(0xffcf6679),
  ),
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
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,




