import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleSPageTemplate(
      title: "Earning",
      centerTitle: false,
      appBarHeight: 55,
      indicator: Indicator.dots,
      appbarColor: Color(0xff4e5ce6),
      elevation: 0,
      enableTabs: true,
      tabs: [
        SuperKitText.bodyBold(text: "Shares", lang: ""),
        SuperKitText.bodyBold(text: "CryptoCurrency", lang: ""),
      ],
      tabsWidgets: [
        Container(),
        Container(),
      ],
      body: Container(),
    );
  }
}
