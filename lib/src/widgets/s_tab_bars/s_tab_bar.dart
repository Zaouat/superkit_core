/*
* File : SuperKit Tab Bar 
* Version : 1.0.0
* */
import 'package:flutter/material.dart';
import 'package:superkit_core/src/widgets/s_tab_bars/indicators/dot_indicator.dart';
import 'package:superkit_core/src/widgets/s_tab_bars/indicators/material_indicator.dart';
import 'package:superkit_core/src/widgets/s_tab_bars/indicators/rectangular_indicator.dart';
import 'package:superkit_core/superkit_core.dart';

enum Indicator {
  dots,
  material,
  rectangular,
}

class SuperKitTabBar extends StatefulWidget {
  const SuperKitTabBar({
    Key? key,
    this.indicator = Indicator.rectangular,
    required this.tabs,
    this.tabsWidgets,
    this.height = 45,
    this.enableShadow = true,
    this.initialIndex = 0,
    this.tabController,
    this.tabColor,
  }) : super(key: key);

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
  @override
  State<SuperKitTabBar> createState() => _SuperKitTabBarState();
}

class _SuperKitTabBarState extends State<SuperKitTabBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    return Container(
      height: Indicator.rectangular == widget.indicator
          ? widget.height! + 5
          : Indicator.dots == widget.indicator
              ? widget.height! + 20
              : widget.height,
      padding: EdgeInsets.only(
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
        ),
        child: TabBar(
          tabs: widget.tabs!,
          controller: widget.tabController,
          labelStyle: fontChanger(
            lang: lang,
            fontWeight: FontWeight.w500,
          ),
          padding: widget.indicator == Indicator.rectangular
              ? const EdgeInsets.only(left: 20, right: 20)
              : const EdgeInsets.only(left: 15, right: 15),
          isScrollable: true,
          physics: const BouncingScrollPhysics(),
          labelColor: colorChanger(
            context: context,
            dark: Colors.white,
            light: widget.indicator == Indicator.rectangular
                ? Colors.white
                : Theme.of(context).colorScheme.secondary,
          ),
          unselectedLabelColor: colorChanger(
            context: context,
            dark: kcNeutralColor_60,
            light: kcNeutralColor_80,
          ),
          indicator: widget.indicator == Indicator.rectangular
              ? RectangularIndicator(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                  topRightRadius: 24,
                  topLeftRadius: 24,
                  bottomLeftRadius: 24,
                  bottomRightRadius: 24,
                )
              : widget.indicator == Indicator.dots
                  ? DotIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                      paintingStyle: PaintingStyle.fill,
                      radius: 4,
                      distanceFromCenter: 20,
                    )
                  : MaterialIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                      topRightRadius: 22,
                      topLeftRadius: 22,
                      bottomLeftRadius: 22,
                      bottomRightRadius: 22,
                      horizontalPadding: 22,
                    ),
          onTap: (int index) {},
        ),
      ),
    );
  }
}
