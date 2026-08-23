import '../entities/movie_detail.dart';

abstract class MyListRepository {
  Future<MovieDetail> getMyListMovie();
}
