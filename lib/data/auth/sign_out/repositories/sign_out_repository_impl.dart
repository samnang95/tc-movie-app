import '../../../../core/error/failures.dart';
import '../../../../domain/auth/sign_out/repositories/sign_out_repository.dart';
import '../datasources/sign_out_local_datasource.dart';

class SignOutRepositoryImpl implements SignOutRepository {
  final SignOutLocalDataSource _localDataSource;

  SignOutRepositoryImpl(this._localDataSource);

  @override
  Future<(Failure?, bool?)> signOut() async {
    try {
      await _localDataSource.clearCredentials();
      return (null, true);
    } catch (e) {
      return (CacheFailure(e.toString()), null);
    }
  }
}
