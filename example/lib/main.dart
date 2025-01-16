import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superkit_core/superkit_core.dart';
import 'package:superkit_project/config/config.dart';
import 'package:superkit_project/config/globals.dart' as globals;
import 'package:superkit_project/config/themes.dart';
import 'package:superkit_project/data/db_manager.dart';
import 'package:superkit_project/models/app_model.dart';
import 'package:superkit_project/view/home_view.dart';
import 'package:superkit_project/view_model/locale_view_model.dart';

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
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SuperKitMaterialApp(
        title: globals.title,
        routes: <String, Widget Function(BuildContext)>{
          '/': (BuildContext context) => HomePage(),
        },
        defalutThemeMode: AdaptiveThemeMode.light,
        lightTheme: Themes.light,
        darkTheme: Themes.dark,
        useGoRouter: false,
        locale: context.watch<LocaleViewModel>().appLocale,
        supportedLocales:
            DefaultAppData().config.languages.map((LanguageData e) {
          return Locale(
            e.code,
            e.code.toUpperCase(),
          );
        }).toList(),
      ),
    );
  }
}
