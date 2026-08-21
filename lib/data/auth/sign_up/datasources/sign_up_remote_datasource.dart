import '../../../../core/network/api_client.dart';
import '../models/sign_up_request_model.dart';
import '../models/sign_up_response_model.dart';

class SignUpRemoteDataSource {
  final ApiClient _apiClient;

  SignUpRemoteDataSource(this._apiClient);

  Future<SignUpResponseModel> signUp(SignUpRequestModel request) async {
    final response = await _apiClient.post(
      '/auth/register',
      data: request.toJson(),
    );
    return SignUpResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
