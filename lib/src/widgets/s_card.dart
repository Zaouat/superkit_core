/*
* File : SuperKit Card Widget
* Version : 1.0.0
* */
// Copyright 2022 The Superkit Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitCard extends StatelessWidget {
  const SuperKitCard({
    Key? key,
    this.padding,
    this.margin,
    this.color,
    this.borderColor,
    this.borderWidth = 1.5,
    this.radius = 16,
    this.child,
    this.onPressed,
    this.enableShadow = true,
    this.enableScaleAnimation = true,
    this.width = double.infinity,
  }) : super(key: key);

  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final double? radius;
  final bool? enableShadow;
  final VoidCallback? onPressed;
  final bool? enableScaleAnimation;
  final double width;

  @override
  Widget build(BuildContext context) {
    return enableScaleAnimation!
        ? ScaleTap(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: margin ?? EdgeInsets.zero,
                  width: width,
                  decoration: BoxDecoration(
                    color: color ??
                        colorChanger(
                          context: context,
                          dark: kcNeutralColor_100,
                          light: Colors.white,
                        ),
                    borderRadius: BorderRadius.circular(radius!),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: enableShadow!
                            ? colorChanger(
                                context: context,
                                dark: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.07),
                                light: kcNeutralColor_90.withOpacity(0.07),
                              )
                            : Colors.transparent,
                        blurRadius: 12.0,
                        spreadRadius: 0.2,
                      ),
                    ],
                    border: Border.all(
                      color: borderColor ??
                          colorChanger(
                            context: context,
                            dark:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            light: kcNeutralColor_10,
                            // mode: widget.mode!,
                          ),
                      width: borderWidth!,
                    ),
                  ),
                  // width: width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius!),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => onPressed?.call(),
                        child: Container(
                          padding: padding ?? EdgeInsets.zero,
                          // width: width ?? double.infinity,
                          // height: height ?? double.infinity,
                          child: child,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () => onPressed?.call(),
          )
        : Stack(
            children: <Widget>[
              Container(
                margin: margin ?? EdgeInsets.zero,
                width: width,
                decoration: BoxDecoration(
                  color: color ??
                      colorChanger(
                        context: context,
                        dark: kcNeutralColor_100,
                        light: Colors.white,
                      ),
                  borderRadius: BorderRadius.circular(radius!),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: enableShadow!
                          ? colorChanger(
                              context: context,
                              dark: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.07),
                              light: kcNeutralColor_90.withOpacity(0.07),
                            )
                          : Colors.transparent,
                      blurRadius: 12.0,
                      spreadRadius: 0.2,
                    ),
                  ],
                  border: Border.all(
                    color: borderColor ??
                        colorChanger(
                          context: context,
                          dark: Theme.of(context).primaryColor.withOpacity(0.2),
                          light: kcNeutralColor_10,
                          // mode: widget.mode!,
                        ),
                    width: borderWidth!,
                  ),
                ),
                // width: width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius!),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onPressed?.call(),
                      child: Container(
                        padding: padding ?? EdgeInsets.zero,
                        // width: width ?? double.infinity,
                        // height: height ?? double.infinity,
                        child: child,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
