// // ignore_for_file: camel_case_types

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:superkit_core/src/widgets/s_settings/models/desktop/appearance_desktop.dart';
// import 'package:superkit_core/src/widgets/s_settings/models/desktop/language_desktop.dart';
// import 'package:superkit_core/superkit_core.dart';

// class superkitSettingsDesktop extends StatefulWidget {
//   final dynamic languagePr;
//   final dynamic globalPr;
//   final dynamic drawerPr;
//   final dynamic themePr;
//   final String? title;
//   final double? height;
//   final Color? backgroundColor;
//   final bool? hideonTap;
//   final bool? enableDrawer;
//   final List<Map<String, Object>>? supportedThemes;
//   final GlobalKey<ScaffoldState>? scaffoldKey;

//   const superkitSettingsDesktop(
//       {super.key,
//       required this.languagePr,
//       required this.globalPr,
//       this.drawerPr,
//       required this.themePr,
//       this.title,
//       this.height,
//       this.backgroundColor,
//       this.hideonTap,
//       this.enableDrawer,
//       this.supportedThemes,
//       this.scaffoldKey});

//   @override
//   State<superkitSettingsDesktop> createState() => _SettingsDesktopDrawerState();
// }

// class _SettingsDesktopDrawerState extends State<superkitSettingsDesktop> {
//   @override
//   Widget build(BuildContext context) {
//     final String lang = Localizations.localeOf(context).languageCode;
//     return ScreenTypeLayout.builder(
//       breakpoints:
//           const ScreenBreakpoints(tablet: 550, desktop: 750, watch: 300),
//       mobile: (BuildContext context) => Container(),
//       tablet: (BuildContext context) => Container(
//         color: colorChanger(
//           context: context,
//           dark: kcNeutralColor_100,
//           light: Colors.white,
//         ),
//         width: lang.contains('ar')
//             ? screenWidth(context) * 0.45
//             : screenWidth(context) * 0.42,
//         child: Center(
//           child: ListView(
//             physics: const BouncingScrollPhysics(),
//             children: <Widget>[
//               verticalSpaceRegular,
//               // Settings Drawer Header
//               Row(
//                 children: <Widget>[
//                   horizontalSpaceRegular,
//                   SuperKitText.heading3Bold(
//                     text: AppLocalizations.of(context)!.translate('settings')!,
//                     lang: lang,
//                   ),
//                   const Spacer(),
//                   SuperKitIcon(
//                     icon: IconlyBold.closeSquare,
//                     tooltip: 'Close',
//                     onTap: () {
//                       widget.scaffoldKey!.currentState!.closeEndDrawer();
//                     },
//                   ),
//                 ],
//               ),
//               verticalSpaceLarge,

