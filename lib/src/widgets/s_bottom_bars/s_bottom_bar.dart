// ignore_for_file: use_key_in_widget_constructors, constant_identifier_names
/*
* File : SuperKit BottomBar 
* Version : 1.0.0
* */
import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

enum IndicatorType { Top, Bottom }

class SuperKitBottomBar extends StatelessWidget {
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

  const SuperKitBottomBar({
    this.backgroundColor,
    this.selectedColor,
    required this.customBottomBarItems,
    this.unSelectedColor,
    this.unselectedFontSize = 12,
    this.selectedFontSize = 14,
    this.selectedIconSize = 20,
    this.unselectedIconSize = 18,
    this.splashColor,
    this.currentIndex = 0,
    required this.onTap,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.Top,
    this.gradient,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ??
            colorChanger(
              context: context,
              dark: kcNeutralColor_100,
              light: Colors.white,
              // mode: widget.mode!,
            ),
        gradient: gradient,
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            for (int i = 0; i < customBottomBarItems.length; i++) ...<Widget>[
              Expanded(
                child: SuperKitBottomNavbarItems(
                  selectedColor: selectedColor,
                  unSelectedColor: unSelectedColor,
                  icon: customBottomBarItems[i].icon,
                  label: customBottomBarItems[i].label,
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
    );
  }
}

class SuperKitBottomBarItems {
  final IconData icon;
  final String label;

  SuperKitBottomBarItems({
    required this.icon,
    required this.label,
  });
}

class SuperKitBottomNavbarItems extends StatelessWidget {
  final IconData? icon;
  final String? label;
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

  const SuperKitBottomNavbarItems({
    this.icon,
    this.label,
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
    final String lang = Localizations.localeOf(context).languageCode;

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
              decoration: BoxDecoration(
                border: enableLineIndicator
                    ? Border(
                        bottom: indicatorType == IndicatorType.Bottom
                            ? BorderSide(
                                color: currentIndex == index
                                    ? selectedColor ??
                                        Theme.of(context).primaryColor
                                    : Colors.transparent,
                                width: lineIndicatorWidth,
                              )
                            : const BorderSide(color: Colors.transparent),
                        top: indicatorType == IndicatorType.Top
                            ? BorderSide(
                                color: currentIndex == index
                                    ? selectedColor ??
                                        Theme.of(context).primaryColor
                                    : Colors.transparent,
                                width: lineIndicatorWidth,
                              )
                            : const BorderSide(color: Colors.transparent),
                      )
                    : null,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
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
                    height: 5.0,
                  ),
                  Text('$label',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: fontChanger(
                        lang: lang,
                        fontSize: currentIndex == index
                            ? selectedFontSize
                            : unSelectedFontSize,
                        color: currentIndex == index
                            ? selectedColor ?? bottomTheme.unselectedItemColor
                            : unSelectedColor ?? kcNeutralColor_60,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
