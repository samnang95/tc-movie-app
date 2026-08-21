import '../../../../core/error/failures.dart';

/// Abstract repository contract for token refresh.
abstract class RefreshTokenRepository {
  Future<(Failure?, bool?)> refreshToken();
}
