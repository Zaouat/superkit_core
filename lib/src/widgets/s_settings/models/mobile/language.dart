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
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<LanguageData>(
                  borderRadius: BorderRadius.circular(18),
                  isExpanded: true,
                  padding: EdgeInsets.only(
                    top: 4,
                    bottom: 4,
                    right: lang.contains("ar") ? 0 : 6,
                    left: lang.contains("ar") ? 6 : 0,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  value: widget.languages.firstWhere((e) => e.code == lang),
                  items: widget.languages
                      .map<DropdownMenuItem<LanguageData>>((LanguageData e) {
                    return DropdownMenuItem<LanguageData>(
                      value: e,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: SvgPicture.asset(
                                e.flag,
                                width: screenWidth(context) * 0.1,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: SuperKitText.captionBold(
                              text: AppLocalizations.of(context)!.translate(
                                    e.title.toLowerCase(),
                                  )! +
                                  (e.code == deviceLang
                                      ? AppLocalizations.of(context)!
                                          .translate('device_default')!
                                      : ''),
                              lang: lang,
                              fontFamily: widget.font,
                              fontArFamily: widget.fontAr,
                              color: colorChanger(
                                context: context,
                                dark: Colors.white,
                                light: kcNeutralColor_80,
                              ),
                            ),
                          ),
                          // if (e.code == lang)
                          //   Container(
                          //     height: screenWidth(context) / 20,
                          //     width: screenWidth(context) / 20,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(200),
                          //       color: Theme.of(context).primaryColor,
                          //     ),
                          //     child: Icon(
                          //       Icons.check_rounded,
                          //       color: colorChanger(
                          //         context: context,
                          //         dark: kcNeutralColor_100,
                          //         light: Colors.white,
                          //       ),
                          //       size: 10,
                          //     ),
                          //   ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (LanguageData? newValue) {
                    if (newValue != null) {
                      setState(() {
                        widget.languageProvider!
                            .changeLanguage(languageData: newValue);
                      });
                      if (widget.hideonTap == true) {
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
