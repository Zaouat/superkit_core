/*
* File : SuperKit Button 
* Version : 1.0.0
* */
import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitButton extends StatelessWidget {
  const SuperKitButton({
    super.key,
    this.title = 'Superkit',
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.icon,
    this.iconSize,
    this.color,
    this.width,
    this.height = 50,
    this.borderRadius = 15,
    this.spacing,
    this.align = TextAlign.center,
    this.font,
    this.fontAr,
    this.fontWeight,
    this.borderWidth = 1.5,
    this.fontSize,
  }) : outline = false;

  const SuperKitButton.small({
    super.key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.icon,
    this.iconSize,
    this.color,
    this.width = 60,
    this.height = 50,
    this.spacing,
    this.borderRadius = 15,
    this.align = TextAlign.center,
    this.font,
    this.fontAr,
    this.fontWeight,
    this.borderWidth = 1.5,
    this.fontSize,
  }) : outline = false;

  const SuperKitButton.medium({
    super.key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.icon,
    this.iconSize,
    this.color,
    this.width = 100,
    this.height = 50,
    this.borderRadius = 15,
    this.spacing,
    this.align = TextAlign.center,
    this.font,
    this.fontAr,
    this.fontWeight,
    this.borderWidth = 1.5,
    this.fontSize,
  }) : outline = false;
  const SuperKitButton.large({
    super.key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.icon,
    this.iconSize,
    this.color,
    this.width = 170,
    this.height = 50,
    this.borderRadius = 15,
    this.spacing,
    this.align = TextAlign.center,
    this.font,
    this.fontAr,
    this.fontWeight,
    this.borderWidth = 1.5,
    this.fontSize,
  }) : outline = false;

  const SuperKitButton.outline({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
    this.iconSize,
    this.color = kcNeutralColor_100,
    this.width,
    this.height = 50,
    this.borderRadius = 15,
    this.spacing,
    this.align = TextAlign.center,
    this.font,
    this.fontAr,
    this.fontWeight,
    this.borderWidth = 1.5,
    this.fontSize,
  })  : disabled = false,
        busy = false,
        outline = true;
  const SuperKitButton.smallOutline({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
    this.iconSize,
    this.color = kcNeutralColor_100,
    this.width = 60,
    this.height = 50,
    this.borderRadius = 15,
    this.spacing,
    this.align = TextAlign.center,
    this.font,
    this.fontAr,
    this.fontWeight,
    this.borderWidth = 1.5,
    this.fontSize,
  })  : disabled = false,
        busy = false,
        outline = true;
  const SuperKitButton.mediumOutline({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
    this.iconSize,
    this.color = kcNeutralColor_100,
    this.width = 100,
    this.height = 50,
    this.borderRadius = 15,
    this.spacing,
    this.align = TextAlign.center,
    this.font,
    this.fontAr,
    this.fontWeight,
    this.borderWidth = 1.5,
    this.fontSize,
  })  : disabled = false,
        busy = false,
        outline = true;
  const SuperKitButton.largeOutline({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
    this.iconSize,
    this.color = kcNeutralColor_100,
    this.width = 170,
    this.height = 50,
    this.borderRadius = 15,
    this.spacing,
    this.align = TextAlign.center,
    this.font,
    this.fontAr,
    this.fontWeight,
    this.borderWidth = 1.5,
    this.fontSize,
  })  : disabled = false,
        busy = false,
        outline = true;

  /// The text to display in the button.
  final String title;

  /// If true, the button will be disabled with a grayed out look.
  final bool disabled;

  /// If true, the button will be displayed as busy with an activity indicator.
  final bool busy;

  /// The callback to be invoked when the button is tapped.
  final void Function()? onTap;

  /// A boolean value that indicates whether the button is outlined.
  final bool outline;

  /// The icon to display in the button.
  final IconData? icon;

  /// The size of the icon to display in the button.
  final double? iconSize;

  /// The color of the button.
  final Color? color;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The border radius of the button.
  final double? borderRadius;

  /// The border width of the button.
  final double? borderWidth;

  /// The alignment of the text in the button.
  final TextAlign align;

  /// The Font of the text in the button.
  final String? font;

  /// The Arabic Font of the text in the button.
  final String? fontAr;

  /// The Font Weight of the text in the button.
  final FontWeight? fontWeight;

  /// The Font Size of the text in the button.
  final double? fontSize;

  final double? spacing;
  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    return ScaleTap(
      onPressed: () {
        onTap!();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius!),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              onTap!();
            },
            child: Container(
              width: width ?? double.infinity,
              height: height,
              alignment: align == TextAlign.center
                  ? Alignment.center
                  : lang.contains('ar')
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
              decoration: !outline
                  ? BoxDecoration(
                      color: !disabled
                          ? color ?? Theme.of(context).primaryColor
                          : color!.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(borderRadius!),
                    )
                  : BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(borderRadius!),
                      border: Border.all(
                        color: color!,
                        width: borderWidth!,
                      ),
                    ),
              child: !busy
                  ? (icon != null)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            //horizontalSpaceSmall,
                            Icon(
                              icon,
                              color: outline
                                  ? color ?? Theme.of(context).primaryColor
                                  : Colors.white,
                              size: iconSize ?? 20,
                            ),
                            if (icon != null) SizedBox(width: spacing ?? 10),
                            Text(
                              title,
                              textAlign: align,
                              style: fontChanger(
                                lang: lang,
                                fontName: font,
                                fontArName: fontAr,
                                fontSize: fontSize ?? 12,
                                fontWeight: fontWeight ?? FontWeight.w500,
                                color: !outline
                                    ? Colors.white
                                    : color ?? Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: align == TextAlign.center
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            if (align != TextAlign.center)
                              const SizedBox(width: 10),
                            Text(
                              title,
                              textAlign: align,
                              style: fontChanger(
                                fontWeight: (fontWeight != null)
                                    ? fontWeight
                                    : !outline
                                        ? FontWeight.w500
                                        : FontWeight.w500,
                                fontName: font,
                                fontArName: fontAr,
                                lang: lang,
                                fontSize: fontSize ?? 12,
                                color: !outline
                                    ? Colors.white
                                    : color ?? Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        )
                  : const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
