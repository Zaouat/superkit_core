import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleSPageTemplate(
      title: "Earning",
      centerTitle: false,
      appBarHeight: 90,
      appbarColor: Colors.white,
      elevation: null,
      enableTabs: false,
      enableContinuousRadius: true,
      titleColor: Colors.black,
      appbarRadius: 100,
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
