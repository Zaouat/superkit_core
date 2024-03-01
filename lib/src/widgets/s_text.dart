/*
* File : SuperKit Text Widget
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitText extends StatelessWidget {
  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be resized according
  /// to the specified bounds and if necessary truncated according to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].

  final String text;
  final String? lang;
  final TextStyle? style;
  final TextAlign alignment;
  final Color? color;
  final String? fontFamily;
  final String? fontArFamily;
  final int? maxLines;

  //----------Heading1 style--------------//
  SuperKitText.heading1Light({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 48,
          fontWeight: FontWeight.w100,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.heading1Regular({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 48,
          fontWeight: FontWeight.w200,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.heading1Medium({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 48,
          fontWeight: FontWeight.w300,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.heading1SemiBold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 48,
          fontWeight: FontWeight.w400,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.heading1Bold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

//----------Heading2 style--------------//
  SuperKitText.heading2Light({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 32,
          fontWeight: FontWeight.w100,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;
  SuperKitText.heading2Regular({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 32,
          fontWeight: FontWeight.w200,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.heading2Medium({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.heading2SemiBold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.heading2Bold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

//----------Heading3 style--------------//
  SuperKitText.heading3Light({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 24,
          fontWeight: FontWeight.w100,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.heading3Regular({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 24,
          fontWeight: FontWeight.w200,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.heading3Medium({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 24,
          fontWeight: FontWeight.w300,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.heading3SemiBold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.heading3Bold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

//----------Headline style--------------//
  SuperKitText.headlineLight({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 20,
          fontWeight: FontWeight.w100,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.headlineRegular({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 20,
          fontWeight: FontWeight.w200,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.headlineMedium({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.headlineSemiBold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.headlineBold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  //----------Body style--------------//
  SuperKitText.bodyLight({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 16,
          fontWeight: FontWeight.w100,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.bodyRegular({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 16,
          fontWeight: FontWeight.w200,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.bodyMedium({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.bodySemiBold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.bodyBold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  //----------Caption style--------------//
  SuperKitText.captionLight({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 12,
          fontWeight: FontWeight.w100,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.captionRegular({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 12,
          fontWeight: FontWeight.w200,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.captionMedium({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.captionSemiBold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  SuperKitText.captionBold({
    super.key,
    required this.text,
    required this.lang,
    this.color,
    this.fontFamily,
    this.fontArFamily,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          fontName: fontFamily,
          fontArName: fontArFamily,
          lang: lang,
        ),
        alignment = align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style!.copyWith(
        color: color,
      ),
      textAlign: alignment,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
