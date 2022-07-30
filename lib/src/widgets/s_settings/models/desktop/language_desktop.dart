// ignore_for_file: avoid_dynamic_calls, prefer_typing_uninitialized_variables, always_specify_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class LanguageSectionDesktop extends StatefulWidget {
  final languageProvider;
  final globalProvider;
  final bool? hideonTap;

  const LanguageSectionDesktop({
    Key? key,
    required this.languageProvider,
    required this.globalProvider,
    this.hideonTap = true,
  }) : super(key: key);
  @override
  _LanguageSectionState createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSectionDesktop> {
  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
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
              return languageRowDesktop(
                title: e.title,
                icon: e.flag,
                onTap: () {
                  if (mounted) {
                    setState(() {
                      widget.languageProvider!.changeLanguage(
                        languageData: e,
                      );
                    });
                  }
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

Widget languageRowDesktop({
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
      minVerticalPadding: 2,
      enableFeedback: true,
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            child: SvgPicture.asset(
              icon,
              width: 40,
            ),
          ),
          horizontalSpaceSmall,
          SuperKitText.captionBold(
            text: AppLocalizations.of(context)!.translate(
              title.toLowerCase(),
            )!,
            lang: lang,
          ),
          const Spacer(),
          if (langCode == lang)
            Container(
              height: 15,
              width: 15,
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
