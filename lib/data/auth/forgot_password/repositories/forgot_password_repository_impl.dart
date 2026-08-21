import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../domain/auth/forgot_password/entities/forgot_password_result.dart';
import '../../../../domain/auth/forgot_password/repositories/forgot_password_repository.dart';
import '../datasources/forgot_password_remote_datasource.dart';
import '../models/forgot_password_request_model.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordRemoteDataSource _remoteDataSource;

  ForgotPasswordRepositoryImpl(this._remoteDataSource);

  @override
  Future<(Failure?, ForgotPasswordResult?)> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await _remoteDataSource.forgotPassword(
        ForgotPasswordRequestModel(email: email),
      );
      return (null, response.toEntity());
    } on NotFoundException {
      return (const AuthFailure('No account found with this email'), null);
    } on NetworkException {
      return (const NetworkFailure(), null);
    } on AppException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (ServerFailure(e.toString()), null);
    }
  }
}
