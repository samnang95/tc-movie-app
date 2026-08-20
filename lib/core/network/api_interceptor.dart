import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../services/auth_service.dart';

/// Interceptor that:
/// 1. Attaches Bearer token to every request
/// 2. Handles 401 responses by refreshing the token and retrying
/// 3. Logs requests/responses/errors in debug mode
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Attach auth token if available
    try {
      final authService = GetIt.instance<AuthService>();
      final token = authService.getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (_) {
      // AuthService not yet registered — skip
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
        final authService = GetIt.instance<AuthService>();
        final refreshed = await authService.refreshToken();

        if (refreshed) {
          // Retry the original request with the new token
          final options = err.requestOptions;
          final newToken = authService.getAccessToken();
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
