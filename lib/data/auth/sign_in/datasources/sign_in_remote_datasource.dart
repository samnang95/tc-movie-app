import '../../../../core/network/api_client.dart';
import '../models/sign_in_request_model.dart';
import '../models/sign_in_response_model.dart';

/// Remote data source for sign-in.
/// Directly communicates with the API via [ApiClient].
class SignInRemoteDataSource {
  final ApiClient _apiClient;

  SignInRemoteDataSource(this._apiClient);

  /// POST /auth/login
  Future<SignInResponseModel> signIn(SignInRequestModel request) async {
    final response = await _apiClient.post(
      '/auth/login',
      data: request.toJson(),
    );
    return SignInResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
