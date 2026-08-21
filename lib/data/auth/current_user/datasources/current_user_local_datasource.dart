import '../../../../core/storage/secure_storage.dart';
import '../models/user_model.dart';

/// Local data source for current user session.
/// Reads stored tokens from [SecureStorage].
class CurrentUserLocalDataSource {
  final SecureStorage _secureStorage;

  CurrentUserLocalDataSource(this._secureStorage);

  /// Returns [UserModel] if a valid access token exists, null otherwise.
  Future<UserModel?> getCurrentUser() async {
    final accessToken = await _secureStorage.getAccessToken();
    if (accessToken == null || accessToken.isEmpty) return null;
    return UserModel(accessToken: accessToken);
  }
}
