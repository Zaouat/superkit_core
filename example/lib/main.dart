import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superkit_project/classes/app_config.dart';
import 'package:superkit_project/config/confing.dart';
import 'package:superkit_project/config/themes.dart';
import 'package:superkit_project/db_manager.dart';
import 'package:superkit_project/pages/start.dart';
import 'package:superkit_project/providers/local_provider.dart';
import 'package:superkit_project/providers/multi_provider.dart';
import 'package:superkit_core/superkit_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBManager.init();
  await AppSettingsManager.instance.load();
  await SuperKit.init();
  await SuperKit.getMode();
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
    // AppLocalizations.languages =
    //     context.read<GlobalProvider>().config!.languages;

    /*  If you decide to not use GoRouter then you need to implement this code on SuperKitMaterialApp  
     useGoRouter: false,
     routes: <String, Widget Function(BuildContext)>{
      '/': (BuildContext context) => const =HomeView(),
     },

    */

    return SuperKitMaterialApp(
      title: 'SuperKit',
      // routeInformationParser: router.routeInformationParser,
      // routerDelegate: router.routerDelegate,
      routes: <String, Widget Function(BuildContext)>{
        '/': (BuildContext context) => StartPage(),
      },
      // keynavigator: _navigator,
      // builder: (scontext, child) {
      //   return GestureDetector(
      //     onTap: () => showModalBottomSheet(
      //       context: _navigator.currentContext!,
      //       isScrollControlled: true,
      //       backgroundColor: Colors.white,
      //       builder: (BuildContext context) {
      //         return Container(
      //           height: 200,
      //           color: Colors.red,
      //         );
      //       },
      //     ),
      //     child: child,
      //   );
      //   // return Navigator(
      //   //   onGenerateRoute: (settings) {
      //   //     return MaterialPageRoute(
      //   //       builder: (context) => GestureDetector(
      //   //         onTap: () => showModalBottomSheet(
      //   //           context: context,
      //   //           isScrollControlled: true,
      //   //           backgroundColor: Colors.white,
      //   //           builder: (BuildContext context) {
      //   //             return Container(
      //   //               height: 200,
      //   //               color: Colors.red,
      //   //             );
      //   //           },
      //   //         ),
      //   //         child: child,
      //   //       ),
      //   //     );
      //   //   },
      //   // );
      // },
      defalutThemeMode: AdaptiveThemeMode.light,
      lightTheme: Themes.light,
      darkTheme: Themes.dark,
      useGoRouter: false,
      locale: context.watch<LocaleProvider>().appLocale,
      supportedLocales: DefaultAppData().config.languages.map((LanguageData e) {
        return Locale(
          e.code,
          e.code.toUpperCase(),
        );
      }).toList(),
    );
  }
}
