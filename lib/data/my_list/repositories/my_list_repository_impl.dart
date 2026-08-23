import '../../../domain/my_list/entities/movie_detail.dart';
import '../../../domain/my_list/repositories/my_list_repository.dart';
import '../datasources/my_list_remote_datasource.dart';

class MyListRepositoryImpl implements MyListRepository {
  final MyListRemoteDataSource remoteDataSource;

  MyListRepositoryImpl(this.remoteDataSource);

  @override
  Future<MovieDetail> getMyListMovie() async {
    return await remoteDataSource.getMyListMovie();
  }
}
