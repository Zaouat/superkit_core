import 'package:flutter/material.dart';
import 'package:superkit_project/utils/utils.dart';

class HomeViewModel with ChangeNotifier {
  String _version = '';

  String get version => _version;

  Future<void> fetchAppVersion() async {
    _version = await getAppVersion();
    notifyListeners();
  }
}
