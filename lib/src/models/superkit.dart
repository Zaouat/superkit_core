// ignore_for_file: avoid_classes_with_only_static_members

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';

class SuperKit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AdaptiveTheme.getThemeMode();
  }

  static Future<AdaptiveThemeMode?> getMode() async {
    return await AdaptiveTheme.getThemeMode();
  }
}
