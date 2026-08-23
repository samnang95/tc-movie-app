import '../../../my_list/entities/movie_detail.dart';
import '../../../profile/entities/watch_history_item.dart';

class HomeData {
  final MovieDetail heroMovie;
  final List<WatchHistoryItem> continueWatching;
  final List<MovieDetail> trendingMovies;
  final List<MovieDetail> newReleases;

  const HomeData({
    required this.heroMovie,
    required this.continueWatching,
    required this.trendingMovies,
    required this.newReleases,
  });
}
