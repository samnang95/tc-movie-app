import '../../../core/error/failures.dart';
import '../../../domain/home/homepage/entities/home.dart';
import '../../../domain/home/homepage/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<(Failure?, HomeData?)> getHomeData() async {
    try {
      final homeData = await _remoteDataSource.getHomeData();
      return (null, homeData);
    } catch (e) {
      return (const ServerFailure(), null);
    }
  }
}
