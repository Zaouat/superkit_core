// ignore_for_file: must_be_immutable

/*
* File : SuperKit Button 
* Version : 1.0.1
* */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitButton extends StatefulWidget {
  SuperKitButton({
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
    this.disabledTimer,
    this.isTimerActive = false,
  }) : outline = false;

  SuperKitButton.small({
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
    this.disabledTimer,
    this.isTimerActive = false,
  }) : outline = false;

  SuperKitButton.medium({
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
    this.disabledTimer,
    this.isTimerActive = false,
  }) : outline = false;

  SuperKitButton.large({
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
    this.disabledTimer,
    this.isTimerActive = false,
  }) : outline = false;

  SuperKitButton.outline({
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
    this.disabledTimer,
    this.isTimerActive = false,
  })  : disabled = false,
        busy = false,
        outline = true;

  SuperKitButton.smallOutline({
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
    this.disabledTimer,
    this.isTimerActive = false,
  })  : disabled = false,
        busy = false,
        outline = true;

  SuperKitButton.mediumOutline({
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
    this.disabledTimer,
    this.isTimerActive = false,
  })  : disabled = false,
        busy = false,
        outline = true;

  SuperKitButton.largeOutline({
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
    this.disabledTimer,
    this.isTimerActive = false,
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

  /// The spacing between the icon and text in the button.
  final double? spacing;

  /// The duration in seconds for which the button should remain disabled.
  final int? disabledTimer;

  /// A boolean value that indicates whether the timer is currently active.
  late bool? isTimerActive;

  @override
  State<SuperKitButton> createState() => _SuperKitButtonState();
}

class _SuperKitButtonState extends State<SuperKitButton> {
  late int remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.disabledTimer != null) {
      startDisabledTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startDisabledTimer() {
    setState(() {
      widget.isTimerActive = true;
      remainingTime = widget.disabledTimer!;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (remainingTime > 1) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        if (mounted) {
          setState(() {
            widget.isTimerActive = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    return ScaleTap(
      onPressed: widget.busy || widget.disabled || widget.isTimerActive!
          ? null
          : () {
              widget.onTap?.call();
            },
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius ?? 8.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.busy || widget.disabled || widget.isTimerActive!
                ? null
                : () {
                    widget.onTap?.call();
                  },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: widget.busy
                  ? widget.height
                  : (widget.width ?? double.infinity),
              height: widget.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.busy
                    ? (widget.color ?? Theme.of(context).primaryColor)
                    : !widget.outline
                        ? (!widget.disabled && !widget.isTimerActive!
                            ? widget.color ?? Theme.of(context).primaryColor
                            : widget.color!.withOpacity(0.45))
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
                border: widget.outline && !widget.busy
                    ? Border.all(
                        color: widget.color ?? Theme.of(context).primaryColor,
                        width: widget.borderWidth ?? 1.0,
                      )
                    : null,
              ),
              child: widget.busy
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        strokeCap: StrokeCap.round,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        if (widget.icon != null)
                          Icon(
                            widget.icon,
                            color: widget.outline
                                ? widget.color ?? Theme.of(context).primaryColor
                                : Colors.white,
                            size: widget.iconSize ?? 20,
                          ),
                        if (widget.icon != null)
                          SizedBox(width: widget.spacing ?? 10),
                        Text(
                          widget.isTimerActive!
                              ? "${widget.title} in ${remainingTime}sec"
                              : widget.title,
                          textAlign: widget.align,
                          style: fontChanger(
                            lang: lang,
                            fontName: widget.font,
                            fontArName: widget.fontAr,
                            fontSize: widget.fontSize ?? 12,
                            fontWeight: widget.fontWeight ?? FontWeight.w500,
                            color: !widget.outline
                                ? Colors.white
                                : widget.color ??
                                    Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
