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
  final int? maxLines;

  //----------Heading1 style--------------//
  SuperKitText.heading1Light({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 48,
          fontWeight: FontWeight.w100,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.heading1Regular({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 48,
          fontWeight: FontWeight.w200,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.heading1Medium({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 48,
          fontWeight: FontWeight.w300,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.heading1SemiBold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 48,
          fontWeight: FontWeight.w400,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.heading1Bold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

//----------Heading2 style--------------//
  SuperKitText.heading2Light({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 32,
          fontWeight: FontWeight.w100,
          lang: lang,
        ),
        alignment = align,
        super(key: key);
  SuperKitText.heading2Regular({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 32,
          fontWeight: FontWeight.w200,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.heading2Medium({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.heading2SemiBold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.heading2Bold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

//----------Heading3 style--------------//
  SuperKitText.heading3Light({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 24,
          fontWeight: FontWeight.w100,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.heading3Regular({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 24,
          fontWeight: FontWeight.w200,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.heading3Medium({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 24,
          fontWeight: FontWeight.w300,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.heading3SemiBold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.heading3Bold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

//----------Headline style--------------//
  SuperKitText.headlineLight({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 20,
          fontWeight: FontWeight.w100,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.headlineRegular({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 20,
          fontWeight: FontWeight.w200,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.headlineMedium({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.headlineSemiBold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.headlineBold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  //----------Body style--------------//
  SuperKitText.bodyLight({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 16,
          fontWeight: FontWeight.w100,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.bodyRegular({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 16,
          fontWeight: FontWeight.w200,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.bodyMedium({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.bodySemiBold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.bodyBold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  //----------Caption style--------------//
  SuperKitText.captionLight({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 12,
          fontWeight: FontWeight.w100,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.captionRegular({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 12,
          fontWeight: FontWeight.w200,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.captionMedium({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.captionSemiBold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

  SuperKitText.captionBold({
    Key? key,
    required this.text,
    required this.lang,
    this.color,
    this.maxLines,
    TextAlign align = TextAlign.start,
  })  : style = fontChanger(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          lang: lang,
        ),
        alignment = align,
        super(key: key);

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
