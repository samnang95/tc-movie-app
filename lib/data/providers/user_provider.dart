import '../../core/network/api_client.dart';
import '../models/user_model.dart';

class UserProvider {
  final ApiClient _apiClient;

  UserProvider(this._apiClient);

  Future<List<UserModel>> getUsers() async {
    final response = await _apiClient.get('/users');
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<UserModel> getUserById(int id) async {
    final response = await _apiClient.get('/users/$id');
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }
}
