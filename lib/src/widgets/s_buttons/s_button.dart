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
    this.isGameButton = false,
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
    this.isGameButton = false,
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
    this.isGameButton = false,
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
    this.isGameButton = false,
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
    this.isGameButton = false,
  }) : disabled = false,
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
    this.isGameButton = false,
  }) : disabled = false,
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
    this.isGameButton = false,
  }) : disabled = false,
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
    this.isGameButton = false,
  }) : disabled = false,
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

  /// If true, render the special "game" style button (rounded slab with
  /// pronounced drop shadow and subtle top highlight) shown in the provided
  /// design. Defaults to false and preserves the existing button appearance.
  final bool isGameButton;

  @override
  State<SuperKitButton> createState() => _SuperKitButtonState();
}

class _SuperKitButtonState extends State<SuperKitButton> {
  late int remainingTime;
  Timer? _timer;
  bool _pressed = false;

  Color darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

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
    final Color btnColor = widget.color ?? Theme.of(context).primaryColor;

    final Widget buttonChild = widget.isGameButton
        ? GestureDetector(
            onTap: widget.busy || widget.disabled || widget.isTimerActive!
                ? null
                : () {
                    if (_pressed) {
                      setState(() {
                        _pressed = false;
                      });
                    }
                    widget.onTap?.call();
                  },
            onTapDown: (_) {
              if (!widget.busy && !widget.disabled && !widget.isTimerActive!) {
                setState(() {
                  _pressed = true;
                });
              }
            },
            onTapCancel: () {
              if (_pressed) {
                setState(() {
                  _pressed = false;
                });
              }
            },
            onTapUp: (_) {
              if (_pressed) {
                Future.delayed(const Duration(milliseconds: 120), () {
                  if (mounted) {
                    setState(() {
                      _pressed = false;
                    });
                  }
                });
              }
            },
            child: SizedBox(
              width: widget.busy
                  ? widget.height
                  : (widget.width ?? double.infinity),
              height: widget.height! + 6, // reduced space for bottom slab
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // bottom slab (3D base) -- darker version of primary color
                  Positioned(
                    top: _pressed ? 3 : 6,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: widget.height,
                      decoration: BoxDecoration(
                        color: darken(btnColor, 0.1),
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 12.0,
                        ),
                        border: Border.all(
                          color: darken(btnColor, 0.12),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),

                  // top button (moves down slightly on press to reveal bottom slab)
                  Positioned(
                    top: _pressed ? 3 : 0,
                    left: 0,
                    right: 0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 120),
                      curve: Curves.easeOut,
                      width: widget.busy
                          ? widget.height
                          : (widget.width ?? double.infinity),
                      height: widget.height,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: btnColor,
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 12.0,
                        ),
                        border: Border.all(
                          color: darken(btnColor, 0.12),
                          width: 1.5,
                        ),
                      ),
                      child: widget.busy
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                strokeCap: StrokeCap.round,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Container(
                              // INNER HIGHLIGHT: Simulated inner border to match game style
                              // slight inset
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  (widget.borderRadius ?? 12.0) - 1.5,
                                ),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 3,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      if (widget.icon != null)
                                        Icon(
                                          widget.icon,
                                          color: widget.outline
                                              ? widget.color ??
                                                    Theme.of(
                                                      context,
                                                    ).primaryColor
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
                                          fontWeight:
                                              widget.fontWeight ??
                                              FontWeight.w500,
                                          color: !widget.outline
                                              ? Colors.white
                                              : widget.color ??
                                                    Theme.of(
                                                      context,
                                                    ).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ), // Closes FittedBox and new Container
                    ),
                  ),
                ],
              ),
            ),
          )
        : Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.busy || widget.disabled || widget.isTimerActive!
                  ? null
                  : widget.onTap,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: widget.busy
                    ? widget.height
                    : (widget.width ?? double.infinity),
                height: widget.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.busy
                      ? btnColor
                      : !widget.outline
                      ? (!widget.disabled && !widget.isTimerActive!
                            ? btnColor
                            : widget.color!.withValues(alpha: 0.45))
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 8.0,
                  ),
                  border: widget.outline && !widget.busy
                      ? Border.all(
                          color: btnColor,
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
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              if (widget.icon != null)
                                Icon(
                                  widget.icon,
                                  color: widget.outline
                                      ? widget.color ??
                                            Theme.of(context).primaryColor
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
                                  fontWeight:
                                      widget.fontWeight ?? FontWeight.w500,
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

    final buttonContent = widget.isGameButton
        ? buttonChild
        : ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius ?? 8.0),
            ),
            child: buttonChild,
          );

    // For game buttons, return content directly (they have custom press animation)
    // For regular buttons, wrap with ScaleTap for scale animation
    return widget.isGameButton
        ? buttonContent
        : ScaleTap(
            onPressed: widget.busy || widget.disabled || widget.isTimerActive!
                ? null
                : () {
                    widget.onTap?.call();
                  },
            child: buttonContent,
          );
  }
}
