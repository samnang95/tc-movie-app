import '../../../../core/error/failures.dart';
import '../entities/forgot_password_result.dart';
import '../repositories/forgot_password_repository.dart';

class ForgotPassword {
  final ForgotPasswordRepository _repository;

  ForgotPassword(this._repository);

  Future<(Failure?, ForgotPasswordResult?)> call({
    required String email,
  }) =>
      _repository.forgotPassword(email: email);
}
