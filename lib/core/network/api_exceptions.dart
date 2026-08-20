class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  const ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() => 'ApiException($statusCode): $message';
}

class NetworkException extends ApiException {
  const NetworkException({super.message = 'No internet connection'});
}

class TimeoutException extends ApiException {
  const TimeoutException({super.message = 'Request timed out'});
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException({super.message = 'Unauthorized'})
      : super(statusCode: 401);
}

class NotFoundException extends ApiException {
  const NotFoundException({super.message = 'Resource not found'})
      : super(statusCode: 404);
}

class ServerException extends ApiException {
  const ServerException({
    super.message = 'Internal server error',
    int? statusCode,
  }) : super(statusCode: statusCode ?? 500);
}

class BadRequestException extends ApiException {
  const BadRequestException({
    super.message = 'Bad request',
    super.data,
  }) : super(statusCode: 400);
}
