import 'package:flutter/foundation.dart';

import '../../data/local/local_storage_service.dart';
import '../../data/local/storage_keys.dart';
import '../../data/models/auth_token_model.dart';
import '../../data/providers/auth_provider.dart';

/// Central auth service — single source of truth for authentication state.
///
/// Registered as singleton in service locator during [setupServiceLocator].
class AuthService {
  final AuthProvider _authProvider;
  final LocalStorageService _storage;

  AuthService({
    required this._authProvider,
    required this._storage,
  }) {
    _loadTokensFromStorage();
  }

  /// Reactive auth state for UI binding.
  final ValueNotifier<bool> isLoggedIn = ValueNotifier<bool>(false);

  /// In-memory token cache for fast access.
  String? _accessToken;
  String? _refreshToken;

  // ── Private helpers ───────────────────────────────────────────────────

  /// Load persisted tokens into memory on startup.
  void _loadTokensFromStorage() {
    _accessToken = _storage.getString(StorageKeys.authToken);
    _refreshToken = _storage.getString(StorageKeys.refreshToken);
    isLoggedIn.value = _accessToken != null;
  }

  // ── Public API ────────────────────────────────────────────────────────

  /// Returns the current access token, or `null` if not authenticated.
  String? getAccessToken() => _accessToken;

  /// Login with email and password.
  /// Stores tokens and updates auth state on success.
  Future<AuthTokenModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final tokenModel = await _authProvider.login(
        email: email,
        password: password,
      );
      await _saveTokens(tokenModel);
      return tokenModel;
    } catch (e) {
      if (kDebugMode) debugPrint('AuthService.login error: $e');
      rethrow;
    }
  }

  /// Refresh the access token using the stored refresh token.
  /// Returns `true` if refresh succeeded, `false` otherwise.
  Future<bool> refreshToken() async {
    if (_refreshToken == null) {
      await logout();
      return false;
    }

    try {
      final tokenModel = await _authProvider.refreshToken(_refreshToken!);
      await _saveTokens(tokenModel);
      return true;
    } catch (e) {
      if (kDebugMode) debugPrint('AuthService.refreshToken error: $e');
      await logout();
      return false;
    }
  }

  /// Clear all tokens and reset auth state.
  Future<void> logout() async {
    _accessToken = null;
    _refreshToken = null;
    isLoggedIn.value = false;

    await _storage.remove(StorageKeys.authToken);
    await _storage.remove(StorageKeys.refreshToken);
    await _storage.remove(StorageKeys.tokenExpiresAt);

    if (kDebugMode) debugPrint('AuthService: logged out');
  }

  // ── Private helpers ───────────────────────────────────────────────────

  Future<void> _saveTokens(AuthTokenModel tokenModel) async {
    _accessToken = tokenModel.accessToken;
    _refreshToken = tokenModel.refreshToken;
    isLoggedIn.value = true;

    await _storage.setString(StorageKeys.authToken, tokenModel.accessToken);
    await _storage.setString(
      StorageKeys.refreshToken,
      tokenModel.refreshToken,
    );
    if (tokenModel.expiresAt != null) {
      await _storage.setString(
        StorageKeys.tokenExpiresAt,
        tokenModel.expiresAt!.toIso8601String(),
      );
    }
  }
}
