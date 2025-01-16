import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:superkit_project/models/app_model.dart';

Future<Box<dynamic>> openHiveBox(
    {required String boxName,
    bool useEncryption = false,
    HiveAesCipher? encryptionCipher}) {
  if (useEncryption) {
    return Hive.openBox(
      boxName,
    );
  }
  return Hive.openBox(boxName);
}

class DBManager {
  static Box<dynamic> app_config_box = Hive.box('app_config_box');

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    app_config_box = await openHiveBox(
      boxName: 'app_config_box',
    );
  }

  static Future<void> saveAppconfig(AppConfig appConfig) async {
    await app_config_box.put('app_config_box', appConfig.toJson());
  }

  static AppConfig getAppConfig() {
    final data = app_config_box.get('app_config_box');
    if (data != null) {
      final jsonString = jsonEncode(data);
      return AppConfig.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
    } else {
      return AppConfig.defaultConfig();
    }
  }
}
