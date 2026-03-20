import 'package:flutter/material.dart';

const _packageFontFamily = 'Poppins';
const _packageArabicFontFamily = 'IBM Plex Sans Arabic';
const _packageName = 'superkit_core';

TextStyle fontChanger({
  final double? fontSize,
  final FontWeight? fontWeight,
  final Color? color,
  final double? fontHeight,
  final String? fontName,
  final String? fontArName,
  final String? lang,
}) {
  final isArabic = lang?.contains('ar') ?? false;
  final family = isArabic
      ? (fontArName ?? _packageArabicFontFamily)
      : (fontName ?? _packageFontFamily);

  return TextStyle(
    fontFamily: family,
    package: (isArabic ? fontArName : fontName) == null ? _packageName : null,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    height: fontHeight,
  );
}
