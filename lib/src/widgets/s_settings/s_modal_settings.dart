// ignore_for_file: always_specify_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:superkit_core/src/widgets/s_settings/models/mobile/s_settings_mobile.dart';
import 'package:superkit_core/superkit_core.dart';

dynamic superkitSettingsMobile({
  required BuildContext? context,
  required languagePr,
  required globalPr,
  drawerPr,
  required themePr,
  String? title,
  double? height,
  Color? backgroundColor,
  bool? hideonTap,
  required bool? enableDrawer,
  required List<Map<String, Object>>? supportedThemes,
  GlobalKey<ScaffoldState>? scaffoldKey,
}) {
  var deviceType = getDeviceType(MediaQuery.of(context!).size);
  switch (deviceType) {
    case DeviceScreenType.desktop:
      return scaffoldKey!.currentState!.openEndDrawer();
    case DeviceScreenType.tablet:
      return scaffoldKey!.currentState!.openEndDrawer();

    case DeviceScreenType.mobile:
      return superkitSettingsMobileModal(
        context: context,
        languagePr: languagePr,
        globalPr: globalPr,
        drawerPr: drawerPr,
        themePr: themePr,
        title: title,
        height: height,
        backgroundColor: backgroundColor,
        hideonTap: hideonTap,
        enableDrawer: enableDrawer,
        supportedThemes: supportedThemes,
      );
    case DeviceScreenType.Mobile:
      break;
    case DeviceScreenType.Tablet:
      break;
    case DeviceScreenType.Desktop:
      break;
    case DeviceScreenType.Watch:
      break;
    case DeviceScreenType.watch:
      break;
  }
}