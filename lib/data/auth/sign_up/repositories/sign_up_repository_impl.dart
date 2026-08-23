import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../domain/auth/sign_up/entities/sign_up_result.dart';
import '../../../../domain/auth/sign_up/repositories/sign_up_repository.dart';
import '../datasources/sign_up_remote_datasource.dart';
import '../models/sign_up_request_model.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource _remoteDataSource;
  final SecureStorage _secureStorage;

  SignUpRepositoryImpl(this._remoteDataSource, this._secureStorage);

  @override
  Future<(Failure?, SignUpResult?)> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.signUp(
        SignUpRequestModel(
          fullName: fullName,
          email: email,
          password: password,
        ),
      );

      await _secureStorage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        expiresAt: response.expiresAt?.toIso8601String(),
      );

      return (null, response.toEntity());
    } on ConflictException {
      return (
        const AuthFailure('An account with this email already exists'),
        null,
      );
    } on NetworkException {
      return (const NetworkFailure(), null);
    } on AppException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (ServerFailure(e.toString()), null);
    }
  }
}
