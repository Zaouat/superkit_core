import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* Here is the explanation for the code above:
1. We have imported the google_fonts package.
2. We have imported the google_fonts.GoogleFonts class.
3. We have used the GoogleFonts class to import the font for the current language.
4. We have used the GoogleFonts class to import the font for the current language.

The code above will be executed for the languages that are supported by the app.

So if we want to support more languages, we need to import the font for that language in the app.

And the code below will import the font for the languages that are not supported by the app. */
TextStyle fontChanger({
  final double? fontSize,
  final FontWeight? fontWeight,
  final Color? color,
  final double? fontHeight,
  final String? fontName,
  final String? fontArName,
  required final String? lang,
}) {
  //final String lang = Localizations.localeOf(context).languageCode;

  if (lang!.contains('ar')) {
    return fontArName != null
        ? GoogleFonts.getFont(
            fontArName,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: fontHeight,
          )
        : GoogleFonts.ibmPlexSansArabic(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: fontHeight,
          );
  } else {
    return fontName != null
        ? GoogleFonts.getFont(
            fontName,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: fontHeight,
          )
        : GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: fontHeight,
          );
  }
}
