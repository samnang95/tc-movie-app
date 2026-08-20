import 'package:dio/dio.dart';

import '../../core/constants/app_constants.dart';
import '../models/auth_token_model.dart';

/// Auth API provider with its own Dio instance (no auth interceptor)
/// to avoid circular token refresh loops.
class AuthProvider {
  late final Dio _dio;

  AuthProvider() {
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

  /// Login with email and password.
  /// Returns [AuthTokenModel] on success.
  Future<AuthTokenModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    return AuthTokenModel.fromJson(response.data as Map<String, dynamic>);
  }

  /// Refresh the access token using a valid refresh token.
  /// Returns a new [AuthTokenModel] on success.
  Future<AuthTokenModel> refreshToken(String refreshToken) async {
    final response = await _dio.post('/auth/refresh', data: {
      'refresh_token': refreshToken,
    });
    return AuthTokenModel.fromJson(response.data as Map<String, dynamic>);
  }
}
