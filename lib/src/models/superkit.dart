// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/Material.dart';
import 'package:superkit_core/superkit_core.dart';

class SuperKit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AdaptiveTheme.getThemeMode();
  }

  static Future<AdaptiveThemeMode?> getMode() async {
    return await AdaptiveTheme.getThemeMode();
  }
}
