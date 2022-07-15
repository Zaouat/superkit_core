// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitMaterialApp extends StatefulWidget {
  /// Creates a Superkit MaterialApp.
  ///
  /// If [lightTheme], [darkTheme], are null, then their SuperKitApp
  /// values will be used. If the corresponding SuperKitApp property is null,
  /// then the default specified in the property's documentation will be used instead.
  ///
  /// The [supportedLocales], [routeInformationParser], and [routerDelegate],are required,
  /// if the [useGoRouter] variable is true, then you must implement it with SuperKitApp.
  ///
  /// If the 'locale' is null then the system's locale value is used.
  /// The value of [Localizations.locale] will equal this locale if it matches one of the [supportedLocales]. Otherwise it will be the first element of [supportedLocales].
  ///
  /// The [routes] variable is required, if the [useGoRouter] variable is false, then it must be a map of go routes.
  ///

  const SuperKitMaterialApp({
    Key? key,
    this.lightTheme,
    this.darkTheme,
    this.title = 'SuperKit',
    this.locale,
    this.useGoRouter = true,
    this.supportedLocales,
    this.routeInformationParser,
    this.routerDelegate,
    this.routes,
    this.initialRoute = '/',
    this.themeProvider,
  }) : super(key: key);

  /// The Light Theme to use for the Material widgets in the app the default is the [superkitLightTheme].
  final ThemeData? lightTheme;

  /// The Dark Theme to use for the Material widgets in the app the default is the [superkitDarkTheme].
  final ThemeData? darkTheme;

  /// Typically a [String] containing a title of the current contents
  /// of the app.
  final String? title;

  /// The initial locale for this app's [Localizations] widget.
  final Locale? locale;

  /// a Bool to determine if [GoRouter] should be used or use the default routes it's true by default.
  final bool? useGoRouter;

  /// A list of locales that the app supports.
  final Iterable<Locale>? supportedLocales;

  /// A function that parses the route information.
  final RouteInformationParser<Object>? routeInformationParser;

  ///
  final RouterDelegate<Object>? routerDelegate;

  /// A map of [String] route names to []s that build [Route]s.
  final Map<String, Widget Function(BuildContext)>? routes;

  /// The initial route of the app.
  final String? initialRoute;

  final dynamic themeProvider;

  @override
  State<SuperKitMaterialApp> createState() => _SuperKitState();
}

class _SuperKitState extends State<SuperKitMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AdaptiveThemeMode?>(
      future: SuperKit.getMode(),
      builder:
          (BuildContext context, AsyncSnapshot<AdaptiveThemeMode?> snapshot) {
        return AdaptiveTheme(
          /* -------------------------------------------------------------------------- */
          /*                        The default theme for the app                       */
          /* -------------------------------------------------------------------------- */
          light: widget.lightTheme ??
              (widget.themeProvider!.getSelectedTheme == FlexScheme.custom
                  ? superkitLightTheme
                  : FlexThemeData.light(
                      scheme: widget.themeProvider!.getSelectedTheme,
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
                    )),
          dark: widget.darkTheme ??
              (widget.themeProvider!.getSelectedTheme == FlexScheme.custom
                  ? superkitDarkTheme
                  : FlexThemeData.dark(
                      scheme: widget.themeProvider!.getSelectedTheme,
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
                    )),
          initial: snapshot.data ?? AdaptiveThemeMode.system,

          /* -------------------------------------------------------------------------- */
          builder: (ThemeData theme, ThemeData darkTheme) => widget.useGoRouter!
              ? MaterialApp.router(
                  routeInformationParser: widget.routeInformationParser!,
                  routerDelegate: widget.routerDelegate!,
                  title: widget.title!,
                  theme: theme,
                  darkTheme: darkTheme,
                  debugShowCheckedModeBanner: false,
                  locale: widget.locale,
                  supportedLocales: widget.supportedLocales!,
                  localizationsDelegates: const <
                      LocalizationsDelegate<dynamic>>[
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    DefaultCupertinoLocalizations.delegate,
                  ],

                  //home: const HomeView(),
                )
              : MaterialApp(
                  title: widget.title!,
                  theme: theme,
                  darkTheme: darkTheme,
                  debugShowCheckedModeBanner: false,
                  locale: widget.locale,
                  routes: widget.routes!,
                  initialRoute: widget.initialRoute,
                  supportedLocales: widget.supportedLocales!,
                  localizationsDelegates: const <
                      LocalizationsDelegate<dynamic>>[
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    DefaultCupertinoLocalizations.delegate,
                  ],
                ),
        );
      },
    );
  }
}
