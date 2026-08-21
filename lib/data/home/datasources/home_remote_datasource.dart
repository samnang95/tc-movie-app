import '../../../core/network/api_client.dart';
import '../models/home_model.dart';

/// Remote data source for home page data.
class HomeRemoteDataSource {
  final ApiClient _apiClient;

  HomeRemoteDataSource(this._apiClient);

  /// GET /users
  Future<List<HomeModel>> getHomeData() async {
    final response = await _apiClient.get('/users');
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => HomeModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
