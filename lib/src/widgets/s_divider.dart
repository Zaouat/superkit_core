// ignore_for_file: use_key_in_widget_constructors
/*
* File : SuperKit Divider Widget
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKitDivider extends StatelessWidget {
  final double? height;

  //----------Light Divider--------------//
  const SuperKitDivider.lightDivider({
    this.height = 1,
  });

  //----------Regular Divider--------------//
  const SuperKitDivider.regularDivider({
    this.height = 3,
  });
  //----------Medium Divider--------------//
  const SuperKitDivider.mediumDivider({
    this.height = 6,
  });

  //----------SemiBold Divider--------------//
  const SuperKitDivider.semiboldDivider({
    this.height = 12,
  });
//----------Bold Divider--------------//
  const SuperKitDivider.boldDivider({
    this.height = 18,
  });
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AdaptiveThemeMode>(
        valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
        builder: (_, Object? mode, Widget? child) {
          return Container(
            height: height ?? 1,
            color: colorChanger(
              context: context,
              dark: kcNeutralColor_90.withOpacity(0.5),
              light: kcNeutralColor_10,
            ),
          );
        });
  }
}
