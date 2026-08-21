import '../../../../core/error/failures.dart';
import '../repositories/sign_out_repository.dart';

/// Use case: Sign out and clear credentials.
class SignOut {
  final SignOutRepository _repository;

  SignOut(this._repository);

  Future<(Failure?, bool?)> call() => _repository.signOut();
}
