// ignore_for_file: use_key_in_widget_constructors
/*
* File : SuperKit Logo Widget
* Version : 1.0.0
* */
import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitLogo extends StatelessWidget {
  final double? size;
  final String? logo;
  final Color? color;
  final Function? onTap;

  //----------Tiny Logo--------------//
  const SuperKitLogo.tiny({
    this.size = 32,
    required this.logo,
    this.color,
    this.onTap,
  });

//----------Small Logo --------------//
  const SuperKitLogo.small({
    this.size = 48,
    required this.logo,
    this.color,
    this.onTap,
  });

//----------Medium Logo--------------//
  const SuperKitLogo.medium({
    this.size = 64,
    required this.logo,
    this.color,
    this.onTap,
  });

//----------Big Logo--------------//
  const SuperKitLogo.big({
    this.size = 128,
    required this.logo,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: logo!.contains("<svg")
          ? SvgPicture.string(
              logo!,
              width: size ?? screenWidth(context) / 3,
              height: size ?? screenWidth(context) / 3,
              // color: color,
            )
          : Image.asset(
              logo!,
              width: size ?? screenWidth(context) / 3.5,
              height: size ?? screenWidth(context) / 3.5,
            ),
    );
  }
}
