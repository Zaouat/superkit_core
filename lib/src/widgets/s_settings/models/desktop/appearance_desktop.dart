// ignore_for_file: avoid_dynamic_calls, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class AppearanceDesktop extends StatefulWidget {
  final List<Map<String, Object>>? sThemes;
  final bool? hideonTap;
  final bool? enablethemes;
  final bool? enableDarkMode;
  final dynamic themePr;
  const AppearanceDesktop({
    super.key,
    required this.sThemes,
    this.hideonTap = true,
    this.enablethemes = true,
    this.enableDarkMode = true,
    required this.themePr,
  });

  @override
  _AppearanceState createState() => _AppearanceState();
}

class _AppearanceState extends State<AppearanceDesktop> {
  late Future<List<CustomThemes>> themes;
  @override
  void initState() {
    themes = Future<List<CustomThemes>>.value(
      widget.sThemes!
          .map(
            (Map<String, Object> i) => CustomThemes.fromJson(i),
          )
          .toList(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        horizontalSpaceSmall,
        widget.enableDarkMode!
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  verticalSpaceMedium,
                  SuperKitText.bodySemiBold(
                    text: AppLocalizations.of(context)!.translate('theme')!,
                    lang: lang,
                    align: TextAlign.center,
                  ),
                  verticalSpaceSmall,
                  AppearanceCard(
                    title: AppLocalizations.of(context)!.translate('light'),
                    image: light_cover,
                    selected: AdaptiveTheme.of(context).mode ==
                        AdaptiveThemeMode.light,
                    hideonTap: widget.hideonTap,
                    onTap: () {
                      setLightMode(context: context);
                      changeNavStatusBarsColor(context: context);
                    },
                    height: 80,
                    width: 80,
                    enableDesktopMode: true,
                  ),
                  verticalSpaceSmall,
                  AppearanceCard(
                    title: AppLocalizations.of(context)!.translate('dark'),
                    image: dark_cover,
                    selected: AdaptiveTheme.of(context).mode ==
                        AdaptiveThemeMode.dark,
                    hideonTap: widget.hideonTap,
                    onTap: () {
                      setDarkMode(context: context);
                      changeNavStatusBarsColor(context: context);
                    },
                    height: 80,
                    width: 80,
                    enableDesktopMode: true,
                  ),
                  verticalSpaceSmall,
                  AppearanceCard(
                    title: AppLocalizations.of(context)!.translate('system'),
                    image: system_cover,
                    selected: AdaptiveTheme.of(context).mode ==
                        AdaptiveThemeMode.system,
                    hideonTap: widget.hideonTap,
                    onTap: () {
                      setSystemMode(context: context);
                      changeNavStatusBarsColor(context: context);
                    },
                    height: 80,
                    width: 80,
                    enableDesktopMode: true,
                  ),
                  verticalSpaceRegular,
                ],
              )
            : Container(),
        horizontalSpaceRegular,
        widget.enablethemes!
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  verticalSpaceMedium,
                  SuperKitText.bodySemiBold(
                    text: AppLocalizations.of(context)!
                        .translate('primary-color')!,
                    lang: lang,
                    align: TextAlign.center,
                    maxLines: 2,
                  ),
                  verticalSpaceSmall,
                  SizedBox(
                    width: screenWidth(context) * 0.2,
                    child: FutureBuilder<List<CustomThemes>>(
                      future: themes,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<List<CustomThemes>> snapshot,
                      ) {
                        if (snapshot.hasData) {
                          final List<CustomThemes>? data = snapshot.data;
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 50,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                            itemCount: data!.length,
                            shrinkWrap: true,
                            primary: false,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              /// Check if the default theme is selected
                              if (data[index].theme == FlexScheme.custom) {
                                return colorCardDesktop(
                                  context: context,
                                  lightColor: kcPrimaryColor_50,
                                  darkColor: kcPrimaryColor_50,
                                  hideonTap: widget.hideonTap,
                                  title: 'SuperKit',
                                  onTap: () {
                                    if (mounted) {
                                      setState(() {
                                        widget.themePr.setTheme =
                                            FlexScheme.custom;

                                        AdaptiveTheme.of(context).setTheme(
                                          light: superkitLightTheme,
                                          dark: superkitDarkTheme,
                                        );
                                      });
                                    }
                                  },
                                );
                              } else {
                                return colorCardDesktop(
                                  context: context,
                                  lightColor: data[index].colors![0],
                                  darkColor: data[index].colors![1],
                                  hideonTap: widget.hideonTap,
                                  title: data[index]
                                      .theme
                                      .toString()
                                      .replaceAll('FlexScheme.', ''),
                                  onTap: () {
                                    if (mounted) {
                                      setState(() {
                                        widget.themePr.setTheme =
                                            data[index].theme as FlexScheme;
                                        CustomTheme.changeTheme(
                                          context,
                                          data[index].theme,
                                        );
                                      });
                                    }
                                  },
                                );
                              }
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        // By default show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ],
              )
            : Container(),
        horizontalSpaceSmall,
      ],
    );
  }
}

Widget colorCardDesktop({
  required BuildContext context,
  Color? lightColor,
  Color? darkColor,
  bool? selected,
  bool? hideonTap = true,
  Function? onTap,
  String? title,
}) {
  return ScaleTap(
    onPressed: () {
      if (hideonTap == true) {
        Navigator.pop(context);
      }
      onTap!();
    },
    child: Tooltip(
      message: title,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          color: isDarkMode(context) ? darkColor : lightColor,
        ),
        child: AdaptiveTheme.of(context).theme.primaryColor == lightColor ||
                AdaptiveTheme.of(context).theme.primaryColor == darkColor
            ? Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                    color: kcNeutralColor_90.withOpacity(
                      0.6,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              )
            : Container(),
      ),
    ),
  );
}
