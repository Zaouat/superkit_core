import 'package:superkit_core/superkit_core.dart';
import 'package:superkit_project/utils/extentions.dart';

Map<String, dynamic> configData = {
  'languages': [
    {
      'code': 'en',
      'countryCode': 'GB',
      'title': 'English',
      'flag': 'assets/icons/countries/GB.svg',
      'enabled': true,
    },
    {
      'code': 'fr',
      'countryCode': 'FR',
      'title': 'French',
      'flag': 'assets/icons/countries/FR.svg',
      'enabled': true,
    },
    {
      'code': 'de',
      'countryCode': 'DE',
      'title': 'German',
      'flag': 'assets/icons/countries/DE.svg',
      'enabled': true,
    },
    {
      'code': 'es',
      'countryCode': 'ES',
      'title': 'Spanish',
      'flag': 'assets/icons/countries/ES.svg',
      'enabled': true,
    },
    // {
    //   'code': 'it',
    //   'countryCode': 'IT',
    //   'title': 'Italian',
    //   'flag': 'assets/icons/countries/IT.svg',
    //   'enabled': true,
    // },
    // {
    //   'code': 'nl',
    //   'countryCode': 'NL',
    //   'title': 'Dutch',
    //   'flag': 'assets/icons/countries/NL.svg',
    //   'enabled': true,
    // },
    // {
    //   'code': 'ru',
    //   'countryCode': 'RU',
    //   'title': 'Russian',
    //   'flag': 'assets/icons/countries/RU.svg',
    //   'enabled': true,
    // },
    // {
    //   'code': 'tr',
    //   'countryCode': 'TR',
    //   'title': 'Turkish',
    //   'flag': 'assets/icons/countries/TR.svg',
    //   'enabled': true,
    // },
    // {
    //   'code': 'ko',
    //   'countryCode': 'KO',
    //   'title': 'South Korean',
    //   'flag': 'assets/icons/countries/KR.svg',
    //   'enabled': true,
    // },
    // {
    //   'code': 'ja',
    //   'countryCode': 'JA',
    //   'title': 'Japanese',
    //   'flag': 'assets/icons/countries/JP.svg',
    //   'enabled': true,
    // },
    // {
    //   'code': 'id',
    //   'countryCode': 'ID',
    //   'title': 'Indonesian',
    //   'flag': 'assets/icons/countries/ID.svg',
    //   'enabled': true,
    // },
    // {
    //   'code': 'pt',
    //   'countryCode': 'PT',
    //   'title': 'Portuguese',
    //   'flag': 'assets/icons/countries/BR.svg',
    //   'enabled': true,
    // },
    // {
    //   'code': 'hi',
    //   'countryCode': 'HI',
    //   'title': 'Hindi',
    //   'flag': 'assets/icons/countries/IN.svg',
    //   'enabled': true,
    // },
    // {
    //   'code': 'pl',
    //   'countryCode': 'PL',
    //   'title': 'Polish',
    //   'flag': 'assets/icons/countries/PL.svg',
    //   'enabled': false,
    // },
    // {
    //   'code': 'vn',
    //   'countryCode': 'VN',
    //   'title': 'Vietnamese',
    //   'flag': 'assets/icons/countries/VN.svg',
    //   'enabled': false,
    // },
  ],
};

class Config {
  final List<LanguageData> languages;
  Config({
    required this.languages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'languages': languages
          .where((LanguageData e) => e.enabled)
          .map((LanguageData x) => x.toMap())
    };
  }

  factory Config.fromMap(Map<String, dynamic> json) {
    return Config(
      languages: json
          .get('languages', [])
          .map((e) => LanguageData.fromMap(e))
          .toList(),
    );
  }
}

class DefaultAppData {
  Config get config => Config.fromMap(configData);
}
