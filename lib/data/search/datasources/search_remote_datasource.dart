import '../../../core/network/api_client.dart';
import '../models/search_model.dart';

/// Remote data source for search data.
class SearchRemoteDataSource {
  // ignore: unused_field
  final ApiClient _apiClient;

  SearchRemoteDataSource(this._apiClient);

  /// Mocked: Returns recommended movies for development.
  Future<List<SearchModel>> getRecommended() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      SearchModel(
        id: 1,
        title: 'Shadow Protocol',
        genre: 'Thriller',
        duration: '2h 15m',
        is4K: true,
        isNew: true,
      ),
      SearchModel(
        id: 2,
        title: 'Neon Velocity',
        genre: 'Action',
        duration: '1h 48m',
        is4K: true,
        isNew: false,
      ),
      SearchModel(
        id: 3,
        title: 'Dark Matter',
        genre: 'Sci-Fi',
        duration: '2h 02m',
        is4K: false,
        isNew: true,
      ),
      SearchModel(
        id: 4,
        title: 'Crimson Dawn',
        genre: 'Drama',
        duration: '1h 56m',
        is4K: false,
        isNew: false,
      ),
    ];
  }
}
