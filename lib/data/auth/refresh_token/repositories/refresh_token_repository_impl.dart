import '../../../../core/error/failures.dart';
import '../../../../domain/auth/refresh_token/repositories/refresh_token_repository.dart';
import '../datasources/refresh_token_remote_datasource.dart';

class RefreshTokenRepositoryImpl implements RefreshTokenRepository {
  final RefreshTokenRemoteDataSource _remoteDataSource;

  RefreshTokenRepositoryImpl(this._remoteDataSource);

  @override
  Future<(Failure?, bool?)> refreshToken() async {
    try {
      final storedRefreshToken =
          await _remoteDataSource.getStoredRefreshToken();

      if (storedRefreshToken == null || storedRefreshToken.isEmpty) {
        await _remoteDataSource.clearTokens();
        return (const AuthFailure('No refresh token available'), null);
      }

      final data = await _remoteDataSource.refresh(storedRefreshToken);

      await _remoteDataSource.saveTokens(
        accessToken: data['access_token'] as String,
        refreshToken: data['refresh_token'] as String,
        expiresAt: data['expires_at'] as String?,
      );

      return (null, true);
    } catch (e) {
      // Refresh failed — clear everything and force re-login
      await _remoteDataSource.clearTokens();
      return (const AuthFailure('Session expired. Please sign in again.'), null);
    }
  }
}
