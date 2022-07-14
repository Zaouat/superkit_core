// ignore_for_file: avoid_dynamic_calls, prefer_typing_uninitialized_variables, always_specify_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class LanguageSection extends StatefulWidget {
  final languageProvider;
  final globalProvider;
  final bool? hideonTap;

  const LanguageSection({
    Key? key,
    required this.languageProvider,
    required this.globalProvider,
    this.hideonTap = true,
  }) : super(key: key);
  @override
  _LanguageSectionState createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    return Padding(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          verticalSpaceMedium,
          SuperKitText.bodySemiBold(
            text: AppLocalizations.of(context)!.translate('languages')!,
            lang: lang,
          ),
          verticalSpaceSmall,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.globalProvider!.config!.languages!
                .map<Widget>((LanguageData e) {
              return languageRow(
                title: e.title,
                icon: e.flag,
                onTap: () {
                  setState(() {
                    widget.languageProvider!.changeLanguage(
                      languageData: e,
                    );
                  });
                  if (widget.hideonTap == true) {
                    Navigator.pop(context);
                  }
                },
                context: context,
                langCode: e.code,
                lang: lang,
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
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: SvgPicture.asset(
              icon,
              width: screenWidth(context) * 0.12,
            ),
          ),
          const SizedBox(width: 16),
          SuperKitText.captionBold(
            text: AppLocalizations.of(context)!.translate(
              title.toLowerCase(),
            )!,
            lang: lang,
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
