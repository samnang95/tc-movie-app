import 'package:dio/dio.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/storage/secure_storage.dart';

/// Remote data source for token refresh.
/// Uses its own Dio instance (no auth interceptor) to avoid circular refresh loops.
class RefreshTokenRemoteDataSource {
  late final Dio _dio;
  final SecureStorage _secureStorage;

  RefreshTokenRemoteDataSource(this._secureStorage) {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: AppConstants.connectTimeout,
        receiveTimeout: AppConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  /// POST /auth/refresh
  /// Returns the new access token on success.
  Future<Map<String, dynamic>> refresh(String refreshToken) async {
    final response = await _dio.post(
      '/auth/refresh',
      data: {'refresh_token': refreshToken},
    );
    return response.data as Map<String, dynamic>;
  }

  /// Read the stored refresh token.
  Future<String?> getStoredRefreshToken() =>
      _secureStorage.getRefreshToken();

  /// Save new tokens after a successful refresh.
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String? expiresAt,
  }) =>
      _secureStorage.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresAt: expiresAt,
      );

  /// Clear all tokens (failed refresh → force logout).
  Future<void> clearTokens() => _secureStorage.clearAll();
}
