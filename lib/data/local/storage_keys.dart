/// Keys used for local storage to avoid hardcoded strings.
abstract class StorageKeys {
  StorageKeys._();

  // Auth
  static const String authToken = 'auth_token';
  static const String refreshToken = 'refresh_token';
  static const String tokenExpiresAt = 'token_expires_at';
  static const String userId = 'user_id';

  // App
  static const String isFirstLaunch = 'is_first_launch';
  static const String themeMode = 'theme_mode';
  static const String languageCode = 'language_code';
}
