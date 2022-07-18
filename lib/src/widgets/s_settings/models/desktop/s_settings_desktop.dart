import 'package:flutter/material.dart';
import 'package:superkit_core/src/widgets/s_settings/models/desktop/appearance_desktop.dart';
import 'package:superkit_core/superkit_core.dart';

class SettingsDesktopDrawer extends StatefulWidget {
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

  const SettingsDesktopDrawer(
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
  State<SettingsDesktopDrawer> createState() => _SettingsDesktopDrawerState();
}

class _SettingsDesktopDrawerState extends State<SettingsDesktopDrawer> {
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
      width: screenWidth(context) * 0.2,
      child: Center(
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: SuperKitIcon(
                icon: IconlyBold.closeSquare,
                tooltip: 'Close',
                onTap: () {
                  widget.scaffoldKey!.currentState!.closeEndDrawer();
                },
              ),
            ),
            verticalSpaceSmall,
            SuperKitText.headlineBold(
              text: AppLocalizations.of(context)!.translate('settings')!,
              lang: lang,
              align: TextAlign.center,
            ),
            AppearanceDesktop(
              sThemes: widget.supportedThemes,
              hideonTap: widget.hideonTap,
              themePr: widget.themePr,
            ),
          ],
        ),
      ),
    );
  }
}
