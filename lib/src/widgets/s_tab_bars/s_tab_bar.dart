// ignore_for_file: unrelated_type_equality_checks

/*
* File : SuperKit Tab Bar 
* Version : 1.0.0
* */
import 'package:flutter/material.dart';
import 'package:superkit_core/src/widgets/s_tab_bars/indicators/dot_indicator.dart';
import 'package:superkit_core/src/widgets/s_tab_bars/indicators/material_indicator.dart';
import 'package:superkit_core/src/widgets/s_tab_bars/indicators/rectangular_indicator.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitTabBar extends StatefulWidget {
  const SuperKitTabBar({
    super.key,
    this.indicator = Indicator.rectangular,
    required this.tabs,
    this.tabsWidgets,
    this.height = 45,
    this.enableShadow = true,
    this.initialIndex = 0,
    this.tabController,
    this.tabColor,
    this.indicatorColor,
    this.enableAppbarGradient = false,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
    required this.onTabChange,
  });

  /// Indicator type of the tab bar [Indicators.rectangular] by default.
  final Indicator? indicator;

  /// List of tabs to be displayed.
  final List<Widget>? tabs;

  final List<Widget>? tabsWidgets;

  /// Height of the tab bar 45 by default.
  final double? height;

  /// Enable shadow of the tab bar.
  final bool? enableShadow;

  /// Initial index of the tab bar.
  final int? initialIndex;

  /// Tab controller of the tab bar.
  final TabController? tabController;

  /// Color of the tab bar.
  final Color? tabColor;

  final bool enableAppbarGradient;

  final TextStyle selectedTextStyle;

  final TextStyle unSelectedTextStyle;

  final Color? indicatorColor;

  final Function(int) onTabChange;

  @override
  State<SuperKitTabBar> createState() => _SuperKitTabBarState();
}

class _SuperKitTabBarState extends State<SuperKitTabBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;
    widget.tabController!.addListener(() {
      setState(() {});
      widget.onTabChange(widget.tabController!.index);
    });
    return Container(
      height: Indicator.rectangular == widget.indicator
          ? widget.height! + 5
          : Indicator.dots == widget.indicator
              ? widget.height! + 25
              : widget.height! + 5,
      padding: EdgeInsets.only(
        left: Indicator.rectangular == widget.indicator ? 20 : 5,
        bottom: Indicator.rectangular == widget.indicator
            ? 10
            : Indicator.dots == widget.indicator
                ? 10
                : 0,
      ),
      width: screenWidth(context),
      decoration: BoxDecoration(
        color: widget.tabColor ??
            colorChanger(
              context: context,
              dark: kcNeutralColor_100,
              light: Colors.white,
            ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: widget.enableShadow!
                ? colorChanger(
                    context: context,
                    dark: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.09),
                    light: kcNeutralColor_90.withOpacity(0.03),
                  )
                : Colors.transparent,
            blurRadius: 20.0,
            spreadRadius: 0.5,
            offset: const Offset(0.0, 15),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: TabBar(
          tabs: widget.tabs!,
          controller: widget.tabController,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: fontChanger(
            lang: lang,
            fontWeight: FontWeight.w500,
          ),
          tabAlignment: TabAlignment.start,
          labelPadding: widget.indicator == Indicator.rectangular
              ? const EdgeInsets.only(left: 20, right: 20)
              : const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          isScrollable: true,
          physics: const BouncingScrollPhysics(),
          labelColor: widget.selectedTextStyle.color ??
              colorChanger(
                context: context,
                dark: Colors.white,
                light: widget.indicator == Indicator.rectangular
                    ? const Color.fromARGB(255, 116, 83, 83)
                    : Theme.of(context).colorScheme.primary,
              ),
          unselectedLabelColor: widget.unSelectedTextStyle.color ??
              colorChanger(
                context: context,
                dark: kcNeutralColor_60,
                light: kcNeutralColor_80,
              ),
          indicator: widget.indicator == Indicator.rectangular
              ? RectangularIndicator(
                  color: widget.indicatorColor ??
                      Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                  topRightRadius: 24,
                  topLeftRadius: 24,
                  bottomLeftRadius: 24,
                  bottomRightRadius: 24,
                  horizontalPadding: 10,
                )
              : widget.indicator == Indicator.dots
                  ? DotIndicator(
                      color: widget.indicatorColor ??
                          Theme.of(context).colorScheme.primary,
                      paintingStyle: PaintingStyle.fill,
                      radius: 4,
                      distanceFromCenter: 20,
                    )
                  : MaterialIndicator(
                      color: widget.indicatorColor ??
                          Theme.of(context).colorScheme.secondary,
                      topRightRadius: 22,
                      topLeftRadius: 22,
                      bottomLeftRadius: 22,
                      bottomRightRadius: 22,
                      horizontalPadding: 25,
                    ),
          onTap: (int index) => widget.onTabChange(index),
        ),
      ),
    );
  }
}
