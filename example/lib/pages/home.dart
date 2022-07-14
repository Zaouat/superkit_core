import 'dart:ui';

import 'package:flutter/Material.dart';
import 'package:starter_project/providers/global_provider.dart';
import 'package:starter_project/providers/local_provider.dart';
import 'package:starter_project/providers/theme_provider.dart';
import 'package:superkit_core/superkit_core.dart';
import 'package:starter_project/config/globals.dart' as globals;

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int? rating = 3;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    final SingletonFlutterWindow window = WidgetsBinding.instance.window;
    window.onPlatformBrightnessChanged = () {
      final Brightness brightness = window.platformBrightness;
      setSystemMode(
        context: context,
      );
      setState(() {
        changeNavStatusBarsSystem(context: context, brightness: brightness);
      });
    };
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
          dark: kcNeutralColor_100,
          light: Colors.white,
        ),
        appBar: AppBar(
            backgroundColor: colorChanger(
              context: context,
              dark: kcNeutralColor_100,
              light: Colors.white,
            ),
            actions: [
              SuperKitIcon(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                icon: IconlyBold.setting,
                onTap: () {
                  superkitSettingsModal(
                    context: context,
                    languagePr: appLanguage,
                    globalPr: globalProvider,
                    themePr: themeProvider,
                    enableDrawer: false,
                    supportedThemes: globals.supportedThemes,
                  );
                },
              ),
            ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                verticalSpaceLarge,
                const SuperKitLogo.big(
                  size: 220,
                ),
                verticalSpaceLarge,
                SuperKitText.headlineBold(
                  text: 'How did you find Superkit ?',
                  lang: globals.lang,
                  maxLines: 3,
                  align: TextAlign.center,
                ),
                SizedBox(
                  width: screenWidth(context) * 0.7,
                  child: SuperKitCustomSlider.emoji(
                    emojiValue: rating!.toDouble(),
                    onEmojiChanged: (val) {
                      setState(() {
                        rating = val;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SuperKitButton(
                          title: 'Send',
                          icon: IconlyBold.send,
                          onTap: () {
                            debugPrint(rating.toString());
                          },
                        ),
                      ),
                      horizontalSpaceRegular,
                      SuperKitIconButton.outline(
                        color: Theme.of(context).primaryColor,
                        icon: Icons.share,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SuperKitLogo.tiny(
                  svg: devlopa_logo,
                  size: 28,
                  color: colorChanger(
                      context: context,
                      dark: kcNeutralColor_70,
                      light: Theme.of(context).primaryColor),
                ),
                verticalSpaceSmall,
                SuperKitText.bodyBold(text: 'Contact us', lang: globals.lang),
                SuperKitText.captionMedium(
                    text: 'mobiledevlopa@gmail.com', lang: globals.lang),
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
