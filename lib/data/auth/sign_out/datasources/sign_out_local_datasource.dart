import '../../../../core/storage/secure_storage.dart';

/// Local data source for sign-out.
/// Clears all auth credentials from secure storage.
class SignOutLocalDataSource {
  final SecureStorage _secureStorage;

  SignOutLocalDataSource(this._secureStorage);

  /// Clear all stored tokens.
  Future<void> clearCredentials() => _secureStorage.clearAll();
}
