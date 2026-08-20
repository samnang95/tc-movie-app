import '../../core/network/api_response.dart';
import '../entities/user_entity.dart';

/// Abstract repository contract for User operations.
/// Data layer implements this; domain/presentation layers depend on it.
abstract class UserRepositoryInterface {
  Future<ApiResponse<List<UserEntity>>> getUsers();
  Future<ApiResponse<UserEntity>> getUserById(int id);
}
