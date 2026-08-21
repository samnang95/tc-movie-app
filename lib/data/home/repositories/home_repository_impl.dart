import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../domain/home/homepage/entities/home.dart';
import '../../../domain/home/homepage/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<(Failure?, List<HomeItem>?)> getHomeData() async {
    try {
      final models = await _remoteDataSource.getHomeData();
      final entities = models.map((m) => m.toEntity()).toList();
      return (null, entities);
    } on NetworkException {
      return (const NetworkFailure(), null);
    } on AppException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (ServerFailure(e.toString()), null);
    }
  }
}
