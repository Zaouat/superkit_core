import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  PackageInfoService() {
    PackageInfo.fromPlatform().then((PackageInfo value) {
      _versionNumber = value.version;
      _packageName = value.packageName;
    });
  }

  late String? _versionNumber;
  late String? _packageName;

  String get versionNumber => _versionNumber!;
  String get packageName => _packageName!;
}
