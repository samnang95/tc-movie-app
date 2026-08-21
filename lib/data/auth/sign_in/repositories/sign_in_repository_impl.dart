import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../domain/auth/sign_in/entities/sign_in_result.dart';
import '../../../../domain/auth/sign_in/repositories/sign_in_repository.dart';
import '../datasources/sign_in_remote_datasource.dart';
import '../models/sign_in_request_model.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInRemoteDataSource _remoteDataSource;
  final SecureStorage _secureStorage;

  SignInRepositoryImpl(this._remoteDataSource, this._secureStorage);

  @override
  Future<(Failure?, SignInResult?)> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.signIn(
        SignInRequestModel(email: email, password: password),
      );

      // Persist tokens
      await _secureStorage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        expiresAt: response.expiresAt?.toIso8601String(),
      );

      return (null, response.toEntity());
    } on UnauthorizedException {
      return (const AuthFailure('Invalid email or password'), null);
    } on NetworkException {
      return (const NetworkFailure(), null);
    } on AppException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (ServerFailure(e.toString()), null);
    }
  }
}
