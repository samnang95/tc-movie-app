import '../../../domain/my_list/entities/movie_detail.dart';

abstract class MyListRemoteDataSource {
  Future<MovieDetail> getMyListMovie();
}

class MyListRemoteDataSourceImpl implements MyListRemoteDataSource {
  @override
  Future<MovieDetail> getMyListMovie() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));

    // Return mock data directly mapping to the domain entity
    return MovieDetail(
      title: 'NEON CHRONICLES',
      posterPath: 'assets/images/hero_poster_1787453176910.jpg',
      badges: ['4K ULTRA HD', 'Sci-Fi', 'HDR'],
      year: '2024',
      rating: 8.9,
      duration: '2h 24m',
      ageRating: 'PG-13',
      synopsis:
          "In a world where memories are traded like currency, a rogue detective discovers a suppressed data stream that could collapse the city's neon-lit hierarchy. As the lines between reality and simulation blur, he must navigate the shadows of a digital underworld to protect the last remaining human secret.",
      cast: [
        CastMember(
          name: 'James Reed',
          imagePath: 'assets/images/cast_james_1787453191643.jpg',
        ),
        CastMember(
          name: 'Elena Vance',
          imagePath: 'assets/images/cast_elena_1787453203729.jpg',
        ),
        CastMember(
          name: 'Marcus Cole',
          imagePath: 'assets/images/cast_marcus_1787453214392.jpg',
        ),
      ],
      relatedMovies: [
        'assets/images/related_1_1787453232488.jpg',
        'assets/images/related_2_1787453244858.jpg',
        'assets/images/related_3_1787453258578.jpg',
        'assets/images/related_4_1787453270743.jpg',
      ],
    );
  }
}
