import '../../../domain/home/homepage/entities/home.dart';
import '../../../domain/my_list/entities/movie_detail.dart';
import '../../../domain/profile/entities/watch_history_item.dart';

class HomeRemoteDataSource {
  Future<HomeData> getHomeData() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));

    return HomeData(
      heroMovie: MovieDetail(
        title: 'Project Red Moon',
        posterPath: 'assets/images/hero_poster_1787453176910.jpg',
        badges: ['4K HDR', 'Sci-Fi'],
        year: '2024',
        rating: 4.9,
        duration: '2h 14m',
        ageRating: 'PG-13',
        synopsis: 'A groundbreaking sci-fi epic.',
        cast: [],
        relatedMovies: [],
      ),
      continueWatching: [
        WatchHistoryItem(
          title: 'Shadow Protocol: Ep 4',
          imagePath: 'assets/images/related_3_1787453258578.jpg',
          subtitle: '32m remaining',
          progress: 0.65,
        ),
        WatchHistoryItem(
          title: 'The Last Silence',
          imagePath: 'assets/images/related_4_1787453270743.jpg',
          subtitle: '1h 14m remaining',
          progress: 0.30,
        ),
        WatchHistoryItem(
          title: 'Crimson Tide',
          imagePath: 'assets/images/related_1_1787453232488.jpg',
          subtitle: '45m remaining',
          progress: 0.50,
        ),
      ],
      trendingMovies: [
        MovieDetail(
          title: 'Neon Shadows',
          posterPath: 'assets/images/related_2_1787453244858.jpg',
          badges: [],
          year: '2023',
          rating: 4.7,
          duration: '1h 52m',
          ageRating: 'R',
          synopsis: 'Thriller',
          cast: [],
          relatedMovies: [],
        ),
        MovieDetail(
          title: 'Crimson Tide',
          posterPath: 'assets/images/related_1_1787453232488.jpg',
          badges: [],
          year: '2024',
          rating: 4.5,
          duration: '2h 05m',
          ageRating: 'PG-13',
          synopsis: 'Action',
          cast: [],
          relatedMovies: [],
        ),
      ],
      newReleases: [
        MovieDetail(
          title: 'Midnight Heist',
          posterPath: 'assets/images/related_3_1787453258578.jpg',
          badges: [],
          year: '2024',
          rating: 4.2,
          duration: '1h 45m',
          ageRating: 'R',
          synopsis: 'Action',
          cast: [],
          relatedMovies: [],
        ),
        MovieDetail(
          title: 'Solar Eclipse',
          posterPath: 'assets/images/related_4_1787453270743.jpg',
          badges: [],
          year: '2024',
          rating: 4.8,
          duration: '2h 20m',
          ageRating: 'PG',
          synopsis: 'Drama',
          cast: [],
          relatedMovies: [],
        ),
      ],
    );
  }
}