//               InkWell(
//                 onTap: () {},
//                 child: ScaleTap(
//                   onPressed: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         horizontalSpaceRegular,
//                         const Icon(
//                           FontAwesomeIcons.layerGroup,
//                           size: 14,
//                         ),
//                         horizontalSpaceSmall,
//                         SuperKitText.bodySemiBold(
//                           text: 'Widgets',
//                           lang: lang,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SuperKitDivider.lightDivider(),
//               InkWell(
//                 onTap: () {},
//                 child: ScaleTap(
//                   onPressed: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         horizontalSpaceRegular,
//                         const Icon(
//                           IconlyBold.paper,
//                           size: 16,
//                         ),
//                         horizontalSpaceSmall,
//                         SuperKitText.bodySemiBold(
//                           text: 'Change log',
//                           lang: lang,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SuperKitDivider.lightDivider(),
//               InkWell(
//                 onTap: () {},
//                 child: ScaleTap(
//                   onPressed: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         horizontalSpaceRegular,
//                         const Icon(
//                           IconlyBold.document,
//                           size: 16,
//                         ),
//                         horizontalSpaceSmall,
//                         SuperKitText.bodySemiBold(
//                           text: 'Documentation',
//                           lang: lang,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SuperKitDivider.lightDivider(),
//               InkWell(
//                 onTap: () {},
//                 child: ScaleTap(
//                   onPressed: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         horizontalSpaceRegular,
//                         const Icon(
//                           IconlyBold.buy,
//                           size: 16,
//                         ),
//                         horizontalSpaceSmall,
//                         SuperKitText.bodySemiBold(
//                           text: 'Get the paid version',
//                           lang: lang,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               AppearanceDesktop(
//                 sThemes: widget.supportedThemes,
//                 hideonTap: widget.hideonTap,
//                 themePr: widget.themePr,
//               ),
//               LanguageSectionDesktop(
//                 languageProvider: widget.languagePr,
//                 globalProvider: widget.globalPr,
//                 hideonTap: widget.hideonTap,
//               ),
//             ],
//           ),
//         ),
//       ),
//       desktop: (BuildContext context) => Container(
//         color: colorChanger(
//           context: context,
//           dark: kcNeutralColor_100,
//           light: Colors.white,
//         ),
//         width: lang.contains('ar')
//             ? screenWidth(context) * 0.33
//             : screenWidth(context) * 0.3,
//         child: Center(
//           child: ListView(
//             physics: const BouncingScrollPhysics(),
//             children: <Widget>[
//               verticalSpaceRegular,
//               // Settings Drawer Header
//               Row(
//                 children: <Widget>[
//                   horizontalSpaceRegular,
//                   SuperKitText.heading3Bold(
//                     text: AppLocalizations.of(context)!.translate('settings')!,
//                     lang: lang,
//                   ),
//                   const Spacer(),
//                   SuperKitIcon(
//                     icon: IconlyBold.closeSquare,
//                     tooltip: 'Close',
//                     onTap: () {
//                       widget.scaffoldKey!.currentState!.closeEndDrawer();
//                     },
//                   ),
//                 ],
//               ),
//               verticalSpaceLarge,

//               InkWell(
//                 onTap: () {},
//                 child: ScaleTap(
//                   onPressed: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         horizontalSpaceRegular,
//                         const Icon(
//                           FontAwesomeIcons.layerGroup,
//                           size: 14,
//                         ),
//                         horizontalSpaceSmall,
//                         SuperKitText.bodySemiBold(
//                           text: 'Widgets',
//                           lang: lang,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SuperKitDivider.lightDivider(),
//               InkWell(
//                 onTap: () {},
//                 child: ScaleTap(
//                   onPressed: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         horizontalSpaceRegular,
//                         const Icon(
//                           IconlyBold.paper,
//                           size: 16,
//                         ),
//                         horizontalSpaceSmall,
//                         SuperKitText.bodySemiBold(
//                           text: 'Change log',
//                           lang: lang,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SuperKitDivider.lightDivider(),
//               InkWell(
//                 onTap: () {},
//                 child: ScaleTap(
//                   onPressed: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         horizontalSpaceRegular,
//                         const Icon(
//                           IconlyBold.document,
//                           size: 16,
//                         ),
//                         horizontalSpaceSmall,
//                         SuperKitText.bodySemiBold(
//                           text: 'Documentation',
//                           lang: lang,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SuperKitDivider.lightDivider(),
//               InkWell(
//                 onTap: () {},
//                 child: ScaleTap(
//                   onPressed: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         horizontalSpaceRegular,
//                         const Icon(
//                           IconlyBold.buy,
//                           size: 16,
//                         ),
//                         horizontalSpaceSmall,
//                         SuperKitText.bodySemiBold(
//                           text: 'Get the paid version',
//                           lang: lang,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               AppearanceDesktop(
//                 sThemes: widget.supportedThemes,
//                 hideonTap: widget.hideonTap,
//                 themePr: widget.themePr,
//               ),
//               LanguageSectionDesktop(
//                 languageProvider: widget.languagePr,
//                 globalProvider: widget.globalPr,
//                 hideonTap: widget.hideonTap,
//               ),
//             ],
//           ),
//         ),
//       ),
//       watch: (BuildContext context) => Container(color: Colors.purple),
//     );
//     //var deviceType = getDeviceType(MediaQuery.of(context).size);
//   }
// }
