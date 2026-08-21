import '../../../../core/error/failures.dart';
import '../entities/forgot_password_result.dart';

abstract class ForgotPasswordRepository {
  Future<(Failure?, ForgotPasswordResult?)> forgotPassword({
    required String email,
  });
}
