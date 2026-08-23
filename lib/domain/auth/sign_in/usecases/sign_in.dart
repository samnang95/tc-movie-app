import '../../../../core/error/failures.dart';
import '../entities/sign_in_result.dart';
import '../repositories/sign_in_repository.dart';

/// Use case: Sign in with email and password.
class SignIn {
  final SignInRepository _repository;

  SignIn(this._repository);

  Future<(Failure?, SignInResult?)> call({
    required String email,
    required String password,
  }) => _repository.signIn(email: email, password: password);
}
