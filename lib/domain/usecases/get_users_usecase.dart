import '../../core/network/api_response.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository_interface.dart';

/// Use case: Fetch all users.
class GetUsersUseCase {
  final UserRepositoryInterface _repository;

  GetUsersUseCase(this._repository);

  Future<ApiResponse<List<UserEntity>>> call() => _repository.getUsers();
}
