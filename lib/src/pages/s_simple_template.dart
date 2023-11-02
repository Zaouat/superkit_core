/*
* File : SuperKit Simple Template page
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class MoreMenu {
  int value;
  String name;
  MoreMenu(this.value, this.name);
}

enum Indicator {
  dots,
  material,
  rectangular,
}

class SimpleSPageTemplate extends StatefulWidget {
  const SimpleSPageTemplate({
    Key? key,
    this.title,
    this.body,
    this.onBack,
    this.enableBack = false,
    this.appBarHeight = 70,
    this.hasTrailing = false,
    this.onSelectOption,
    this.listOptions,
    this.pinned = true,
    this.elevation = 0,
    this.trailing,
    this.isRtl = false,
    this.backTooltip,
    this.centerTitle = true,
    this.tabs,
    this.initialIndex = 0,
    this.indicator = Indicator.rectangular,
    this.enableTabs = false,
    this.tabsWidgets,
    this.appbarColor,
    this.appbarRadius = 0,
    this.enableContinuousRadius = true,
    this.menuRadius = 10,
    this.enableAppbarGradient = false,
    this.onTitleTap,
    this.maxTitleLines = 1,
    this.sliverAppBar,
    this.enablesliverAppBar = true,
  }) : super(key: key);

  /// title of the page
  final String? title;

  /// body of the page
  final Widget? body;

  /// callback when back button is pressed
  final Function()? onBack;

  /// enable back button
  final bool? enableBack;

  /// appbar height (default is 95)
  final double appBarHeight;

  /// enable the trailing widget
  final bool? hasTrailing;

  /// callback when the trailing widget is pressed
  final Function(MoreMenu? value)? onSelectOption;

  /// list of options to show in the trailing widget
  final List<MoreMenu>? listOptions;

  /// pinned appbar of the page (default is true)
  final bool? pinned;

  /// appbar elevation
  final double? elevation;

  /// Widgets to display after the [title] widget.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  /// For less common operations, consider using a [PopupMenuButton] as the
  /// last action.
  final Widget? trailing;

  /// a boolean to change the page to rtl (default is false)
  final bool? isRtl;

  /// tooltip of the back button
  final String? backTooltip;

  /// center the title
  final bool? centerTitle;

  /// list of widgets to show in the tabs
  final List<Widget>? tabs;

  /// initial index of the tabs
  final int? initialIndex;

  /// indicator of the tabs (default is rectangular)
  final Indicator? indicator;

  /// If you set this to true, you need to to provide a list of tabs and their widgets.
  final bool? enableTabs;

  /// list of widgets to show in body when tabs are changed
  final List<Widget>? tabsWidgets;

  /// the color of the appbar
  final Color? appbarColor;

  /// the radius of the appbar
  final double? appbarRadius;

  /// a bool to enable continuous radius
  final bool? enableContinuousRadius;

  /// the radius of the menu
  final double? menuRadius;

  /// a bool to enable gradient of the appbar
  final bool? enableAppbarGradient;

  /// Call back when the title is Tapped
  final Function? onTitleTap;

  /// Max tite lines on the appbar
  final int? maxTitleLines;

  ///
  final Widget? sliverAppBar;

  final bool? enablesliverAppBar;

  @override
  State<SimpleSPageTemplate> createState() => _SuperKitSimpleTemplateState();
}

class _SuperKitSimpleTemplateState extends State<SimpleSPageTemplate>
    with SingleTickerProviderStateMixin {
  late TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = widget.enableTabs!
        ? TabController(
            length: widget.tabs!.length, vsync: this, initialIndex: 0)
        : null;
  }

  @override
  void dispose() {
    widget.enableTabs! ? tabController!.dispose() : null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;

    SliverAppBar showSliverAppBar() {
      return SliverAppBar(
        title: customTitle(
          context: context,
          lang: lang,
        ),
        elevation: widget.elevation,
        forceElevated: false,
        floating: false,
        stretch: true,
        pinned: widget.pinned!,
        expandedHeight: widget.appBarHeight,
        toolbarHeight: widget.appBarHeight,
        automaticallyImplyLeading: false,
        centerTitle: widget.centerTitle,
        leading: widget.enableBack!
            ? customLeading(
                context: context,
                lang: lang,
              )
            : null,
        shape: widget.enableContinuousRadius!
            ? ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(widget.appbarRadius!),
                  bottomRight: Radius.circular(widget.appbarRadius!),
                ),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(widget.appbarRadius!),
                  bottomRight: Radius.circular(widget.appbarRadius!),
                ),
              ),
        backgroundColor: widget.appbarColor ??
            colorChanger(
              context: context,
              dark: kcNeutralColor_90,
              light: Colors.white,
            ),
        bottom: widget.enableTabs!
            ? PreferredSize(
                preferredSize: widget.indicator! == Indicator.rectangular ||
                        widget.indicator! == Indicator.dots
                    ? const Size.fromHeight(60.0)
                    : const Size.fromHeight(45.0),
                child: SuperKitTabBar(
                  tabs: widget.tabs,
                  tabController: tabController,
                  indicator: widget.indicator,
                  enableShadow: widget.elevation == 0 ? false : true,
                  enableAppbarGradient: widget.enableAppbarGradient!,
                  tabColor: widget.appbarColor,
                ),
              )
            : null,
        titleSpacing: 0,
        flexibleSpace: Card(
          shadowColor: widget.elevation == 0
              ? Colors.transparent
              : Theme.of(context).shadowColor,
          margin: EdgeInsets.zero,
          shape: widget.enableContinuousRadius!
              ? ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(widget.appbarRadius!),
                    bottomRight: Radius.circular(widget.appbarRadius!),
                  ),
                )
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(widget.appbarRadius!),
                    bottomRight: Radius.circular(widget.appbarRadius!),
                  ),
                ),
          color: widget.enableAppbarGradient!
              ? null
              : widget.appbarColor ??
                  colorChanger(
                    context: context,
                    dark: kcNeutralColor_90,
                    light: Colors.white,
                  ),
          child: Container(
              decoration: BoxDecoration(
                gradient: widget.enableAppbarGradient!
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          colorChanger(
                            context: context,
                            dark: kcNeutralColor_90,
                            light: Theme.of(context).primaryColor,
                          ),
                          colorChanger(
                            context: context,
                            dark: kcNeutralColor_90.withOpacity(0.85),
                            light: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.85),
                          ),
                          colorChanger(
                            context: context,
                            dark: kcNeutralColor_90.withOpacity(0.75),
                            light: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.75),
                          ),
                          colorChanger(
                            context: context,
                            dark: kcNeutralColor_90.withOpacity(0.65),
                            light: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.65),
                          ),
                          colorChanger(
                            context: context,
                            dark: kcNeutralColor_90.withOpacity(0.55),
                            light:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                          ),
                          colorChanger(
                            context: context,
                            dark: kcNeutralColor_90.withOpacity(0.45),
                            light:
                                Theme.of(context).primaryColor.withOpacity(0.4),
                          ),
                          colorChanger(
                            context: context,
                            dark: kcNeutralColor_90.withOpacity(0.42),
                            light:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                          ),
                          colorChanger(
                            context: context,
                            dark: kcNeutralColor_90.withOpacity(0.4),
                            light:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                          ),
                        ],
                      )
                    : null,
              ),
              child: Row(
                children: <Widget>[
                  Container(),
                ],
              )),
        ),
        actions: <Widget>[
          //Trailing
          if (widget.hasTrailing! && widget.trailing == null)
            ScaleTap(
              onPressed: () {},
              child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  popupMenuTheme: PopupMenuThemeData(
                    color: colorChanger(
                      context: context,
                      dark: kcNeutralColor_100,
                      light: Colors.white,
                    ),
                    textStyle: fontChanger(
                        lang: lang,
                        color: Theme.of(context).textTheme.bodySmall!.color!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widget.menuRadius!),
                    ),
                  ),
                ),
                child: PopupMenuButton<MoreMenu>(
                  elevation: 3,
                  onSelected: (MoreMenu? value) {
                    widget.onSelectOption!(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return widget.listOptions!.map((MoreMenu choice) {
                      return PopupMenuItem<MoreMenu>(
                        value: choice,
                        child: SuperKitText.captionBold(
                          text: choice.name,
                          lang: lang,
                        ),
                      );
                    }).toList();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 12,
                      bottom: widget.appBarHeight / 3,
                    ),
                    child: Tooltip(
                      message: 'more',
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.15),
                        radius: 16,
                        child: SvgPicture.asset(
                          'assets/icons/dots.svg',
                          width: 16,
                          color: widget.enableAppbarGradient!
                              ? Colors.white
                              : Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color!,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          else if (widget.trailing != null)
            Padding(
              padding: EdgeInsets.only(
                top: widget.appbarRadius == 0 ? widget.appBarHeight / 3.5 : 0,
                bottom: widget.appbarRadius == 0 ? 0 : widget.appBarHeight / 3,
              ),
              child: widget.trailing!,
            )
          else
            Container()
        ],
      );
    }

    ///-- body --------------------------------------------------------------- /
    return widget.enableTabs!
        ? DefaultTabController(
            length: widget.tabs!.length,
            child: Scaffold(
              backgroundColor: colorChanger(
                context: context,
                dark: kcNeutralColor_100,
                light: Colors.white,
              ),
              body: NestedScrollView(
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (BuildContext context, _) {
                  return <Widget>[
                    widget.enablesliverAppBar!
                        ? widget.sliverAppBar ?? showSliverAppBar()
                        : SliverAppBar(
                            automaticallyImplyLeading: false,
                            toolbarHeight: 0,
                            elevation: widget.elevation,
                            backgroundColor: colorChanger(
                              context: context,
                              dark: kcNeutralColor_100,
                              light: Colors.white,
                            ),
                          ),
                  ];
                },
                body: TabBarView(
                  controller: tabController,
                  physics: const BouncingScrollPhysics(),
                  children: widget.tabsWidgets!,
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: colorChanger(
              context: context,
              dark: kcNeutralColor_100,
              light: Colors.white,
            ),
            body: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (BuildContext context, _) {
                return <Widget>[
                  widget.enablesliverAppBar!
                      ? widget.sliverAppBar ?? showSliverAppBar()
                      : SliverAppBar(
                          automaticallyImplyLeading: false,
                          toolbarHeight: 0,
                          elevation: widget.elevation,
                          backgroundColor: colorChanger(
                            context: context,
                            dark: kcNeutralColor_100,
                            light: Colors.white,
                          ),
                        ),
                ];
              },
              body: widget.body ?? Container(),
            ),
          );
  }

  double titleSpace(Indicator indicator) {
    switch (indicator) {
      case Indicator.dots:
        return widget.appBarHeight / 3;
      case Indicator.rectangular:
        return widget.appBarHeight / 2;
      case Indicator.material:
        return widget.appBarHeight / 4;
      default:
        return widget.appBarHeight / 2.2;
    }
  }

  Widget customLeading({
    required BuildContext? context,
    required String? lang,
  }) {
    return Padding(
      padding: widget.centerTitle!
          ? EdgeInsets.only(
              //bottom: 14,
              top: widget.enableTabs! ? titleSpace(widget.indicator!) - 10 : 0,
            )
          : EdgeInsets.only(
              left: lang!.contains('ar') ? 0 : 20,
              right: lang.contains('ar') ? 20 : 0,
              //bottom: 14,
              top: widget.enableTabs! ? titleSpace(widget.indicator!) - 10 : 0,
            ),
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: 20,
        icon: Icon(
          lang!.contains('ar') ? Icons.arrow_back_ios : Icons.arrow_back_ios,
          color: widget.enableAppbarGradient!
              ? Colors.white
              : Theme.of(context!).textTheme.displayLarge!.color!,
        ),
        tooltip: widget.backTooltip ??
            AppLocalizations.of(context!)!.translate('tool-back')!,
        onPressed: () {
          Navigator.of(context!).pop();
          widget.onBack?.call();
        },
      ),
    );
  }

  Widget customTitle({
    required BuildContext? context,
    required String? lang,
  }) {
    return Padding(
      padding: widget.centerTitle!
          ? EdgeInsets.only(
              bottom: 14,
              top: widget.enableTabs! ? titleSpace(widget.indicator!) : 0,
            )
          : EdgeInsets.only(
              bottom: 14,
              top: widget.enableTabs! ? titleSpace(widget.indicator!) : 0,
              left: 30,
            ),
      child: SizedBox(
        width: screenWidth(context!) * 0.6,
        child: SuperKitText.heading3Bold(
          text: widget.title ?? '',
          lang: lang,
          maxLines: widget.maxTitleLines,
          color: widget.enableAppbarGradient!
              ? colorChanger(
                  context: context,
                  dark: Theme.of(context).textTheme.displayLarge!.color!,
                  light: Colors.white,
                )
              : widget.appbarColor != null
                  ? Colors.white
                  : Theme.of(context).textTheme.displayLarge!.color!,
        ),
      ),
    );
  }
}
