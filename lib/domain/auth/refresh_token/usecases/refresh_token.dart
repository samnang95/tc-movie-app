import '../../../../core/error/failures.dart';
import '../repositories/refresh_token_repository.dart';

/// Use case: Refresh an expired access token.
class RefreshToken {
  final RefreshTokenRepository _repository;

  RefreshToken(this._repository);

  Future<(Failure?, bool?)> call() => _repository.refreshToken();
}
