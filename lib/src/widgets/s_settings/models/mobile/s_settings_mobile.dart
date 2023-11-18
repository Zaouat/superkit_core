// import 'package:flutter/material.dart';
// import 'package:superkit_core/src/widgets/s_settings/models/mobile/appearance.dart';
// import 'package:superkit_core/src/widgets/s_settings/models/mobile/drawer_switcher.dart';
// import 'package:superkit_core/src/widgets/s_settings/models/mobile/language.dart';
// import 'package:superkit_core/superkit_core.dart';

// bool notification = true;

// Future<void> superkitSettingsMobileModal({
//   required BuildContext? context,
//   required languagePr,
//   required globalPr,
//   drawerPr,
//   required themePr,
//   String? title,
//   double? height,
//   Color? darkColor,
//   Color? lightColor,
//   bool? hideonTap,
//   bool? enableDrawer,
//   bool? enbalethemes,
//   final Function(bool)? onNotificationChange,
//   bool? enableNotification = true,
//   Widget? widgets,
//   required List<Map<String, Object>>? supportedThemes,
// }) {
//   return showModalBottomSheet(
//     isScrollControlled: true, // required for min/max child size
//     context: context!,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topRight: Radius.circular(50),
//         topLeft: Radius.circular(50),
//       ),
//     ),
//     builder: (BuildContext ctx) {
//       final String lang = Localizations.localeOf(context).languageCode;

//       return ValueListenableBuilder<AdaptiveThemeMode>(
//           valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
//           builder: (_, Object? mode, Widget? child) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 height: height ?? MediaQuery.of(context).size.height / 1.5,
//                 width: screenWidth(context),
//                 decoration: BoxDecoration(
//                   color: colorChanger(
//                     context: context,
//                     dark: darkColor ?? kcNeutralColor_100,
//                     light: lightColor ?? Colors.white,
//                   ),
//                   borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(50),
//                     topLeft: Radius.circular(50),
//                   ),
//                   boxShadow: <BoxShadow>[
//                     BoxShadow(
//                       color: colorChanger(
//                         context: context,
//                         dark: Theme.of(context).primaryColor.withOpacity(0.08),
//                         light: kcAccentColor_40.withOpacity(0.02),
//                       ),
//                       blurRadius: 12.0,
//                       spreadRadius: 1.5,
//                     ),
//                   ],
//                 ),
//                 child: ListView(
//                   physics: const BouncingScrollPhysics(),
//                   children: <Widget>[
//                     verticalSpaceSmall,
//                     Container(
//                       margin: EdgeInsets.only(
//                         left: screenWidth(context) / 2.2,
//                         right: screenWidth(context) / 2.2,
//                       ),
//                       height: 3,
//                       decoration: BoxDecoration(
//                         color: colorChanger(
//                           context: context,
//                           dark: Theme.of(context).primaryColor,
//                           light: Theme.of(context).colorScheme.secondary,
//                         ),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(50)),
//                       ),
//                     ),
//                     Material(
//                       color: Colors.transparent,
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           left: 2,
//                           right: 2,
//                         ),
//                         child: Column(
//                           children: <Widget>[
//                             verticalSpaceSmall,
//                             SuperKitText.heading3Bold(
//                               text: title ??
//                                   AppLocalizations.of(context)!
//                                       .translate('settings')!,
//                               lang: lang,
//                             ),
//                             verticalSpaceRegular,
//                             ListView(
//                               physics: const BouncingScrollPhysics(),
//                               primary: false,
//                               shrinkWrap: true,
//                               children: <Widget>[
//                                 Appearance(
//                                   sThemes: supportedThemes,
//                                   hideonTap: hideonTap,
//                                   themePr: themePr,
//                                   enablethemes: enbalethemes,
//                                 ),
//                                 Visibility(
//                                   visible: enableNotification!,
//                                   child: Padding(
//                                     padding: lang.contains('ar')
//                                         ? const EdgeInsets.only(
//                                             left: 22,
//                                             right: 16,
//                                           )
//                                         : const EdgeInsets.only(
//                                             left: 16,
//                                             right: 22,
//                                           ),
//                                     child: Column(
//                                       children: [
//                                         verticalSpaceSmall,
//                                         Row(
//                                           children: [
//                                             SuperKitText.bodySemiBold(
//                                               text: AppLocalizations.of(
//                                                       context)!
//                                                   .translate(
//                                                       'allow_notifications')!,
//                                               lang: lang,
//                                             ),
//                                             const Spacer(),
//                                             Switch.adaptive(
//                                                 value: notification,
//                                                 onChanged: (bool value) {
//                                                   // mySetState(
//                                                   //   () {
//                                                   //     notification = value;
//                                                   //     onNotificationChange!(
//                                                   //         notification);
//                                                   //   },
//                                                   // );
//                                                 })
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 LanguageSection(
//                                   languageProvider: languagePr,
//                                   globalProvider: globalPr,
//                                   hideonTap: hideonTap,
//                                 ),
//                                 enableDrawer!
//                                     ? DrawerSwitcher(
//                                         drawers: drawerPr.drawers,
//                                         drawerProvider: drawerPr,
//                                         defaultDrawer:
//                                             drawerPr.getSelectedDrawer,
//                                       )
//                                     : Container(),
//                                 verticalSpaceMedium,
//                                 widgets ?? Container(),
//                                 verticalSpaceMedium,
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           });
//     },
//   );
// }

import 'package:flutter/Material.dart';
import 'package:superkit_core/src/widgets/s_settings/models/mobile/appearance.dart';
import 'package:superkit_core/src/widgets/s_settings/models/mobile/drawer_switcher.dart';
import 'package:superkit_core/src/widgets/s_settings/models/mobile/language.dart';
import 'package:superkit_core/superkit_core.dart';

bool notification = true;

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
  Color? darkColor,
  Color? lightColor,
  bool enbalethemes = true,
  final Function(bool)? onNotificationChange,
  bool? enableNotification = true,
  Widget? widgets,
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
      return StatefulBuilder(builder: (cntnx, mySetState) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: height ?? MediaQuery.of(context).size.height / 1.5,
            width: screenWidth(context),
            decoration: BoxDecoration(
              color: colorChanger(
                context: context,
                dark: darkColor ?? kcNeutralColor_100,
                light: lightColor ?? Colors.white,
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
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
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
                              enablethemes: enbalethemes,
                            ),
                            Visibility(
                              visible: enableNotification!,
                              child: Padding(
                                padding: lang.contains('ar')
                                    ? const EdgeInsets.only(
                                        left: 22,
                                        right: 16,
                                      )
                                    : const EdgeInsets.only(
                                        left: 16,
                                        right: 22,
                                      ),
                                child: Column(
                                  children: [
                                    verticalSpaceSmall,
                                    Row(
                                      children: [
                                        SuperKitText.bodySemiBold(
                                          text: AppLocalizations.of(context)!
                                              .translate(
                                                  'allow_notifications')!,
                                          lang: lang,
                                        ),
                                        const Spacer(),
                                        Switch.adaptive(
                                            value: notification,
                                            onChanged: (bool value) {
                                              mySetState(
                                                () {
                                                  notification = value;
                                                  onNotificationChange!(
                                                      notification);
                                                },
                                              );
                                            })
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
                                    defaultDrawer: drawerPr.getSelectedDrawer,
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
