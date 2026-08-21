import '../../../../core/network/api_client.dart';
import '../models/sign_up_request_model.dart';
import '../models/sign_up_response_model.dart';

class SignUpRemoteDataSource {
  // ignore: unused_field
  final ApiClient _apiClient;

  SignUpRemoteDataSource(this._apiClient);

  Future<SignUpResponseModel> signUp(SignUpRequestModel request) async {
    // Mocking the API response
    await Future.delayed(const Duration(seconds: 1));
    return const SignUpResponseModel(
      accessToken: 'mock_access_token',
      refreshToken: 'mock_refresh_token',
    );
  }
}
