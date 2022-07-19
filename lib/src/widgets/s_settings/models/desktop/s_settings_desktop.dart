// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:superkit_core/src/widgets/s_settings/models/desktop/appearance_desktop.dart';
import 'package:superkit_core/src/widgets/s_settings/models/desktop/language_desktop.dart';
import 'package:superkit_core/superkit_core.dart';

class superkitSettingsDesktop extends StatefulWidget {
  final dynamic languagePr;
  final dynamic globalPr;
  final dynamic drawerPr;
  final dynamic themePr;
  final String? title;
  final double? height;
  final Color? backgroundColor;
  final bool? hideonTap;
  final bool? enableDrawer;
  final List<Map<String, Object>>? supportedThemes;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const superkitSettingsDesktop(
      {super.key,
      required this.languagePr,
      required this.globalPr,
      this.drawerPr,
      required this.themePr,
      this.title,
      this.height,
      this.backgroundColor,
      this.hideonTap,
      this.enableDrawer,
      this.supportedThemes,
      this.scaffoldKey});

  @override
  State<superkitSettingsDesktop> createState() => _SettingsDesktopDrawerState();
}

class _SettingsDesktopDrawerState extends State<superkitSettingsDesktop> {
  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    //var deviceType = getDeviceType(MediaQuery.of(context).size);
    return Container(
      color: colorChanger(
        context: context,
        dark: kcNeutralColor_100,
        light: Colors.white,
      ),
      width: lang.contains('ar')
          ? screenWidth(context) * 0.45
          : screenWidth(context) * 0.42,
      child: Center(
        child: ListView(
          children: <Widget>[
            verticalSpaceRegular,
            Row(
              children: <Widget>[
                horizontalSpaceRegular,
                SuperKitText.heading3Bold(
                  text: AppLocalizations.of(context)!.translate('settings')!,
                  lang: lang,
                ),
                const Spacer(),
                SuperKitIcon(
                  icon: IconlyBold.closeSquare,
                  tooltip: 'Close',
                  onTap: () {
                    widget.scaffoldKey!.currentState!.closeEndDrawer();
                  },
                ),
              ],
            ),
            AppearanceDesktop(
              sThemes: widget.supportedThemes,
              hideonTap: widget.hideonTap,
              themePr: widget.themePr,
            ),
            LanguageSectionDesktop(
              languageProvider: widget.languagePr,
              globalProvider: widget.globalPr,
              hideonTap: widget.hideonTap,
            ),
          ],
        ),
      ),
    );
  }
}
