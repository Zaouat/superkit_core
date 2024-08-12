// ignore_for_file: avoid_dynamic_calls, prefer_typing_uninitialized_variables, always_specify_types, library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class LanguageSection extends StatefulWidget {
  final languageProvider;
  final List<LanguageData> languages;
  final bool? hideonTap;
  final String? font;
  final String? fontAr;

  const LanguageSection({
    super.key,
    required this.languageProvider,
    required this.languages,
    this.hideonTap = true,
    this.font,
    this.fontAr,
  });

  @override
  _LanguageSectionState createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;
    final String deviceLang =
        WidgetsBinding.instance.window.locale.languageCode;

    return Padding(
      padding: lang.contains('ar')
          ? const EdgeInsets.only(left: 22, right: 16)
          : const EdgeInsets.only(left: 16, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          verticalSpaceMedium,
          SuperKitText.bodyBold(
            text: AppLocalizations.of(context)!.translate('languages')!,
            lang: lang,
            fontFamily: widget.font,
            fontArFamily: widget.fontAr,
          ),
          verticalSpaceSmall,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.languages.map<Widget>((LanguageData e) {
              return languageRow(
                title: e.title,
                icon: e.flag,
                font: widget.font,
                fontAr: widget.fontAr,
                onTap: () {
                  setState(() {
                    widget.languageProvider!.changeLanguage(languageData: e);
                  });
                  if (widget.hideonTap == true) {
                    Navigator.pop(context);
                  }
                },
                context: context,
                langCode: e.code,
                lang: lang,
                deviceLang: deviceLang, // Pass device language code
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

Widget languageRow({
  required String title,
  required String icon,
  required Function onTap,
  required BuildContext context,
  required String langCode,
  required String lang,
  required String? font,
  required String? fontAr,
  required String deviceLang, // Add deviceLang parameter
}) {
  return ScaleTap(
    onPressed: () {
      onTap();
    },
    child: ListTile(
      minVerticalPadding: 12,
      enableFeedback: true,
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.3),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SvgPicture.asset(
                icon,
                width: screenWidth(context) * 0.1,
              ),
            ),
          ),
          const SizedBox(width: 14),
          SuperKitText.captionBold(
            text: AppLocalizations.of(context)!.translate(
                  title.toLowerCase(),
                )! +
                (langCode == deviceLang
                    ? AppLocalizations.of(context)!.translate('device_default')!
                    : ''),
            lang: lang,
            fontFamily: font,
            fontArFamily: fontAr,
            color: colorChanger(
              context: context,
              dark: Colors.white,
              light: kcNeutralColor_80,
            ),
          ),
          const Spacer(),
          if (langCode == lang)
            Container(
              height: screenWidth(context) / 20,
              width: screenWidth(context) / 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: Theme.of(context).primaryColor,
              ),
              child: Icon(
                Icons.check_rounded,
                color: colorChanger(
                  context: context,
                  dark: kcNeutralColor_100,
                  light: Colors.white,
                ),
                size: 10,
              ),
            )
          else
            Container(),
        ],
      ),
    ),
  );
}
