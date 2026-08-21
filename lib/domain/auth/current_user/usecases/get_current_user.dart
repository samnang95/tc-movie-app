import '../entities/user.dart';
import '../repositories/current_user_repository.dart';

/// Use case: Check if a valid user session exists.
class GetCurrentUser {
  final CurrentUserRepository _repository;

  GetCurrentUser(this._repository);

  Future<User> call() => _repository.getCurrentUser();
}
