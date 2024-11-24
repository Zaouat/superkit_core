// ignore_for_file: avoid_classes_with_only_static_members

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:superkit_core/src/shared/screens.dart';
import 'package:superkit_core/src/shared/superkit_theme.dart';
import 'package:superkit_core/src/utils/localizations.dart';
import 'dart:io' show Platform;

import 'package:window_manager/window_manager.dart';

class SuperKit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AdaptiveTheme.getThemeMode();
  }

  static Future<AdaptiveThemeMode?> getMode() async {
    return await AdaptiveTheme.getThemeMode();
  }

  static Future<dynamic> setDesktopConfig({
    String? title = 'Superkit Core',
    Size? initialSize = const Size(650, 720),
    Size? minSize = const Size(650, 720),
    Size? maxSize = const Size(1920, 1080),
  }) async {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      await windowManager.ensureInitialized();
      WindowOptions windowOptions = WindowOptions(
        title: title,
        size: initialSize,
        minimumSize: minSize!,
        maximumSize: maxSize!,
        center: true,
        backgroundColor: Colors.transparent,
        skipTaskbar: false,
        titleBarStyle:
            Device.isMacOS ? TitleBarStyle.hidden : TitleBarStyle.normal,
      );
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
    }
  }
}

class SuperKitMaterialApp extends StatefulWidget {
  /// Creates a Superkit MaterialApp.
  ///
  /// If [lightTheme], [darkTheme], are null, then their SuperKitApp
  /// values will be used. If the corresponding SuperKitApp property is null,
  /// then the default specified in the property's documentation will be used instead.
  ///
  /// The [supportedLocales], [routeInformationParser], and [routerDelegate], are required,
  /// if the [useGoRouter] variable is true, then you must implement it with SuperKitApp.
  ///
  /// If the 'locale' is null then the system's locale value is used.
  /// The value of [Localizations.locale] will equal this locale if it matches one of the [supportedLocales]. Otherwise it will be the first element of [supportedLocales].
  ///
  /// The [routes] variable is required, if the [useGoRouter] variable is false, then it must be a map of go routes.
  ///
  /// [builder] is an optional parameter that wraps the entire application with a custom widget.

  const SuperKitMaterialApp({
    super.key,
    this.lightTheme,
    this.darkTheme,
    this.title = 'SuperKit',
    this.locale,
    this.useGoRouter = true,
    this.routerConfig,
    this.supportedLocales,
    this.routeInformationParser,
    this.routerDelegate,
    this.routes,
    this.initialRoute = '/',
    this.themeProvider,
    this.defalutThemeMode = AdaptiveThemeMode.system,
    this.builder, // Added builder parameter
  });

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

  final RouterConfig<Object>? routerConfig;

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

  final AdaptiveThemeMode? defalutThemeMode;

  /// Optional builder that wraps the entire app
  final Widget Function(BuildContext, Widget)? builder;

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
          initial: snapshot.data ?? widget.defalutThemeMode!,

          /* -------------------------------------------------------------------------- */
          builder: (ThemeData theme, ThemeData darkTheme) {
            Widget app = widget.useGoRouter!
                ? MaterialApp.router(
                    routeInformationParser: widget.routeInformationParser,
                    routerDelegate: widget.routerDelegate,
                    title: widget.title!,
                    theme: theme,
                    darkTheme: darkTheme,
                    routerConfig: widget.routerConfig!,
                    debugShowCheckedModeBanner: false,
                    locale: widget.locale,
                    supportedLocales: widget.supportedLocales!,
                    localizationsDelegates: const <LocalizationsDelegate<
                        dynamic>>[
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                    ],
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
                    localizationsDelegates: const <LocalizationsDelegate<
                        dynamic>>[
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                    ],
                  );

            // Safely wrap the builder
      if (widget.builder != null) {
        // Only wrap the `app` if builder is provided
        app = Builder(
          builder: (innerContext) => widget.builder!(innerContext, app),
        );
      }
            return app;
          },
        );
      },
    );
  }
}
