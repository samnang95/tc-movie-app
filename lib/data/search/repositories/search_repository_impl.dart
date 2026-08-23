import '../../../core/error/failures.dart';
import '../../../domain/search/entities/search.dart';
import '../../../domain/search/entities/search_item.dart';
import '../../../domain/search/repositories/search_repository.dart';
import '../datasources/search_remote_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource _remoteDataSource;

  SearchRepositoryImpl(this._remoteDataSource);

  @override
  Future<(Failure?, SearchData?)> getSearchData() async {
    try {
      final data = await _remoteDataSource.getSearchData();
      return (null, data);
    } catch (e) {
      return (const ServerFailure(), null);
    }
  }

  @override
  Future<(Failure?, List<SearchItem>?)> getRecommended() async {
    return (null, <SearchItem>[]);
  }
}
