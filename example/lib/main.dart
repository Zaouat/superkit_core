import 'package:flutter/material.dart';
import 'package:superkit_project/providers/global_provider.dart';
import 'package:superkit_project/providers/local_provider.dart';
import 'package:superkit_project/providers/multi_provider.dart';
import 'package:superkit_project/providers/theme_provider.dart';
import 'package:superkit_project/routes/routes.dart';
import 'package:superkit_core/superkit_core.dart';

void main() async {
  await GetStorage.init();
  SuperKit.init();
  /* Enable the line bellow to set the desktop config */
  SuperKit.setDesktopConfig();
  runApp(
    /* Wraping your app with MultiProvider here is required for the Language & DarkMode functionalities */
    MultiProvider(
      providers: providers_setup,
      child: MediaQuery(
        data: const MediaQueryData(),
        child: MainPage(),
      ),
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
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          themeProvider: themePr,
          locale: context.watch<LocaleProvider>().appLocale,
          supportedLocales: context
              .read<GlobalProvider>()
              .config!
              .languages!
              .map((LanguageData e) {
            return Locale(
              e.code,
              e.code.toUpperCase(),
            );
          }).toList(),
        );
      },
    );
  }
}
