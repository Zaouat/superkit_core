import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:superkit_project/pages/home.dart';
import 'package:superkit_project/pages/start.dart';
import 'package:superkit_project/providers/global_provider.dart';
import 'package:superkit_project/providers/local_provider.dart';
import 'package:superkit_project/providers/multi_provider.dart';
import 'package:superkit_project/providers/theme_provider.dart';
import 'package:superkit_core/superkit_core.dart';

void main() async {
  await GetStorage.init();
  SuperKit.init();
  /* Enable the line bellow to set the desktop config */
  // SuperKit.setDesktopConfig();
  runApp(
    /* Wraping your app with MultiProvider here is required for the Language & DarkMode functionalities */
    MultiProvider(
      providers: providers_setup,
      child: MainPage(),
    ),
  );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLocalizations.languages =
        context.read<GlobalProvider>().config!.languages;

    /*  If you decide to not use GoRouter then you need to implement this code on SuperKitMaterialApp  
     useGoRouter: false,
     routes: <String, Widget Function(BuildContext)>{
      '/': (BuildContext context) => const =HomeView(),
     },

    */

    return Consumer<ThemeProvider>(
      builder: (
        BuildContext context,
        ThemeProvider? themePr,
        Widget? child,
      ) {
        return SuperKitMaterialApp(
            title: context.read<GlobalProvider>().config!.appTitle,
            // routeInformationParser: router.routeInformationParser,
            // routerDelegate: router.routerDelegate,
            themeProvider: themePr,
            routes: <String, Widget Function(BuildContext)>{
              '/': (BuildContext context) => StartPage(),
            },
            useGoRouter: false,
            locale: context.watch<LocaleProvider>().appLocale,
            supportedLocales: AppLocalizations.languages
                .map((language) => Locale(language.code)));
      },
    );
  }
}
