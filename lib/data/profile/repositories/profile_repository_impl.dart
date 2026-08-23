import '../../../domain/profile/entities/profile.dart';
import '../../../domain/profile/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Profile> getProfile() async {
    return await remoteDataSource.getProfile();
  }
}
