import '../entities/movie_detail.dart';
import '../repositories/my_list_repository.dart';

class GetMyListMovie {
  final MyListRepository repository;

  GetMyListMovie(this.repository);

  Future<MovieDetail> call() async {
    return await repository.getMyListMovie();
  }
}
