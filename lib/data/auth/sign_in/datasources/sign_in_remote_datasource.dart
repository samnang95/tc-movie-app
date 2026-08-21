import '../../../../core/network/api_client.dart';
import '../models/sign_in_request_model.dart';
import '../models/sign_in_response_model.dart';

/// Remote data source for sign-in.
/// Directly communicates with the API via [ApiClient].
class SignInRemoteDataSource {
  // ignore: unused_field
  final ApiClient _apiClient;

  SignInRemoteDataSource(this._apiClient);

  /// POST /auth/login
  Future<SignInResponseModel> signIn(SignInRequestModel request) async {
    // Mocking the API response since JSONPlaceholder doesn't have /auth/login
    await Future.delayed(const Duration(seconds: 1));
    return const SignInResponseModel(
      accessToken: 'mock_access_token',
      refreshToken: 'mock_refresh_token',
    );
  }
}
