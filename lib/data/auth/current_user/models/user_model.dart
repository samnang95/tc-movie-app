import '../../../../domain/auth/current_user/entities/user.dart';

/// Model representing stored user/auth data.
class UserModel {
  final String accessToken;

  const UserModel({required this.accessToken});

  /// Map data model → domain entity.
  User toEntity() {
    return User(
      accessToken: accessToken,
      isAuthenticated: true,
    );
  }
}
