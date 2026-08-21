import '../entities/user.dart';

/// Abstract repository contract for checking current user session.
abstract class CurrentUserRepository {
  Future<User> getCurrentUser();
}
