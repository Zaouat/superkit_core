import 'dart:convert';

class LanguageData {
  final String code;
  final String countryCode;
  final String name;
  final String title;
  final String flag;
  final bool enabled;
  LanguageData({
    required this.code,
    required this.name,
    required this.title,
    required this.flag,
    required this.enabled,
    required this.countryCode,
  });

  LanguageData copyWith({
    String? code,
    String? name,
    String? title,
    String? flag,
    bool? enabled,
    String? countryCode,
  }) {
    return LanguageData(
      code: code ?? this.code,
      countryCode: countryCode ?? this.countryCode,
      name: name ?? this.name,
      title: title ?? this.title,
      flag: flag ?? this.flag,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'countryCode': countryCode,
      'name': name,
      'title': title,
      'flag': flag,
      'enabled': enabled,
    };
  }

  factory LanguageData.fromMap(Map<String, dynamic> map) {
    return LanguageData(
      code: map['code'].toString(),
      countryCode: map['countryCode'].toString(),
      name: map['name'].toString(),
      title: map['title'].toString(),
      flag: map['flag'].toString(),
      enabled: map['enabled'] as bool,
    );
  }

  String? toJson() => json.encode(toMap());

  factory LanguageData.fromJson(String source) =>
      LanguageData.fromMap(json.decode(source) as Map<String, dynamic>);
}
