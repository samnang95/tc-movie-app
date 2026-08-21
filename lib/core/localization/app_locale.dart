import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';

List<MapLocale> appLocales = [];

Future<void> loadLocales() async {
  final en = await _loadJson('assets/langs/en.json');
  final kh = await _loadJson('assets/langs/kh.json');

  appLocales = [
    MapLocale('en', en, countryCode: 'US'),
    MapLocale('km', kh, countryCode: 'KH'),
  ];
}

Future<Map<String, dynamic>> _loadJson(String path) async {
  final jsonStr = await rootBundle.loadString(path);
  return json.decode(jsonStr) as Map<String, dynamic>;
}
