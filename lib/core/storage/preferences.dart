import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  late final SharedPreferences _prefs;
  Future<void> init() async { _prefs = await SharedPreferences.getInstance();}
  // ── Keys ──────────────────────────────────────────────────────────────
  static const _isFirstLaunchKey = 'is_first_launch';
  static const _themeModeKey = 'theme_mode';
  static const _languageCodeKey = 'language_code';

  // ── First Launch ──────────────────────────────────────────────────────
  bool get isFirstLaunch => _prefs.getBool(_isFirstLaunchKey) ?? true;
  Future<bool> setFirstLaunchDone() => _prefs.setBool(_isFirstLaunchKey, false);

  // ── Theme ─────────────────────────────────────────────────────────────
  String? get themeMode => _prefs.getString(_themeModeKey);
  Future<bool> setThemeMode(String mode) => _prefs.setString(_themeModeKey, mode);

  // ── Language ──────────────────────────────────────────────────────────
  String get languageCode => _prefs.getString(_languageCodeKey) ?? 'en';
  Future<bool> setLanguageCode(String code) => _prefs.setString(_languageCodeKey, code);

  // ── Generic ───────────────────────────────────────────────────────────
  Future<bool> setString(String key, String value) => _prefs.setString(key, value);
  String? getString(String key) => _prefs.getString(key);
  Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);
  bool? getBool(String key) => _prefs.getBool(key);
  Future<bool> remove(String key) => _prefs.remove(key);
  Future<bool> clear() => _prefs.clear();
}
