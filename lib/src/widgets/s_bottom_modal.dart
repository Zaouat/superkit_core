import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

Future<void> superKitBottomModal({
  required BuildContext? context,
  String? title,
  Widget? content,
  double? height,
  Color? backgroundColor,
}) {
  //final String lang = Localizations.localeOf(context!).languageCode;

  return showModalBottomSheet(
    isScrollControlled: true, // required for min/max child size
    context: context!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        topLeft: Radius.circular(50),
      ),
    ),
    builder: (BuildContext ctx) {
      final String lang = Localizations.localeOf(context).languageCode;

      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: height,
          width: screenWidth(context),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: colorChanger(
                  context: context,
                  dark: Theme.of(context).primaryColor.withOpacity(0.08),
                  light: kcAccentColor_40.withOpacity(0.02),
                ),
                blurRadius: 12.0,
                spreadRadius: 1.5,
              ),
            ],
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              verticalSpaceSmall,
              Container(
                margin: EdgeInsets.only(
                  left: screenWidth(context) / 2.2,
                  right: screenWidth(context) / 2.2,
                ),
                height: 3,
                decoration: BoxDecoration(
                  color: colorChanger(
                    context: context,
                    dark: Theme.of(context).primaryColor,
                    light: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 2,
                    right: 2,
                  ),
                  child: Column(
                    children: <Widget>[
                      verticalSpaceSmall,
                      SuperKitText.heading3Bold(
                        text: title!,
                        lang: lang,
                      ),
                      verticalSpaceRegular,
                      content!,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
