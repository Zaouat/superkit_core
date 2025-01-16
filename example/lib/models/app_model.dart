import 'dart:async';
import 'package:flutter/material.dart';
import 'package:superkit_project/data/db_manager.dart';
import 'package:superkit_project/utils/extentions.dart';
import 'package:superkit_project/utils/utils.dart';

class AppSettingsManager {
  AppConfig _appConfig = AppConfig.defaultConfig();
  AppConfig get appConfig => _appConfig;

  AppSettingsManager._();
  static final AppSettingsManager instance = AppSettingsManager._();

  final _streamController = StreamController<AppConfig>.broadcast();
  Stream<AppConfig> get stream => _streamController.stream;

  Future<void> load() async {
    _appConfig = DBManager.getAppConfig();
    _streamController.add(_appConfig);
  }

  Future<void> updateAppConfig(AppConfig appConfig) async {
    _appConfig = appConfig;
    _streamController.add(appConfig);
    await DBManager.saveAppconfig(appConfig);
  }

  Future<void> updateAppConfigWith(Map<String, dynamic> json) async {
    _appConfig = AppConfig.fromJson(json);
    _streamController.add(_appConfig);
    await DBManager.saveAppconfig(_appConfig);
  }

  Future<void> updateAppConfigWithFunction(
      AppConfig Function(AppConfig) updateFunction) async {
    _appConfig = updateFunction(_appConfig);
    _streamController.add(_appConfig);
    await DBManager.saveAppconfig(_appConfig);
  }
}

class AppConfig {
  final bool skipOnboarding;
  final bool enableNotifications;
  final bool enableRemoteNotifications;
  final String languageCode;
  final String countryCode;
  final bool showOverlay;
  final bool enableSound;
  final bool personalizedAdsConsent;
  final bool analyticsConsent;

  AppConfig({
    required this.skipOnboarding,
    required this.languageCode,
    required this.countryCode,
    required this.enableNotifications,
    required this.enableRemoteNotifications,
    required this.showOverlay,
    required this.enableSound,
    required this.personalizedAdsConsent,
    required this.analyticsConsent,
  });

  Map<String, dynamic> toJson() {
    return {
      'skipOnboarding': skipOnboarding,
      'languageCode': languageCode,
      'countryCode': countryCode,
      'enableNotifications': enableNotifications,
      'enableRemoteNotifications': enableRemoteNotifications,
      'showOverlay': showOverlay,
      'enableSound': enableSound,
      'personalizedAdsConsent': personalizedAdsConsent,
      'analyticsConsent': analyticsConsent,
    };
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    final Locale deviceLocale = getDeviceLocale();
    return AppConfig(
      skipOnboarding: json.get('skipOnboarding', false),
      languageCode: json.get('languageCode', deviceLocale.languageCode),
      countryCode: json.get('countryCode', deviceLocale.countryCode ?? ''),
      enableNotifications: json.get('enableNotifications', false),
      enableRemoteNotifications: json.get('enableRemoteNotifications', false),
      showOverlay: json.get('showOverlay', true),
      enableSound: json.get('enableSound', true),
      personalizedAdsConsent: json.get('personalizedAdsConsent', false),
      analyticsConsent: json.get('analyticsConsent', false),
    );
  }

  AppConfig copyWith({
    bool? skipOnboarding,
    String? languageCode,
    String? countryCode,
    bool? enableNotifications,
    bool? enableRemoteNotifications,
    bool? showOverlay,
    bool? enableSound,
    bool? personalizedAdsConsent,
    bool? analyticsConsent,
  }) {
    return AppConfig(
      skipOnboarding: skipOnboarding ?? this.skipOnboarding,
      languageCode: languageCode ?? this.languageCode,
      countryCode: countryCode ?? this.countryCode,
      enableNotifications: enableNotifications ?? this.enableNotifications,
      enableRemoteNotifications:
          enableRemoteNotifications ?? this.enableRemoteNotifications,
      showOverlay: showOverlay ?? this.showOverlay,
      enableSound: enableSound ?? this.enableSound,
      personalizedAdsConsent:
          personalizedAdsConsent ?? this.personalizedAdsConsent,
      analyticsConsent: analyticsConsent ?? this.analyticsConsent,
    );
  }

  factory AppConfig.defaultConfig() {
    final Locale deviceLocale = getDeviceLocale();
    return AppConfig(
      skipOnboarding: false,
      languageCode: deviceLocale.languageCode,
      countryCode: deviceLocale.countryCode ?? '',
      enableNotifications: false,
      enableRemoteNotifications: false,
      showOverlay: true,
      enableSound: true,
      personalizedAdsConsent: false,
      analyticsConsent: false,
    );
  }
}
