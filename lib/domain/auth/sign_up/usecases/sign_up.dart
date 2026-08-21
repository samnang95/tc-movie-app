import '../../../../core/error/failures.dart';
import '../entities/sign_up_result.dart';
import '../repositories/sign_up_repository.dart';

class SignUp {
  final SignUpRepository _repository;

  SignUp(this._repository);

  Future<(Failure?, SignUpResult?)> call({
    required String fullName,
    required String email,
    required String password,
  }) =>
      _repository.signUp(fullName: fullName, email: email, password: password);
}
