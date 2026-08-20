import '../../core/network/api_response.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository_interface.dart';

/// Use case: Fetch a single user by ID.
class GetUserByIdUseCase {
  final UserRepositoryInterface _repository;

  GetUserByIdUseCase(this._repository);

  Future<ApiResponse<UserEntity>> call(int id) => _repository.getUserById(id);
}
