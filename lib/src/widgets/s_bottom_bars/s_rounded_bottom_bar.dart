// ignore_for_file: use_key_in_widget_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';
import 'dart:io' show Platform;

class SuperKitRoundedBottomBar extends StatelessWidget {
  final Color? backgroundColor;
  final List<SuperKitBottomBarItems> customBottomBarItems;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unselectedFontSize;
  final Color? splashColor;
  final int currentIndex;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType;
  final Function(int) onTap;
  final double selectedFontSize;
  final double selectedIconSize;
  final double unselectedIconSize;
  final LinearGradient? gradient;
  final Radius? radius;
  final double height;

  const SuperKitRoundedBottomBar({
    this.backgroundColor,
    this.selectedColor,
    required this.customBottomBarItems,
    this.unSelectedColor,
    this.unselectedFontSize = 12,
    this.selectedFontSize = 14,
    this.selectedIconSize = 24,
    this.unselectedIconSize = 20,
    this.splashColor,
    this.currentIndex = 0,
    required this.onTap,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.Bottom,
    this.gradient,
    this.radius = const Radius.circular(60),
    this.height = 85,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: radius!,
          topRight: radius!,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colorChanger(
              context: context,
              dark: Theme.of(context).primaryColor.withOpacity(0.12),
              light: kcNeutralColor_90.withOpacity(0.12),
            ),
            blurRadius: 20.0,
            spreadRadius: 1.5,
            offset: const Offset(4.0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: radius!,
          topRight: radius!,
        ),
        child: Container(
          width: double.infinity,
          height: Platform.isIOS ? height + 25 : height,
          decoration: BoxDecoration(
            color: backgroundColor ??
                colorChanger(
                  context: context,
                  dark: kcNeutralColor_100,
                  light: Colors.white,
                ),
            gradient: gradient,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).primaryColor,
                blurRadius: 12.0,
                spreadRadius: 1.5,
                offset: const Offset(3.0, 0),
              ),
            ],
          ),
          padding: const EdgeInsets.only(top: 18),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                for (int i = 0;
                    i < customBottomBarItems.length;
                    i++) ...<Widget>[
                  Expanded(
                    child: SuperKitRoundedBottomNavbarItems(
                      selectedColor: selectedColor,
                      unSelectedColor: unSelectedColor,
                      icon: customBottomBarItems[i].icon,
                      unSelectedFontSize: unselectedFontSize,
                      selectedFontSize: selectedFontSize,
                      unselectedIconSize: unselectedIconSize,
                      selectedIconSize: selectedIconSize,
                      splashColor: splashColor,
                      currentIndex: currentIndex,
                      enableLineIndicator: enableLineIndicator,
                      lineIndicatorWidth: lineIndicatorWidth,
                      indicatorType: indicatorType,
                      index: i,
                      onTap: onTap,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuperKitRoundedBottomBarItems {
  final IconData icon;
  final String label;

  SuperKitRoundedBottomBarItems({
    required this.icon,
    required this.label,
  });
}

class SuperKitRoundedBottomNavbarItems extends StatelessWidget {
  final IconData? icon;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unSelectedFontSize;
  final double selectedIconSize;
  final double unselectedIconSize;

  final double selectedFontSize;
  final Color? splashColor;
  final int? currentIndex;
  final int index;
  final Function(int) onTap;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType;

  const SuperKitRoundedBottomNavbarItems({
    this.icon,
    this.selectedColor,
    this.unSelectedColor,
    this.unSelectedFontSize = 11,
    this.selectedFontSize = 12,
    this.selectedIconSize = 20,
    this.unselectedIconSize = 15,
    this.splashColor,
    this.currentIndex,
    required this.onTap,
    required this.index,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.Top,
  });

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme =
        BottomNavigationBarTheme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: splashColor ?? Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              onTap(index);
            },
            child: Container(
              decoration: const BoxDecoration(

                  // border: enableLineIndicator
                  //     ? Border(
                  //         bottom: indicatorType == IndicatorType.Bottom
                  //             ? BorderSide(
                  //                 color: currentIndex == index
                  //                     ? selectedColor ??
                  //                         Theme.of(context).primaryColor
                  //                     : Colors.transparent,
                  //                 width: lineIndicatorWidth,
                  //               )
                  //             : const BorderSide(color: Colors.transparent),
                  //         top: indicatorType == IndicatorType.Top
                  //             ? BorderSide(
                  //                 color: currentIndex == index
                  //                     ? selectedColor ??
                  //                         Theme.of(context).primaryColor
                  //                     : Colors.transparent,
                  //                 width: lineIndicatorWidth,
                  //               )
                  //             : const BorderSide(color: Colors.transparent),
                  //       )
                  //     : null,
                  ),
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    icon,
                    size: currentIndex == index
                        ? selectedIconSize
                        : unselectedIconSize,
                    color: currentIndex == index
                        ? selectedColor ?? bottomTheme.unselectedItemColor
                        : unSelectedColor ?? kcNeutralColor_60,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: currentIndex == index
                        ? selectedColor ??
                            Theme.of(context).colorScheme.secondary
                        : Colors.transparent,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
