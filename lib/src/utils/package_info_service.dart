import 'package:superkit_core/superkit_core.dart';

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
