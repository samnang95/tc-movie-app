import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../domain/search/entities/search_item.dart';
import '../../../domain/search/repositories/search_repository.dart';
import '../datasources/search_remote_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource _remoteDataSource;

  SearchRepositoryImpl(this._remoteDataSource);

  @override
  Future<(Failure?, List<SearchItem>?)> getRecommended() async {
    try {
      final models = await _remoteDataSource.getRecommended();
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
