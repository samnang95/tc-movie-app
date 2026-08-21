import '../../../../core/error/failures.dart';
import '../entities/sign_in_result.dart';

/// Abstract repository contract for sign-in.
abstract class SignInRepository {
  Future<(Failure?, SignInResult?)> signIn({
    required String email,
    required String password,
  });
}
