import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:superkit_core/superkit_core.dart';
import 'package:superkit_project/data/db_manager.dart';

extension HexColorX on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHexx({bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension Currency on double {
  String toCurrency({
    bool useDefaultFormat = false,
    String currencySymbol = '\$',
    int decimalDigits = 2,
    List<String> suffixes = const ['T', 'B', 'M', 'k'],
    List<double> thresholds = const [
      1e12, // Trillion
      1e9, // Billion
      1e6, // Million
      1e3 // Thousand
    ],
  }) {
    // Helper function to remove trailing zeros and decimal point if necessary
    String removeTrailingZeros(String number) {
      if (number.contains('.')) {
        number = number.replaceAll(RegExp(r'0+$'), ''); // Remove trailing zeros
        if (number.endsWith('.')) {
          number = number.substring(
              0, number.length - 1); // Remove decimal point if no decimals
        }
      }
      return number;
    }

    if (useDefaultFormat) {
      final String formatted = NumberFormat.currency(
              locale: 'en_US',
              symbol: currencySymbol,
              decimalDigits: decimalDigits)
          .format(this);
      return removeTrailingZeros(formatted);
    } else {
      final double absValue = abs();

      for (int i = 0; i < thresholds.length; i++) {
        if (absValue >= thresholds[i]) {
          final double dividedValue = this / thresholds[i];
          final String suffix = suffixes[i];

          // Format the number with the specified decimal digits and remove unnecessary zeros
          final String formattedNumber =
              removeTrailingZeros(dividedValue.toStringAsFixed(decimalDigits));

          return '$currencySymbol$formattedNumber$suffix';
        }
      }

      // Handle numbers less than 1
      if (absValue < 1) {
        final decimalValue = Decimal.parse(toStringAsFixed(7));
        final int zeroAmount = countLeadingZeros(decimalValue);

        if (zeroAmount >= 3) {
          final String strNumber = decimalValue.toString().split('0.0')[1];
          final String zeros = List.generate(zeroAmount - 1, (_) => '0').join();
          final String dots = List.generate(zeroAmount - 1, (_) => '.').join();
          final String converted = strNumber.replaceAll(zeros, dots);
          return '$currencySymbol.0$converted';
        } else if (zeroAmount == 2) {
          final String formatted = NumberFormat.currency(
                  locale: 'en_US', symbol: currencySymbol, decimalDigits: 6)
              .format(this);
          return removeTrailingZeros(formatted);
        }
      }

      // For all other numbers, format normally and remove trailing zeros
      final String formatted = NumberFormat.currency(
              locale: 'en_US',
              symbol: currencySymbol,
              decimalDigits: decimalDigits)
          .format(this);
      return removeTrailingZeros(formatted);
    }
  }
}

int countLeadingZeros(Decimal number) {
  final String numberStr = number.toString();
  final List<String> parts = numberStr.split('.');

  if (parts.length < 2) {
    return 0; // No decimal point, no leading zeros
  }

  final String decimalPart = parts[1];
  int count = 0;

  for (int i = 0; i < decimalPart.length; i++) {
    if (decimalPart[i] == '0') {
      count++;
    } else {
      break;
    }
  }

  return count;
}

extension Translate on BuildContext {
  String tr(String key) {
    return AppLocalizations.of(this)!.translate(key)!;
  }
}

extension DarkMode on BuildContext {
  bool get isdarkMode {
    return isDarkMode(this);
  }
}

extension TranslateNoContext on String {
  Future<String> tr() async {
    final config = DBManager.getAppConfig();
    final locale = Locale(config.languageCode, config.countryCode);
    final AppLocalizations t = await AppLocalizations.delegate.load(locale);
    return t.translate(this)!;
  }
}

extension ScreenDimentions on BuildContext {
  double get width {
    return screenWidth(this);
  }

  double get height {
    return screenHeight(this);
  }
}

extension DataOrDefault on Map<String, dynamic>? {
  T get<T>(String key, T defaultValue) {
    final map = this;
    if (map == null || !map.containsKey(key)) {
      return defaultValue;
    }

    final value = map[key];
    return value is T ? value : defaultValue;
  }
}

extension DurationFormatting on Duration {
  String formatDuration() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final String hours = twoDigits(inHours);
    final String minutes = twoDigits(inMinutes.remainder(60));
    final String seconds = twoDigits(inSeconds.remainder(60));

    return '$hours:$minutes:$seconds';
  }
}
