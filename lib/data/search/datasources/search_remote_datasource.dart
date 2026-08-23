import '../../../domain/my_list/entities/movie_detail.dart';
import '../../../domain/search/entities/search.dart';

class SearchRemoteDataSource {
  Future<SearchData> getSearchData() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));

    return SearchData(
      trendingSearches: [
        'Cyberpunk 2077',
        'Interstellar',
        'Space Opera',
        'Dystopian',
        'Time Travel',
      ],
      recommended: [
        MovieDetail(
          title: 'Infinite Harmony',
          posterPath: 'assets/images/related_1_1787453232488.jpg',
          badges: ['ORIGINAL SERIES'],
          year: '2024',
          rating: 4.8,
          duration: '1h 45m',
          ageRating: 'PG-13',
          synopsis: 'Sci-Fi',
          cast: [],
          relatedMovies: [],
        ),
        MovieDetail(
          title: 'Midnight Run',
          posterPath: 'assets/images/related_2_1787453244858.jpg',
          badges: [],
          year: '2023',
          rating: 4.5,
          duration: '2h 10m',
          ageRating: 'R',
          synopsis: 'Action',
          cast: [],
          relatedMovies: [],
        ),
        MovieDetail(
          title: 'Chrome Hearts',
          posterPath: 'assets/images/related_3_1787453258578.jpg',
          badges: [],
          year: '2024',
          rating: 4.2,
          duration: '1h 55m',
          ageRating: 'PG-13',
          synopsis: 'Thriller',
          cast: [],
          relatedMovies: [],
        ),
        MovieDetail(
          title: 'Neon Shadows',
          posterPath: 'assets/images/related_4_1787453270743.jpg',
          badges: ['ORIGINAL SERIES'],
          year: '2024',
          rating: 4.9,
          duration: '2h 30m',
          ageRating: 'R',
          synopsis: 'Sci-Fi',
          cast: [],
          relatedMovies: [],
        ),
      ],
    );
  }
}
