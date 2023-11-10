import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleSPageTemplate(
      title: "Earning",
      centerTitle: false,
      appbarColor: Colors.white,
      elevation: null,
      enableTabs: true,
      enableBack: true,
      // selectedTextStyle: TextStyle(color: Colors.red),
      // unSelectedTextStyle: TextStyle(color: Colors.green),
      // titleColor: Colors.white,
      tabs: [
        SuperKitText.bodyMedium(text: "text", lang: "lang"),
        SuperKitText.bodyMedium(text: "text", lang: "lang")
      ],
      tabsWidgets: [
        Container(
          color: Colors.white,
        ),
        Container(
          color: Colors.white,
        ),
      ],
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
