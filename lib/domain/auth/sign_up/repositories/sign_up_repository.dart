import '../../../../core/error/failures.dart';
import '../entities/sign_up_result.dart';

abstract class SignUpRepository {
  Future<(Failure?, SignUpResult?)> signUp({
    required String fullName,
    required String email,
    required String password,
  });
}
