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

import 'package:flutter/material.dart';
import 'package:superkit_core/src/widgets/s_settings/models/mobile/appearance.dart';
import 'package:superkit_core/src/widgets/s_settings/models/mobile/drawer_switcher.dart';
import 'package:superkit_core/src/widgets/s_settings/models/mobile/language.dart';
import 'package:superkit_core/superkit_core.dart';

Future<void> superkitSettingsMobileModal({
  required BuildContext? context,
  required languagePr,
  required List<LanguageData> languages,
  drawerPr,
  dynamic themePr,
  String? title,
  double? height,
  Color? backgroundColor,
  bool? hideonTap,
  bool? enableDrawer,
  required List<Map<String, Object>>? supportedThemes,
  Color? darkColor,
  Color? lightColor,
  bool? enbalethemes,
  final Function(bool)? onNotificationChange,
  final Function(bool)? onAccountOverviewChange,
  bool? enableNotification,
  bool? enableAccountOverview,
  Widget? widgets,
  required String? font,
  required String? fontAr,
  required bool notificationValue,
  required bool accountOverviewValue,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context!,
    backgroundColor: Colors.transparent,
    // constraints: BoxConstraints(minHeight: screenHeight(context) * 0.5),
    builder: (BuildContext ctx) {
      final String lang = Localizations.localeOf(context).languageCode;
      return ValueListenableBuilder<AdaptiveThemeMode>(
          valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
          builder: (BuildContext? ctnxs, Object? mode, Widget? child) {
            return StatefulBuilder(builder: (cntx, mySetState) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: SuperKitCard(
                  radius: 22.0,
                  color: colorChanger(
                    context: context,
                    dark: darkColor ?? kcNeutralColor_100,
                    light: lightColor ?? Colors.white,
                  ),
                  margin: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                    bottom: 28,
                  ),
                  borderColor: colorChanger(
                    context: context,
                    dark: const Color(0xffA7AABD).withOpacity(.2),
                    light: const Color(0xffA7AABD).withOpacity(.7),
                  ),
                  borderWidth: 2,
                  enableShadow: true,
                  enableScaleAnimation: false,
                  // height: height ?? MediaQuery.of(context).size.height / 1.5,
                  // width: screenWidth(context),
                  // decoration: BoxDecoration(
                  //   color: colorChanger(
                  //     context: context,
                  //     dark: darkColor ?? kcNeutralColor_100,
                  //     light: lightColor ?? Colors.white,
                  //   ),
                  //   borderRadius: const BorderRadius.only(
                  //     topRight: Radius.circular(50),
                  //     topLeft: Radius.circular(50),
                  //   ),
                  //   boxShadow: <BoxShadow>[
                  //     BoxShadow(
                  //       color: colorChanger(
                  //         context: context,
                  //         dark:
                  //             Theme.of(context).primaryColor.withOpacity(0.08),
                  //         light: kcAccentColor_40.withOpacity(0.02),
                  //       ),
                  //       blurRadius: 12.0,
                  //       spreadRadius: 1.5,
                  //     ),
                  //   ],
                  // ),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      verticalSpaceSmall,
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 3,
                          width: screenWidth(context) * 0.1,
                          decoration: BoxDecoration(
                            color: colorChanger(
                              context: context,
                              dark: Theme.of(context).primaryColor,
                              light: Theme.of(context).colorScheme.secondary,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
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
                                fontFamily: font,
                                fontArFamily: fontAr,
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
                                    enablethemes: enbalethemes!,
                                    font: font,
                                    fontAr: fontAr,
                                  ),
                                  enableNotification!
                                      ? Padding(
                                          padding: lang.contains('ar')
                                              ? const EdgeInsets.only(
                                                  left: 16,
                                                  right: 16,
                                                )
                                              : const EdgeInsets.only(
                                                  left: 16,
                                                  right: 16,
                                                ),
                                          child: Column(
                                            children: [
                                              verticalSpaceSmall,
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) *
                                                            0.61,
                                                    child:
                                                        SuperKitText.bodyBold(
                                                      text: AppLocalizations.of(
                                                              context)!
                                                          .translate(
                                                              'allow_notifications')!,
                                                      lang: lang,
                                                      fontFamily: font,
                                                      maxLines: 3,
                                                      fontArFamily: fontAr,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Switch.adaptive(
                                                    value: notificationValue,
                                                    onChanged: (bool value) {
                                                      mySetState(
                                                        () {
                                                          notificationValue =
                                                              value;
                                                          onNotificationChange!(
                                                              notificationValue);
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  enableAccountOverview!
                                      ? Padding(
                                          padding: lang.contains('ar')
                                              ? const EdgeInsets.only(
                                                  left: 16,
                                                  right: 16,
                                                )
                                              : const EdgeInsets.only(
                                                  left: 16,
                                                  right: 16,
                                                ),
                                          child: Column(
                                            children: [
                                              verticalSpaceSmall,
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) *
                                                            0.61,
                                                    child:
                                                        SuperKitText.bodyBold(
                                                      text: AppLocalizations.of(
                                                              context)!
                                                          .translate(
                                                              'allow_account_overview')!,
                                                      lang: lang,
                                                      fontFamily: font,
                                                      maxLines: 3,
                                                      fontArFamily: fontAr,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Switch.adaptive(
                                                    value: accountOverviewValue,
                                                    onChanged: (bool value) {
                                                      mySetState(
                                                        () {
                                                          accountOverviewValue =
                                                              value;
                                                          onAccountOverviewChange!(
                                                              accountOverviewValue);
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  LanguageSection(
                                    languageProvider: languagePr,
                                    languages: languages,
                                    hideonTap: hideonTap,
                                    font: font,
                                    fontAr: fontAr,
                                  ),
                                  enableDrawer!
                                      ? DrawerSwitcher(
                                          drawers: drawerPr.drawers,
                                          drawerProvider: drawerPr,
                                          defaultDrawer:
                                              drawerPr.getSelectedDrawer,
                                        )
                                      : Container(),
                                  widgets ?? Container(),
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
          });
    },
  );
}
