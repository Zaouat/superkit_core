import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:superkit_core/superkit_core.dart';
import 'dart:io' show Platform;
import 'package:superkit_project/config/confing.dart';
import 'package:superkit_project/config/globals.dart' as globals;
import 'package:superkit_project/config/themes.dart';
import 'package:superkit_project/utils/extentions.dart';

//TODO refactor this to be extention later
bool isSmallDevice(BuildContext context) {
  return context.width >= 200 && context.width <= 390;
}

Locale getDeviceLocale() {
  Config _config = Config.fromMap(configData);
  List<LanguageData> _languages = _config.languages;

  final String deviceLocaleData =
      WidgetsBinding.instance.window.locale.toLanguageTag();
  List<String> localParts = deviceLocaleData.split('-');
  Locale deviceLocale = Locale(localParts[0], localParts[1]);
  if (_languages.any(
    (LanguageData language) =>
        language.code == deviceLocale.languageCode &&
        language.countryCode == deviceLocale.countryCode,
  )) {
    return deviceLocale;
  }

  return Locale('en', 'US');
}

class StatusNavigationNotifier extends StatefulWidget {
  final BuildContext context;
  final Widget child;
  final bool forceLight;

  const StatusNavigationNotifier({
    required this.context,
    required this.child,
    required this.forceLight,
  });

  @override
  _StatusNavigationNotifierState createState() =>
      _StatusNavigationNotifierState();
}

class _StatusNavigationNotifierState extends State<StatusNavigationNotifier> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: widget.forceLight
                ? globals.Platform.isIOS
                    ? Brightness.dark
                    : Brightness.light
                : (globals.Platform.isIOS)
                    ? (isDarkMode(context) ? Brightness.dark : Brightness.light)
                    : (isDarkMode(context)
                        ? Brightness.light
                        : Brightness.dark),
            statusBarIconBrightness: widget.forceLight
                ? globals.Platform.isIOS
                    ? Brightness.dark
                    : Brightness.light
                : (globals.Platform.isIOS)
                    ? (isDarkMode(context) ? Brightness.dark : Brightness.light)
                    : (isDarkMode(context)
                        ? Brightness.light
                        : Brightness.dark),
          ),
        ),
      ),
      child: widget.child,
    );
  }
}

SystemUiOverlayStyle getSystemUIOverlayStyle(BuildContext context) {
  final theme = Theme.of(context);
  return SystemUiOverlayStyle(
    systemNavigationBarColor:
        isDarkMode(context) ? globals.darkBG : Colors.white,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: theme.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light,
    statusBarColor: Colors.transparent,
  );
}

/// Generates a random integer within a specified range, with bias and influence.
///
/// The [min] parameter specifies the minimum value of the range (inclusive).
/// The [max] parameter specifies the maximum value of the range (exclusive).
/// The [bias] parameter specifies the bias value to be mixed with the random value.
/// The [influence] parameter specifies the influence of the bias value on the result.
///
/// Returns a random integer within the specified range, with bias and influence.
int randomInteger(int min, int max, double bias, double influence) {
  int rnd = Random().nextInt(max - min) + min; // random in range
  double mix = Random().nextDouble() * influence; // random mixer
  return (rnd * (1 - mix) + bias * mix).round(); // mix full range and bias
}

int randowmBetweenInt(int min, int max) {
  if (min > max) {
    throw ArgumentError('min should be less than or equal to max');
  }
  return Random().nextInt(max - min + 1) + min;
}

double randowmBetweenDouble(double min, double max) {
  return Random().nextDouble() * (max - min + 1) + min;
}

List<T> getRandomItems<T>(List<T> inputList, int x) {
  if (x > inputList.length) {
    throw ArgumentError(
        'x cannot be greater than the number of items in the list');
  }

  var random = Random();
  var inputListCopy =
      List<T>.from(inputList); // Create a copy of the input list
  var randomItems = <T>[];

  for (int i = 0; i < x; i++) {
    var randomIndex = random.nextInt(inputListCopy.length);
    randomItems.add(inputListCopy.removeAt(randomIndex));
  }

  return randomItems;
}

bool randomBooleanByPercentage(double percentage) {
  // Ensure the percentage is between 0 and 100
  if (percentage < 0 || percentage > 100) {
    throw ArgumentError('Percentage must be between 0 and 100');
  }

  // Create a random number generator
  Random random = Random();

  // Generate a random number between 0 and 100
  double randomValue = random.nextDouble() * 100;

  // Return true if the random value is less than the percentage, false otherwise
  return randomValue < percentage;
}

String generateCreditCardDate() {
  DateTime now = DateTime.now();
  DateTime expireDate = now.add(Duration(days: 1500));
  String month =
      expireDate.month < 10 ? "0${expireDate.month}" : "${expireDate.month}";
  return "$month/${expireDate.year.toString().substring(expireDate.year.toString().length - 2)}";
}

enum ClickSource { favorite, details, search, carService, showroom }

ThemeData getTheme(BuildContext context) {
  if (isDarkMode(context)) {
    return Platform.isIOS ? Themes.light : Themes.dark;
  } else {
    return Platform.isIOS ? Themes.dark : Themes.light;
  }
}

double getAdaptiveFontSize(double amount) {
  // Base font size
  double baseSize = 30;

  // If amount is 0 or negative, return base size
  if (amount <= 0) return baseSize;

  // Calculate reduction based on log10 of the number
  // log10 gives us the number of digits minus 1
  double reduction = (log(amount) / ln10) / 3;

  // Calculate final size with a minimum of 20
  return max(baseSize - (reduction * 2), 20);
}

Future<String> getAppVersion() async {
  final info = await PackageInfo.fromPlatform();
  return info.version;
}
