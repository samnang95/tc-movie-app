import '../../../../domain/auth/current_user/entities/user.dart';
import '../../../../domain/auth/current_user/repositories/current_user_repository.dart';
import '../datasources/current_user_local_datasource.dart';

class CurrentUserRepositoryImpl implements CurrentUserRepository {
  final CurrentUserLocalDataSource _localDataSource;

  CurrentUserRepositoryImpl(this._localDataSource);

  @override
  Future<User> getCurrentUser() async {
    final userModel = await _localDataSource.getCurrentUser();
    if (userModel == null) return const User.unauthenticated();
    return userModel.toEntity();
  }
}
