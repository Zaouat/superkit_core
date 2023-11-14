import 'package:flutter/material.dart';
import 'package:superkit_core/src/widgets/s_settings/models/mobile/appearance.dart';
import 'package:superkit_core/src/widgets/s_settings/models/mobile/drawer_switcher.dart';
import 'package:superkit_core/src/widgets/s_settings/models/mobile/language.dart';
import 'package:superkit_core/superkit_core.dart';

Future<void> superkitSettingsMobileModal({
  required BuildContext? context,
  required languagePr,
  required globalPr,
  drawerPr,
  required themePr,
  String? title,
  double? height,
  Color? backgroundColor,
  bool? hideonTap,
  bool? enableDrawer,
  required List<Map<String, Object>>? supportedThemes,
}) {
  return showModalBottomSheet(
    isScrollControlled: true, // required for min/max child size
    context: context!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        topLeft: Radius.circular(50),
      ),
    ),
    builder: (BuildContext ctx) {
      final String lang = Localizations.localeOf(context).languageCode;
      return ValueListenableBuilder<AdaptiveThemeMode>(
          valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
          builder: (_, Object? mode, Widget? child) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: height ?? MediaQuery.of(context).size.height / 1.5,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  color: backgroundColor ??
                      colorChanger(
                        context: context,
                        dark: kcNeutralColor_100,
                        light: Colors.white,
                      ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: colorChanger(
                        context: context,
                        dark: Theme.of(context).primaryColor.withOpacity(0.08),
                        light: kcAccentColor_40.withOpacity(0.02),
                      ),
                      blurRadius: 12.0,
                      spreadRadius: 1.5,
                    ),
                  ],
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    verticalSpaceSmall,
                    Container(
                      margin: EdgeInsets.only(
                        left: screenWidth(context) / 2.2,
                        right: screenWidth(context) / 2.2,
                      ),
                      height: 3,
                      decoration: BoxDecoration(
                        color: colorChanger(
                          context: context,
                          dark: Theme.of(context).primaryColor,
                          light: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 2,
                          right: 2,
                        ),
                        child: Column(
                          children: <Widget>[
                            verticalSpaceSmall,
                            SuperKitText.heading3Bold(
                              text: title ??
                                  AppLocalizations.of(context)!
                                      .translate('settings')!,
                              lang: lang,
                            ),
                            verticalSpaceRegular,
                            ListView(
                              physics: const BouncingScrollPhysics(),
                              primary: false,
                              shrinkWrap: true,
                              children: <Widget>[
                                Appearance(
                                  sThemes: supportedThemes,
                                  hideonTap: hideonTap,
                                  themePr: themePr,
                                ),
                                LanguageSection(
                                  languageProvider: languagePr,
                                  globalProvider: globalPr,
                                  hideonTap: hideonTap,
                                ),
                                enableDrawer!
                                    ? DrawerSwitcher(
                                        drawers: drawerPr.drawers,
                                        drawerProvider: drawerPr,
                                        defaultDrawer:
                                            drawerPr.getSelectedDrawer,
                                      )
                                    : Container(),
                                verticalSpaceMedium,
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    },
  );
}
