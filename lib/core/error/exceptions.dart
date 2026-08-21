class AppException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  const AppException({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() => 'AppException($statusCode): $message';
}

class NetworkException extends AppException {
  const NetworkException({super.message = 'No internet connection'});
}

class TimeoutException extends AppException {
  const TimeoutException({super.message = 'Request timed out'});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({super.message = 'Unauthorized'})
      : super(statusCode: 401);
}

class NotFoundException extends AppException {
  const NotFoundException({super.message = 'Resource not found'})
      : super(statusCode: 404);
}

class ServerException extends AppException {
  const ServerException({
    super.message = 'Internal server error',
    int? statusCode,
  }) : super(statusCode: statusCode ?? 500);
}

class BadRequestException extends AppException {
  const BadRequestException({
    super.message = 'Bad request',
    super.data,
  }) : super(statusCode: 400);
}

class CacheException extends AppException {
  const CacheException({super.message = 'Cache error'});
}
