import 'package:flutter/material.dart';
import 'package:superkit_project/providers/global_provider.dart';
import 'package:superkit_project/providers/local_provider.dart';
import 'package:superkit_project/providers/theme_provider.dart';
import 'package:superkit_core/superkit_core.dart';
import 'package:superkit_project/config/globals.dart' as globals;
import 'package:superkit_project/widgets/content_desktop.dart';
import 'package:superkit_project/widgets/content_mobile.dart';
import 'package:superkit_project/widgets/content_tablet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    // final SingletonFlutterWindow window = WidgetsBinding.instance.window;
    // window.onPlatformBrightnessChanged = () {
    //   final Brightness brightness = window.platformBrightness;
    //   setSystemMode(
    //     context: context,
    //   );
    //   if (mounted) {
    //     setState(() {
    //       changeNavStatusBarsSystem(context: context, brightness: brightness);
    //     });
    //   }
    // };
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      changeNavStatusBarsColor(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    /* -------------------------------------------------------------------------- */
    /*     This step is required to initialize the language code for the app.     */
    /* -------------------------------------------------------------------------- */
    globals.lang = Localizations.localeOf(context).languageCode;
    /* -------------------------------------------------------------------------- */
    //debugPrint(Theme.of(context).primaryColor.toHex());
    return Consumer3<LocaleProvider, GlobalProvider, ThemeProvider>(builder: (
      BuildContext context,
      LocaleProvider? appLanguage,
      GlobalProvider? globalProvider,
      ThemeProvider? themeProvider,
      Widget? child,
    ) {
      return Scaffold(
          backgroundColor: colorChanger(
            context: context,
            dark: Colors.black,
            light: Colors.white,
          ),
          key: scaffoldKey,
          appBar: AppBar(
            toolbarHeight: 85,
            backgroundColor: colorChanger(
              context: context,
              dark: Colors.black,
              light: Colors.white,
            ),
            actions: [
              SuperKitAvatar(
                radius: 25,
                imageSpace: 4,
                image: 'assets/coin.png',
                borderColor: kcVeryLightGreyColor,
                onTap: () {
                  debugPrint("Avatar tapped");
                },
              ),
              SuperKitIcon(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                icon: IconlyBold.setting,
                size: 28,
                tooltip: 'Settings',
                onTap: () {
                  /* -------------  Open Mobile settings Modal  ------------------- */
                  superkitSettingsMobile(
                    context: context,
                    languagePr: appLanguage,
                    languages: globalProvider!.config!.languages,
                    themePr: themeProvider,
                    enableDrawer: false,
                    supportedThemes: globals.supportedThemes,
                    scaffoldKey: scaffoldKey,
                    font: 'Rubik',
                  );
                },
              )
            ],
          ),

          /* ------- You must provide this widget superkitSettingsDesktop 
                        to open the settings on the desktop mode ------- */
          endDrawer: superkitSettingsDesktop(
            languagePr: appLanguage,
            globalPr: globalProvider,
            themePr: themeProvider,
            enableDrawer: false,
            supportedThemes: globals.supportedThemes,
            scaffoldKey: scaffoldKey,
          ),
          body: ScreenTypeLayout.builder(
            breakpoints:
                const ScreenBreakpoints(tablet: 550, desktop: 650, watch: 300),
            mobile: (BuildContext context) => HomeContentMobile(),
            tablet: (BuildContext context) => HomeContentTablet(),
            desktop: (BuildContext context) => HomeContentDesktop(),
            watch: (BuildContext context) => Container(color: Colors.purple),
          )
          // This trailing comma makes auto-formatting nicer for build methods.
          );
    });
  }
}
