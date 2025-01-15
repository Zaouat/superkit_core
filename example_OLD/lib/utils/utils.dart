import 'package:flutter/services.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final StringBuffer buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
          '${alpha.toRadixString(16).padLeft(2, '0')}'
          '${red.toRadixString(16).padLeft(2, '0')}'
          '${green.toRadixString(16).padLeft(2, '0')}'
          '${blue.toRadixString(16).padLeft(2, '0')}'
      .replaceAll('#ff', '#');
}

Future<String> getJsonFile(String path) async {
  return await rootBundle.loadString(path);
}

// FlexScheme parseStringScheme(String themeName) {
//   FlexScheme theme = FlexScheme.custom;

//   for (int i = 0; i < FlexScheme.values.length; i++) {
//     if (FlexScheme.values[i].name == themeName) {
//       theme = FlexScheme.values[i];
//     }
//   }
//   return theme;
// }
