// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:math';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Screen {
  static double get _ppi => (Platform.isAndroid || Platform.isIOS) ? 150 : 96;
  static bool isLandscape(BuildContext c) =>
      MediaQuery.of(c).orientation == Orientation.landscape;
  //PIXELS
  static Size size(BuildContext c) => MediaQuery.of(c).size;
  static double width(BuildContext c) => size(c).width;
  static double height(BuildContext c) => size(c).height;
  static double diagonal(BuildContext c) {
    Size s = size(c);
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  //INCHES
  static Size inches(BuildContext c) {
    Size pxSize = size(c);
    return Size(pxSize.width / _ppi, pxSize.height / _ppi);
  }

  static double widthInches(BuildContext c) => inches(c).width;
  static double heightInches(BuildContext c) => inches(c).height;
  static double diagonalInches(BuildContext c) => diagonal(c) / _ppi;
}

class Device {
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);
  static bool get isMobile => isAndroid || isIOS;
  static bool get isWeb => kIsWeb;

  static bool get isWindows => Platform.isWindows;
  static bool get isLinux => Platform.isLinux;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isFuchsia => Platform.isFuchsia;
  static bool get isIOS => Platform.isIOS;
}
// bool isLandscape = Screen.isLandscape(context);
// bool isLargePhone = Screen.diagonal(context) > 720;
// bool isTablet = Screen.diagonalInches(context) >= 7;
// bool isNarrow = Screen.widthInches(context) < 3.5;
