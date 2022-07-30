// ignore_for_file: avoid_dynamic_calls

import 'package:superkit_core/superkit_core.dart';

class Config {
  final bool? enableAboutUs;
  final bool? enableMoreApps;
  final bool? enableSharpEdges;
  final String? appTitle;
  final String? aboutText;
  final bool? enableWebsite;
  final bool? enableTwitter;
  final bool? enableFacebook;
  final String? website;
  final String? twitterHandler;
  final String? facebookHandler;
  final bool? enableAds;
  final String? admobAppId;
  final String? bannerAdId;
  final String? interstitialAdId;
  final List<LanguageData>? languages;
  Config({
    this.enableAboutUs,
    this.enableMoreApps,
    this.enableSharpEdges,
    this.appTitle,
    this.aboutText,
    this.enableWebsite,
    this.enableTwitter,
    this.enableFacebook,
    this.website,
    this.twitterHandler,
    this.facebookHandler,
    this.enableAds,
    this.admobAppId,
    this.bannerAdId,
    this.interstitialAdId,
    this.languages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'enableAboutUs': enableAboutUs,
      'enableMoreApps': enableMoreApps,
      'enableSharpEdges': enableSharpEdges,
      'appTitle': appTitle,
      'aboutText': aboutText,
      'enableWebsite': enableWebsite,
      'enableTwitter': enableTwitter,
      'enableFacebook': enableFacebook,
      'website': website,
      'twitterHandler': twitterHandler,
      'facebookHandler': facebookHandler,
      'enableAds': enableAds,
      'admobAppId': admobAppId,
      'bannerAdId': bannerAdId,
      'interstitialAdId': interstitialAdId,
      'languages': languages
          ?.where((LanguageData e) => e.enabled)
          .map((LanguageData x) => x.toMap())
    };
  }

  factory Config.fromMap(Map<String, dynamic> map) {
    return Config(
      enableAboutUs: map['enableAboutUs'] as bool,
      enableMoreApps: map['enableMoreApps'] as bool,
      enableSharpEdges: map['enableSharpEdges'] as bool,
      appTitle: map['appTitle'].toString(),
      aboutText: map['aboutText'].toString(),
      enableWebsite: map['enableWebsite'] as bool,
      enableTwitter: map['enableTwitter'] as bool,
      enableFacebook: map['enableFacebook'] as bool,
      website: map['website'].toString(),
      twitterHandler: map['twitterHandler'].toString(),
      facebookHandler: map['facebookHandler'].toString(),
      enableAds: map['enableAds'] as bool,
      admobAppId: map['admobAppId'] as String,
      bannerAdId: map['bannerAdId'] as String,
      interstitialAdId: map['interstitialAdId'] as String,
      languages: List<LanguageData>.from(
        map['languages']?.map(
          (dynamic x) => LanguageData.fromMap(x as Map<String, dynamic>),
        ) as Iterable<dynamic>,
      ).where((LanguageData element) => element.enabled).toList(),
    );
  }
}
