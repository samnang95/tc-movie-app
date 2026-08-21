import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Encrypted key-value storage for sensitive data (tokens, credentials).
class SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorage()
      : _storage = const FlutterSecureStorage(
          aOptions: AndroidOptions(encryptedSharedPreferences: true),
          iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
        );

  // ── Keys ──────────────────────────────────────────────────────────────
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _tokenExpiresAtKey = 'token_expires_at';

  // ── Access Token ──────────────────────────────────────────────────────
  Future<void> saveAccessToken(String token) => _storage.write(key: _accessTokenKey, value: token);
  Future<String?> getAccessToken() => _storage.read(key: _accessTokenKey);
  Future<void> deleteAccessToken() => _storage.delete(key: _accessTokenKey);

  // ── Refresh Token ─────────────────────────────────────────────────────
  Future<void> saveRefreshToken(String token) => _storage.write(key: _refreshTokenKey, value: token);
  Future<String?> getRefreshToken() => _storage.read(key: _refreshTokenKey);
  Future<void> deleteRefreshToken() => _storage.delete(key: _refreshTokenKey);

  // ── Token Expiry ──────────────────────────────────────────────────────
  Future<void> saveTokenExpiresAt(String isoDate) => _storage.write(key: _tokenExpiresAtKey, value: isoDate);
  Future<String?> getTokenExpiresAt() => _storage.read(key: _tokenExpiresAtKey);
  Future<void> deleteTokenExpiresAt() => _storage.delete(key: _tokenExpiresAtKey);

  /// Save both tokens and optional expiry in one call.
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String? expiresAt,
  }) async {
    await saveAccessToken(accessToken);
    await saveRefreshToken(refreshToken);
    if (expiresAt != null) {
      await saveTokenExpiresAt(expiresAt);
    }
  }

  /// Clear all auth-related data.
  Future<void> clearAll() async {
    await deleteAccessToken();
    await deleteRefreshToken();
    await deleteTokenExpiresAt();
  }
}
