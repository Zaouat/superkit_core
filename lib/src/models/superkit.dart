// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/Material.dart';
import 'package:superkit_core/superkit_core.dart';
import 'package:window_manager/window_manager.dart';

class SuperKit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AdaptiveTheme.getThemeMode();
  }

  static Future<AdaptiveThemeMode?> getMode() async {
    return await AdaptiveTheme.getThemeMode();
  }

  static Future<dynamic> setDesktopConfig({
    String? title = 'Superkit Core',
    Size? initialSize = const Size(450, 720),
    Size? minSize = const Size(450, 720),
    Size? maxSize = const Size(1920, 1080),
  }) async {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
      title: title,
      size: initialSize,
      minimumSize: minSize!,
      maximumSize: maxSize!,
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle:
          Device.isMacOS ? TitleBarStyle.hidden : TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
    // doWhenWindowReady(() {
    //   appWindow.maxSize = maxSize;
    //   appWindow.minSize = minSize;
    //   appWindow.size = initialSize!;
    //   appWindow.title = title!;
    //   appWindow.show();
    // });
  }
}
