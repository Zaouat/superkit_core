// // ignore_for_file: always_specify_types, deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:superkit_core/src/widgets/s_settings/models/mobile/s_settings_mobile.dart';
// import 'package:superkit_core/superkit_core.dart';

// dynamic superkitSettingsMobile({
//   required BuildContext? context,
//   required languagePr,
//   required List<LanguageData> languages,
//   drawerPr,
//   themePr,
//   String? title,
//   double? height,
//   Color? darkColor,
//   Color? lightColor,
//   bool? hideonTap,
//   required bool? enableDrawer,
//   bool? enbalethemes = true,
//   required List<Map<String, Object>>? supportedThemes,
//   GlobalKey<ScaffoldState>? scaffoldKey,
//   bool? enableNotificationSection = true,
//   bool? enableAccountOverview = false,
//   Widget? widgets,
//   Function(bool)? onChange,
//   Function(bool)? onAccountOverviewChange,
//   String? font,
//   String? fontAr,
//   bool? notificationValue,
//   bool accountOverviewValue = false,
// }) {
//   var deviceType = getDeviceType(MediaQuery.of(context!).size);
//   switch (deviceType) {
//     case DeviceScreenType.desktop:
//       return scaffoldKey!.currentState!.openEndDrawer();
//     case DeviceScreenType.tablet:
//       return scaffoldKey!.currentState!.openEndDrawer();

//     case DeviceScreenType.mobile:
//       return superkitSettingsMobileModal(
//         context: context,
//         languagePr: languagePr,
//         languages: languages,
//         drawerPr: drawerPr,
//         themePr: themePr,
//         title: title,
//         height: height,
//         hideonTap: hideonTap,
//         enableDrawer: enableDrawer,
//         lightColor: lightColor,
//         darkColor: darkColor,
//         supportedThemes: supportedThemes,
//         enbalethemes: enbalethemes!,
//         onNotificationChange: (bool val) => onChange!(val),
//         onAccountOverviewChange: (bool val) => onAccountOverviewChange!(val),
//         widgets: widgets,
//         enableNotification: enableNotificationSection!,
//         enableAccountOverview: enableAccountOverview!,
//         font: font,
//         fontAr: fontAr,
//         notificationValue: notificationValue!,
//         accountOverviewValue: accountOverviewValue,
//       );
//     case DeviceScreenType.Mobile:
//       break;
//     case DeviceScreenType.Tablet:
//       break;
//     case DeviceScreenType.Desktop:
//       break;
//     case DeviceScreenType.Watch:
//       break;
//     case DeviceScreenType.watch:
//       break;
//   }
// }
