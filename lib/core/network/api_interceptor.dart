import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../storage/secure_storage.dart';
import '../../domain/auth/refresh_token/usecases/refresh_token.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Attach auth token if available
    try {
      final secureStorage = GetIt.instance<SecureStorage>();
      final token = await secureStorage.getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (_) {
      // SecureStorage not yet registered — skip
    }

    if (kDebugMode) {
      debugPrint('┌─────────────────────────────────────────────');
      debugPrint('│ REQUEST: ${options.method} ${options.uri}');
      if (options.queryParameters.isNotEmpty) {
        debugPrint('│ PARAMS: ${options.queryParameters}');
      }
      if (options.data != null) {
        debugPrint('│ BODY: ${options.data}');
      }
      debugPrint('└─────────────────────────────────────────────');
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('┌─────────────────────────────────────────────');
      debugPrint(
        '│ RESPONSE [${response.statusCode}]: '
        '${response.requestOptions.method} '
        '${response.requestOptions.uri}',
      );
      debugPrint('└─────────────────────────────────────────────');
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      debugPrint('┌─────────────────────────────────────────────');
      debugPrint(
        '│ ERROR [${err.response?.statusCode}]: '
        '${err.requestOptions.method} '
        '${err.requestOptions.uri}',
      );
      debugPrint('│ MESSAGE: ${err.message}');
      debugPrint('└─────────────────────────────────────────────');
    }

    // Handle 401 — attempt token refresh and retry
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = GetIt.instance<RefreshToken>();
        final (failure, _) = await refreshToken();

        if (failure == null) {
          // Retry the original request with the new token
          final options = err.requestOptions;
          final secureStorage = GetIt.instance<SecureStorage>();
          final newToken = await secureStorage.getAccessToken();
          options.headers['Authorization'] = 'Bearer $newToken';

          final dio = Dio();
          final response = await dio.fetch(options);
          return handler.resolve(response);
        }
      } catch (_) {
        // Refresh failed — fall through to error
      }
    }

    handler.next(err);
  }
}
