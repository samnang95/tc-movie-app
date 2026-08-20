import '../../core/network/api_exceptions.dart';
import '../../core/network/api_response.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository_interface.dart';
import '../providers/user_provider.dart';

class UserRepository implements UserRepositoryInterface {
  final UserProvider _userProvider;

  UserRepository(this._userProvider);

  @override
  Future<ApiResponse<List<UserEntity>>> getUsers() async {
    try {
      final models = await _userProvider.getUsers();
      final entities = models.map((m) => m.toEntity()).toList();
      return ApiResponse.success(entities, statusCode: 200);
    } on ApiException catch (e) {
      return ApiResponse.error(e.message, statusCode: e.statusCode);
    }
  }

  @override
  Future<ApiResponse<UserEntity>> getUserById(int id) async {
    try {
      final model = await _userProvider.getUserById(id);
      return ApiResponse.success(model.toEntity(), statusCode: 200);
    } on ApiException catch (e) {
      return ApiResponse.error(e.message, statusCode: e.statusCode);
    }
  }
}
