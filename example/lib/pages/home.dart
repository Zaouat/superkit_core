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

class _MyHomePageState extends State<MyHomePage> {
  int? rating = 3;
  @override
  Widget build(BuildContext context) {
    return Consumer3<LocaleProvider, GlobalProvider, ThemeProvider>(builder: (
      BuildContext context,
      LocaleProvider? appLanguage,
      GlobalProvider? globalProvider,
      ThemeProvider? themeProvider,
      Widget? child,
    ) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SuperKitButton.large(
                  title: 'Open settings',
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
                verticalSpaceLarge,
                const SuperKitLogo.big(
                  size: 220,
                ),
                verticalSpaceLarge,
                verticalSpaceLarge,
                SuperKitText.headlineBold(
                  text: 'How did you find Superkit ?',
                  lang: '',
                  maxLines: 3,
                  align: TextAlign.center,
                ),
                // SizedBox(
                //   width: screenWidth(context) * 0.7,
                //   child: SuperKitCustomSlider.emoji(
                //     emojiValue: rating!.toDouble(),
                //     onEmojiChanged: (val) {
                //       setState(() {
                //         rating = val;
                //       });
                //     },
                //   ),
                // ),
                verticalSpaceLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
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
                // SuperKitLogo.tiny(
                //   svg: devlopa,
                //   color: colorChanger(
                //       context: context,
                //       dark: kcNeutralColor_80,
                //       light: Theme.of(context).primaryColor),
                // ),
                verticalSpaceRegular,
                SuperKitText.bodyBold(text: 'Contact us', lang: ''),
                SuperKitText.captionMedium(
                    text: 'mobiledevlopa@gmail.com', lang: ''),
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
