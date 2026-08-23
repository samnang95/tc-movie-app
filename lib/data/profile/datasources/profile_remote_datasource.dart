import '../../../domain/profile/entities/profile.dart';
import '../../../domain/profile/entities/watch_history_item.dart';
import '../../../domain/my_list/entities/movie_detail.dart';

abstract class ProfileRemoteDataSource {
  Future<Profile> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<Profile> getProfile() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));

    // Return mock data
    return Profile(
      name: 'Julian Sterling',
      avatarPath: 'assets/images/cast_james_1787453191643.jpg',
      isPremium: true,
      myList: [
        MovieDetail(
          title: 'Project Red Moon',
          posterPath: 'assets/images/related_1_1787453232488.jpg',
          badges: ['4K HDR'],
          year: '2024',
          rating: 4.9,
          duration: '2h 14m',
          ageRating: 'PG-13',
          synopsis: 'Sci-Fi', // Using synopsis for Genre in this mini view
          cast: [],
          relatedMovies: [],
        ),
        MovieDetail(
          title: 'Neon Shadows',
          posterPath: 'assets/images/related_2_1787453244858.jpg',
          badges: [],
          year: '2023',
          rating: 4.7,
          duration: '1h 52m',
          ageRating: 'R',
          synopsis: 'Thriller', // Using synopsis for Genre in this mini view
          cast: [],
          relatedMovies: [],
        ),
      ],
      watchHistory: [
        WatchHistoryItem(
          title: 'The Last Archive',
          imagePath: 'assets/images/related_3_1787453258578.jpg',
          subtitle: '15m remaining',
          progress: 0.8,
        ),
        WatchHistoryItem(
          title: 'Silent Echoes',
          imagePath: 'assets/images/related_4_1787453270743.jpg',
          subtitle: 'Watched yesterday',
          progress: 1.0,
        ),
      ],
    );
  }
}
