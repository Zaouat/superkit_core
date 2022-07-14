// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:starter_project/classes/config.dart';
import 'package:starter_project/config/confing.dart';

class GlobalProvider extends ChangeNotifier {
  GlobalProvider() {
    // setInfoProvider(PackageInfoService());
    initConfig(Config.fromMap(configData));
    // admobService = AdmobService(config: _config);
  }

  // PackageInfoService? packageInfo;
  Config? config;
  // AdmobService? admobService;

  // void setInfoProvider(PackageInfoService pkg) {
  //   packageInfo = pkg;
  // }

  void initConfig(Config data) {
    config = data;
    notifyListeners();
  }
}
